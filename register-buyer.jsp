<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="pageTitleOverride" value="Register as Buyer — MentorMarket" />

<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/auth.css">
<style>
  .form-error {
    color: #DC2626;
    font-size: 13px;
    margin-top: 4px;
    display: block;
  }
  .field-error .form-input, .field-error .form-select-wrapper {
    border-color: #DC2626 !important;
  }
  .company-stage-card {
    padding: 16px;
    border: 2px solid var(--gray-200);
    border-radius: var(--radius-lg);
    cursor: pointer;
    transition: all 200ms;
  }
  .company-stage-card:hover {
    border-color: var(--gold-primary);
    background: rgba(245,166,35,0.05);
  }
  .company-stage-card--selected {
    border-color: var(--gold-primary);
    background: rgba(245,166,35,0.08);
  }
  .company-stage-card input {
    display: none;
  }
  .company-stage-card__title {
    font-weight: 600;
    color: var(--gray-800);
    margin-bottom: 4px;
  }
  .company-stage-card__desc {
    font-size: 13px;
    color: var(--gray-500);
  }
  .company-stage-card__icon {
    width: 32px;
    height: 32px;
    margin-bottom: 12px;
    color: var(--gray-400);
  }
  .company-stage-card--selected .company-stage-card__icon {
    color: var(--gold-primary);
  }
