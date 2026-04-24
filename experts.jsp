<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="pageTitleOverride" value="Browse Experts — MentorMarket" />

<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/experts.css">
</head>
<body>

<jsp:include page="/WEB-INF/includes/navbar.jsp" />

  <div class="experts-page">
    <section class="page-hero">
      <div class="page-hero__content">
        <div class="page-hero__breadcrumb">
          <a href="index.jsp">Home</a>
          <span>/</span>
          <span>Browse Experts</span>
        </div>
        <h1>Find Your Expert Mentor</h1>
        <form method="GET" action="experts.jsp" class="page-hero__search-form">
          <svg class="page-hero__search-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="11" cy="11" r="8"/>
            <line x1="21" y1="21" x2="16.65" y2="16.65"/>
          </svg>
          <input type="text" name="keyword" class="page-hero__search-input" placeholder="Search by name, expertise, or company..." value="${not empty param.keyword ? param.keyword : ''}">
          <button type="submit" class="page-hero__search-btn">Search</button>
        </form>
      </div>
    </section>

    <div class="mobile-filter-bar">
      <button class="btn btn--secondary" data-action="open-filter">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <line x1="4" y1="6" x2="20" y2="6"/>
          <line x1="4" y1="12" x2="20" y2="12"/>
          <line x1="4" y1="18" x2="20" y2="18"/>
        </svg>
        Filters
      </button>
      <form method="GET" action="experts.jsp" class="mobile-sort-form">
        <c:if test="${not empty param.keyword}"><input type="hidden" name="keyword" value="${param.keyword}"></c:if>
        <c:if test="${not empty param.domainId}"><input type="hidden" name="domainId" value="${param.domainId}"></c:if>
        <button type="submit" name="sort" value="${param.sort}" class="btn btn--secondary">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <line x1="12" y1="5" x2="12" y2="19"/>
            <polyline points="19 12 12 19 5 12"/>
          </svg>
          <span>Sort</span>
        </button>
      </form>
    </div>

    <main class="experts-content">
      <aside class="filter-sidebar">
        <form method="GET" action="experts.jsp" class="filter-form">
          <c:if test="${not empty param.keyword}"><input type="hidden" name="keyword" value="${param.keyword}"></c:if>
          <c:if test="${not empty param.sort}"><input type="hidden" name="sort" value="${param.sort}"></c:if>
          
          <div class="filter-section">
            <h4 class="filter-section__title">Domain</h4>
            <div class="filter-section__options">
              <c:choose>
                <c:when test="${not empty domainList}">
                  <c:forEach var="domain" items="${domainList}">
                    <label class="filter-checkbox">
                      <input type="checkbox" name="domainId" value="${domain.domainId}" 
                        <c:if test="${param.domainId == domain.domainId}">checked</c:if>>
                      <span class="filter-checkbox__label">${domain.name}</span>
                      <span class="filter-checkbox__count">${domain.expertCount}</span>
                    </label>
                  </c:forEach>
                </c:when>
                <c:otherwise>
                  <label class="filter-checkbox">
                    <input type="checkbox" name="domainId" value="1" <c:if test="${param.domainId == 1}">checked</c:if>>
                    <span class="filter-checkbox__label">Finance</span>
                    <span class="filter-checkbox__count">45</span>
                  </label>
                  <label class="filter-checkbox">
                    <input type="checkbox" name="domainId" value="2" <c:if test="${param.domainId == 2}">checked</c:if>>
                    <span class="filter-checkbox__label">Technology</span>
                    <span class="filter-checkbox__count">38</span>
                  </label>
                  <label class="filter-checkbox">
                    <input type="checkbox" name="domainId" value="3" <c:if test="${param.domainId == 3}">checked</c:if>>
                    <span class="filter-checkbox__label">Sales</span>
                    <span class="filter-checkbox__count">32</span>
                  </label>
                  <label class="filter-checkbox">
                    <input type="checkbox" name="domainId" value="4" <c:if test="${param.domainId == 4}">checked</c:if>>
                    <span class="filter-checkbox__label">Operations</span>
                    <span class="filter-checkbox__count">28</span>
                  </label>
                  <label class="filter-checkbox">
                    <input type="checkbox" name="domainId" value="5" <c:if test="${param.domainId == 5}">checked</c:if>>
                    <span class="filter-checkbox__label">Marketing</span>
                    <span class="filter-checkbox__count">25</span>
                  </label>
                </c:otherwise>
              </c:choose>
            </div>
          </div>

          <div class="filter-section">
            <h4 class="filter-section__title">Price Range</h4>
            <div class="filter-section__options filter-range">
              <div class="filter-range__inputs">
                <div class="filter-range__input-group">
                  <span class="filter-range__currency">₹</span>
                  <input type="number" name="minRate" class="filter-range__input" placeholder="Min" value="${not empty param.minRate ? param.minRate : ''}">
                </div>
                <span class="filter-range__separator">to</span>
                <div class="filter-range__input-group">
                  <span class="filter-range__currency">₹</span>
                  <input type="number" name="maxRate" class="filter-range__input" placeholder="Max" value="${not empty param.maxRate ? param.maxRate : ''}">
                </div>
              </div>
            </div>
          </div>

          <div class="filter-section">
            <h4 class="filter-section__title">Experience</h4>
            <div class="filter-section__options">
              <label class="filter-radio">
                <input type="radio" name="minExperience" value="" <c:if test="${empty param.minExperience}">checked>
                <span class="filter-radio__label">Any</span>
              </label>
              <label class="filter-radio">
                <input type="radio" name="minExperience" value="15" <c:if test="${param.minExperience == 15}">checked>
                <span class="filter-radio__label">15+ years</span>
              </label>
              <label class="filter-radio">
                <input type="radio" name="minExperience" value="20" <c:if test="${param.minExperience == 20}">checked>
                <span class="filter-radio__label">20+ years</span>
              </label>
              <label class="filter-radio">
                <input type="radio" name="minExperience" value="25" <c:if test="${param.minExperience == 25}">checked>
                <span class="filter-radio__label">25+ years</span>
              </label>
            </div>
          </div>

          <div class="filter-section">
            <h4 class="filter-section__title">Minimum Rating</h4>
            <div class="filter-section__options">
              <label class="filter-radio">
                <input type="radio" name="minRating" value="" <c:if test="${empty param.minRating}">checked>
                <span class="filter-radio__label">Any</span>
              </label>
              <label class="filter-radio">
                <input type="radio" name="minRating" value="4.5" <c:if test="${param.minRating == 4.5}">checked>
                <span class="filter-radio__label">4.5+</span>
              </label>
              <label class="filter-radio">
                <input type="radio" name="minRating" value="4.0" <c:if test="${param.minRating == 4.0}">checked>
                <span class="filter-radio__label">4.0+</span>
              </label>
            </div>
          </div>

          <button type="submit" class="btn btn--primary filter-form__apply">Apply Filters</button>
          <a href="experts.jsp" class="filter-form__clear">Clear All Filters</a>
        </form>
      </aside>

      <div class="results-area">
        <div class="results-header">
          <p class="results-header__count">
            <c:choose>
              <c:when test="${not empty totalCount && totalCount > 0}">
                Showing ${not empty startIndex ? startIndex : 1} to ${not empty endIndex ? endIndex : expertsList.size()} of ${totalCount} experts
              </c:when>
              <c:when test="${not empty expertsList}">
                Showing ${expertsList.size()} experts
              </c:when>
              <c:otherwise>
                No experts found
              </c:otherwise>
            </c:choose>
          </p>
          <form method="GET" action="experts.jsp" class="sort-dropdown">
            <c:if test="${not empty param.keyword}"><input type="hidden" name="keyword" value="${param.keyword}"></c:if>
            <c:if test="${not empty param.domainId}"><input type="hidden" name="domainId" value="${param.domainId}"></c:if>
            <c:if test="${not empty param.minRate}"><input type="hidden" name="minRate" value="${param.minRate}"></c:if>
            <c:if test="${not empty param.maxRate}"><input type="hidden" name="maxRate" value="${param.maxRate}"></c:if>
            <c:if test="${not empty param.minExperience}"><input type="hidden" name="minExperience" value="${param.minExperience}"></c:if>
            <c:if test="${not empty param.minRating}"><input type="hidden" name="minRating" value="${param.minRating}"></c:if>
            <select name="sort" class="sort-dropdown__select" onchange="this.form.submit()">
              <option value="best_match" <c:if test="${param.sort == 'best_match' || empty param.sort}">selected</c:if>>Best Match</option>
              <option value="highest_rated" <c:if test="${param.sort == 'highest_rated'}">selected</c:if>>Highest Rated</option>
              <option value="most_sessions" <c:if test="${param.sort == 'most_sessions'}">selected</c:if>>Most Sessions</option>
              <option value="price_low" <c:if test="${param.sort == 'price_low'}">selected</c:if>>Price: Low to High</option>
              <option value="price_high" <c:if test="${param.sort == 'price_high'}">selected</c:if>>Price: High to Low</option>
            </select>
            <svg class="sort-dropdown__icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <polyline points="6 9 12 15 18 9"/>
            </svg>
          </form>
        </div>
        
        <div class="expert-cards-grid">
          <c:choose>
            <c:when test="${not empty expertsList}">
              <c:forEach var="expert" items="${expertsList}">
                <div class="expert-card">
                  <div class="expert-card__header">
                    <c:choose>
                      <c:when test="${not empty expert.photoPath}">
                        <img src="${expert.photoPath}" alt="${expert.firstName}" class="expert-card__photo" onerror="this.style.display='none'">
                      </c:when>
                      <c:otherwise>
                        <div class="expert-card__photo expert-card__photo--placeholder">${expert.firstName.substring(0,1)}${expert.lastName.substring(0,1)}</div>
                      </c:otherwise>
                    </c:choose>
                    <div class="expert-card__badges">
                      <c:if test="${expert.featured}">
                        <span class="expert-card__badge expert-card__badge--featured">Featured</span>
                      </c:if>
                      <c:if test="${expert.verified}">
                        <span class="expert-card__badge expert-card__badge--verified">Verified</span>
                      </c:if>
                    </div>
                  </div>
                  <div class="expert-card__body">
                    <h3 class="expert-card__name">${expert.firstName} ${expert.lastName}</h3>
                    <p class="expert-card__title">${expert.jobTitle}<c:if test="${not empty expert.company}"> at ${expert.company}</c:if></p>
                    <div class="expert-card__rating">
                      <svg viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                      </svg>
                      <span>${expert.rating}</span>
                      <span class="expert-card__reviews">(${expert.reviewCount} reviews)</span>
                    </div>
                    <div class="expert-card__expertise">
                      <c:forEach var="area" items="${expert.expertiseAreas}" varStatus="status">
                        <c:if test="${status.index < 3}">
                          <span class="expert-card__expertise-tag">${area}</span>
                        </c:if>
                      </c:forEach>
                    </div>
                  </div>
                  <div class="expert-card__footer">
                    <div class="expert-card__price">
                      <fmt:formatNumber value="${expert.pricePerSession}" type="currency" currencySymbol="₹" locale="en-IN" />
                      <span>/ session</span>
                    </div>
                    <a href="profile.jsp?id=${expert.id}" class="btn btn--secondary">View Profile</a>
                  </div>
                </div>
              </c:forEach>
            </c:when>
            <c:otherwise>
              <div class="experts-empty">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                  <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/><line x1="8" y1="11" x2="14" y2="11"/>
                </svg>
                <h3>No experts found</h3>
                <p>Try adjusting your filters or search terms</p>
                <a href="experts.jsp" class="btn btn--primary">Clear Filters</a>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
        
        <c:if test="${not empty totalPages && totalPages > 1}">
          <div class="pagination">
            <c:if test="${currentPage > 1}">
              <a href="experts.jsp?page=${currentPage - 1}<c:if test='${not empty param.keyword}'>&keyword=${param.keyword}</c:if><c:if test='${not empty param.domainId}'>&domainId=${param.domainId}</c:if>" class="pagination__btn pagination__btn--prev">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="15 18 9 12 15 6"/></svg>
              </a>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" var="pageNum">
              <a href="experts.jsp?page=${pageNum}<c:if test='${not empty param.keyword}'>&keyword=${param.keyword}</c:if><c:if test='${not empty param.domainId}'>&domainId=${param.domainId}</c:if>" 
                class="pagination__btn <c:if test='${currentPage == pageNum}'>pagination__btn--active</c:if>">${pageNum}</a>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
              <a href="experts.jsp?page=${currentPage + 1}<c:if test='${not empty param.keyword}'>&keyword=${param.keyword}</c:if><c:if test='${not empty param.domainId}'>&domainId=${param.domainId}</c:if>" class="pagination__btn pagination__btn--next">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="9 18 15 12 9 6"/></svg>
              </a>
            </c:if>
          </div>
        </c:if>
      </div>
    </main>
  </div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

  <script src="js/main.js"></script>
</body>
</html>