</style>
</head>
<body>

  <div class="auth-page">
    <div class="auth-page__brand">
      <div class="auth-page__brand-content">
        <div class="auth-page__brand-logo">
          <svg viewBox="0 0 48 48" fill="none">
            <rect width="48" height="48" rx="10" fill="#F5A623"/>
            <path d="M14 24L20 30L34 16" stroke="#0A1628" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
          MentorMarket
        </div>
        <h2>Unlock Decades of Industry Expertise</h2>
        <p>Connect with retired executives who've built empires and get personalized guidance for your business.</p>
        <div class="auth-page__trust-list">
          <div class="auth-page__trust-item">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
              <polyline points="22 4 12 14.01 9 11.01"/>
            </svg>
            300+ verified experts
          </div>
          <div class="auth-page__trust-item">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"/>
            </svg>
            4.9 average rating
          </div>
          <div class="auth-page__trust-item">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
              <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
            </svg>
            Secure payments
          </div>
        </div>
      </div>
    </div>

    <div class="auth-page__form-side">
      <div class="auth-form-container">
        <h1>Create Your Account</h1>
        <p>Already have an account? <a href="login.jsp" class="form-link">Sign in</a></p>

        <%-- Error message if registration failed --%>
        <c:if test="${not empty requestScope.errorMessage}">
          <div class="form-error" style="background: #FEF2F2; border: 1px solid #FECACA; padding: 12px; border-radius: 8px; margin-bottom: 16px;">
            ${requestScope.errorMessage}
          </div>
        </c:if>

        <form action="register-buyer" method="POST">
          <div class="form-row">
            <div class="form-group <c:if test='${not empty errors.firstName}'>field-error</c:if>" id="firstName-group">
              <label>First Name <span class="required">*</span></label>
              <div class="form-input-wrapper">
                <input type="text" id="firstName" name="firstName" class="form-input" placeholder="Marcus" value="${not empty param.firstName ? param.firstName : ''}" required>
              </div>
              <c:if test="${not empty errors.firstName}"><span class="form-error">${errors.firstName}</span></c:if>
            </div>
            <div class="form-group <c:if test='${not empty errors.lastName}'>field-error</c:if>" id="lastName-group">
              <label>Last Name <span class="required">*</span></label>
              <div class="form-input-wrapper">
                <input type="text" id="lastName" name="lastName" class="form-input" placeholder="Webb" value="${not empty param.lastName ? param.lastName : ''}" required>
              </div>
              <c:if test="${not empty errors.lastName}"><span class="form-error">${errors.lastName}</span></c:if>
            </div>
          </div>

          <div class="form-group <c:if test='${not empty errors.email}'>field-error</c:if>" id="email-group">
            <label>Email Address <span class="required">*</span></label>
            <div class="form-input-wrapper">
              <input type="email" id="email" name="email" class="form-input" placeholder="marcus@company.com" value="${not empty param.email ? param.email : ''}" required>
            </div>
            <c:if test="${not empty errors.email}"><span class="form-error">${errors.email}</span></c:if>
          </div>

          <div class="form-group <c:if test='${not empty errors.password}'>field-error</c:if>" id="password-group">
            <label>Password <span class="required">*</span></label>
            <div class="form-input-wrapper">
              <input type="password" id="password" name="password" class="form-input" placeholder="Minimum 8 characters" required minlength="8">
            </div>
            <c:if test="${not empty errors.password}"><span class="form-error">${errors.password}</span></c:if>
          </div>

          <div class="form-group <c:if test='${not empty errors.phone}'>field-error</c:if>" id="phone-group">
            <label>Phone Number <span class="required">*</span></label>
            <div class="form-input-wrapper">
              <input type="tel" id="phone" name="phone" class="form-input" placeholder="+91 98765 43210" value="${not empty param.phone ? param.phone : ''}" required>
            </div>
            <c:if test="${not empty errors.phone}"><span class="form-error">${errors.phone}</span></c:if>
          </div>

          <div class="form-group">
            <label>Company Name</label>
            <div class="form-input-wrapper">
              <input type="text" id="company" name="company" class="form-input" placeholder="Your startup or company" value="${not empty param.company ? param.company : ''}">
            </div>
          </div>

          <%-- Company Stage Selection --%>
          <div class="form-group">
            <label>What stage describes you best?</label>
            <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 12px; margin-top: 8px;">
              <label class="company-stage-card <c:if test='${param.companyStage == \"STARTUP\"}'>company-stage-card--selected</c:if>">
                <input type="radio" name="companyStage" value="STARTUP" <c:if test="${param.companyStage == 'STARTUP'}">checked</c:if>>
                <svg class="company-stage-card__icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                  <path d="M6 3h12l2 4v14H4V7l2-4z"/>
                </svg>
                <div class="company-stage-card__title">Startup</div>
                <div class="company-stage-card__desc">Pre-seed or seed stage</div>
              </label>
              <label class="company-stage-card <c:if test='${param.companyStage == \"SCALE\"}'>company-stage-card--selected</c:if>">
                <input type="radio" name="companyStage" value="SCALE" <c:if test="${param.companyStage == 'SCALE'}">checked</c:if>>
                <svg class="company-stage-card__icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                  <path d="M22 12h-4l-3 4L12 3L2 12h4l3-4"/>
                </svg>
                <div class="company-stage-card__title">Scaling</div>
                <div class="company-stage-card__desc">Series A or later</div>
              </label>
              <label class="company-stage-card <c:if test='${param.companyStage == \"ESTABLISHED\"}'>company-stage-card--selected</c:if>">
                <input type="radio" name="companyStage" value="ESTABLISHED" <c:if test="${param.companyStage == 'ESTABLISHED'}">checked</c:if>>
                <svg class="company-stage-card__icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                  <rect x="3" y="3" width="18" height="18" rx="2"/>
                  <path d="M9 3v18M15 3v18M3 9h18M3 15h18"/>
                </svg>
                <div class="company-stage-card__title">Established</div>
                <div class="company-stage-card__desc">Mature company</div>
              </label>
              <label class="company-stage-card <c:if test='${param.companyStage == \"INDIVIDUAL\"}'>company-stage-card--selected</c:if>">
                <input type="radio" name="companyStage" value="INDIVIDUAL" <c:if test="${param.companyStage == 'INDIVIDUAL'}">checked</c:if>>
                <svg class="company-stage-card__icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
                  <circle cx="12" cy="7" r="4"/>
                </svg>
                <div class="company-stage-card__title">Individual</div>
                <div class="company-stage-card__desc">Just exploring</div>
              </label>
            </div>
            <c:if test="${not empty errors.companyStage}"><span class="form-error">${errors.companyStage}</span></c:if>
          </div>

          <button type="submit" class="btn btn--primary" style="width: 100%; height: 52px; font-size: 16px; box-shadow: var(--shadow-gold);">
            Create Account
          </button>
        </form>
      </div>
    </div>
  </div>

  <script>
    document.querySelectorAll('.company-stage-card').forEach(card => {
      card.addEventListener('click', () => {
        document.querySelectorAll('.company-stage-card').forEach(c => c.classList.remove('company-stage-card--selected'));
        card.classList.add('company-stage-card--selected');
      });
    });
  </script>
</body>
</html>
