<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="pageTitleOverride" value="Register as Expert — MentorMarket" />

<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/auth.css">
<style>
  .step-subtitle {
    font-size: 14px;
    color: var(--gray-500);
    margin-top: 4px;
    margin-bottom: 24px;
  }
  .form-error {
    color: #DC2626;
    font-size: 13px;
    margin-top: 4px;
    display: block;
  }
  .field-error .form-input {
    border-color: #DC2626 !important;
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
        <h2>Share Your Expertise With The Next Generation</h2>
        <p>Join hundreds of retired executives who are turning their industry knowledge into a rewarding second career.</p>
        <div class="auth-page__trust-list">
          <div class="auth-page__trust-item">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
              <polyline points="22 4 12 14.01 9 11.01"/>
            </svg>
            Verified by our team of experts
          </div>
          <div class="auth-page__trust-item">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"/>
            </svg>
            Set your own rates and schedule
          </div>
          <div class="auth-page__trust-item">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
              <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
            </svg>
            Secure payments via Razorpay
          </div>
          <div class="auth-page__trust-item">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"/>
              <polyline points="12 6 12 12 16 14"/>
            </svg>
            Session recordings available
          </div>
        </div>
      </div>
    </div>

    <div class="auth-page__form-side">
      <div class="auth-form-container">
        <span class="registration-type-badge">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
            <circle cx="8.5" cy="7" r="4"/>
            <line x1="20" y1="8" x2="20" y2="14"/>
            <line x1="23" y1="11" x2="17" y2="11"/>
          </svg>
          Expert Registration
        </span>
        <h1>Create Your Expert Profile</h1>
        <p>Already have an account? <a href="login.jsp" class="form-link">Sign in</a></p>

        <%-- Progress bar based on currentStep --%>
        <div class="progress-bar">
          <c:set var="currentStep" value="${not empty param.currentStep ? param.currentStep : 1}" />
          <div class="progress-bar__step <c:if test='${currentStep >= 1}'>progress-bar__step--active</c:if> <c:if test='${currentStep > 1}'>progress-bar__step--complete</c:if>">
            <div class="progress-bar__step-circle">1</div>
            <span class="progress-bar__step-label">Account</span>
            <div class="progress-bar__line"><div class="progress-bar__line-fill" <c:if test="${currentStep > 1}">style="width: 100%"</c:if>></div></div>
          </div>
          <div class="progress-bar__step <c:if test='${currentStep >= 2}'>progress-bar__step--active</c:if> <c:if test='${currentStep > 2}'>progress-bar__step--complete</c:if>">
            <div class="progress-bar__step-circle">2</div>
            <span class="progress-bar__step-label">Experience</span>
            <div class="progress-bar__line"><div class="progress-bar__line-fill" <c:if test="${currentStep > 2}">style="width: 100%"</c:if>></div></div>
          </div>
          <div class="progress-bar__step <c:if test='${currentStep >= 3}'>progress-bar__step--active</c:if>">
            <div class="progress-bar__step-circle">3</div>
            <span class="progress-bar__step-label">Services</span>
          </div>
        </div>

        <%-- Error message if registration failed --%>
        <c:if test="${not empty requestScope.errorMessage}">
          <div class="form-error" style="background: #FEF2F2; border: 1px solid #FECACA; padding: 12px; border-radius: 8px; margin-bottom: 16px;">
            ${requestScope.errorMessage}
          </div>
        </c:if>

        <form action="register-expert" method="POST" enctype="multipart/form-data">
          <input type="hidden" name="currentStep" value="${currentStep}">
          
          <%-- STEP 1: Account Details --%>
          <c:if test="${currentStep == 1}">
            <p class="step-subtitle">Tell us about yourself</p>
            <div class="form-row">
              <div class="form-group <c:if test='${not empty errors.firstName}'>field-error</c:if>" id="firstName-group">
                <label>First Name <span class="required">*</span></label>
                <div class="form-input-wrapper">
                  <input type="text" id="firstName" name="firstName" class="form-input" placeholder="Sarah" value="${sessionScope.reg_firstName}" required>
                </div>
                <c:if test="${not empty errors.firstName}"><span class="form-error">${errors.firstName}</span></c:if>
              </div>
              <div class="form-group <c:if test='${not empty errors.lastName}'>field-error</c:if>" id="lastName-group">
                <label>Last Name <span class="required">*</span></label>
                <div class="form-input-wrapper">
                  <input type="text" id="lastName" name="lastName" class="form-input" placeholder="Chen" value="${sessionScope.reg_lastName}" required>
                </div>
                <c:if test="${not empty errors.lastName}"><span class="form-error">${errors.lastName}</span></c:if>
              </div>
            </div>

            <div class="form-group <c:if test='${not empty errors.email}'>field-error</c:if>" id="email-group">
              <label>Email Address <span class="required">*</span></label>
              <div class="form-input-wrapper">
                <input type="email" id="email" name="email" class="form-input" placeholder="sarah.chen@company.com" value="${sessionScope.reg_email}" required>
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
                <input type="tel" id="phone" name="phone" class="form-input" placeholder="+91 98765 43210" value="${sessionScope.reg_phone}" required>
              </div>
              <c:if test="${not empty errors.phone}"><span class="form-error">${errors.phone}</span></c:if>
            </div>

            <div class="form-group">
              <label>LinkedIn Profile</label>
              <div class="form-input-wrapper">
                <input type="url" id="linkedin" name="linkedin" class="form-input" placeholder="https://linkedin.com/in/yourprofile" value="${sessionScope.reg_linkedin}">
              </div>
            </div>
          </c:if>

          <%-- STEP 2: Experience --%>
          <c:if test="${currentStep == 2}">
            <p class="step-subtitle">Tell us about your professional background</p>
            <input type="hidden" name="firstName" value="${sessionScope.reg_firstName}">
            <input type="hidden" name="lastName" value="${sessionScope.reg_lastName}">
            <input type="hidden" name="email" value="${sessionScope.reg_email}">
            <input type="hidden" name="password" value="${sessionScope.reg_password}">
            <input type="hidden" name="phone" value="${sessionScope.reg_phone}">

            <div class="form-group <c:if test='${not empty errors.domain}'>field-error</c:if>" id="domain-group">
              <label>Primary Domain <span class="required">*</span></label>
              <div class="form-select-wrapper">
                <select id="domain" name="domain" class="form-input" required>
                  <option value="">Select your domain</option>
                  <c:forEach var="domain" items="${domainList}">
                    <option value="${domain.id}" <c:if test="${sessionScope.reg_domain == domain.id}">selected</c:if>>${domain.name}</option>
                  </c:forEach>
                </select>
              </div>
              <c:if test="${not empty errors.domain}"><span class="form-error">${errors.domain}</span></c:if>
            </div>

            <div class="form-row">
              <div class="form-group <c:if test='${not empty errors.yearsExperience}'>field-error</c:if>" id="yearsExperience-group">
                <label>Years of Experience <span class="required">*</span></label>
                <div class="form-select-wrapper">
                  <select id="yearsExperience" name="yearsExperience" class="form-input" required>
                    <option value="">Select</option>
                    <option value="15" <c:if test="${sessionScope.reg_yearsExperience == 15}">selected</c:if>>15+ Years</option>
                    <option value="20" <c:if test="${sessionScope.reg_yearsExperience == 20}">selected</c:if>>20+ Years</option>
                    <option value="25" <c:if test="${sessionScope.reg_yearsExperience == 25}">selected</c:if>>25+ Years</option>
                    <option value="30" <c:if test="${sessionScope.reg_yearsExperience == 30}">selected</c:if>>30+ Years</option>
                    <option value="35" <c:if test="${sessionScope.reg_yearsExperience == 35}">selected</c:if>>35+ Years</option>
                  </select>
                </div>
                <c:if test="${not empty errors.yearsExperience}"><span class="form-error">${errors.yearsExperience}</span></c:if>
              </div>
              <div class="form-group <c:if test='${not empty errors.company}'>field-error</c:if>" id="company-group">
                <label>Last Company <span class="required">*</span></label>
                <div class="form-input-wrapper">
                  <input type="text" id="company" name="company" class="form-input" placeholder="Goldman Sachs" value="${sessionScope.reg_company}" required>
                </div>
                <c:if test="${not empty errors.company}"><span class="form-error">${errors.company}</span></c:if>
              </div>
            </div>

            <div class="form-group <c:if test='${not empty errors.jobTitle}'>field-error</c:if>" id="designation-group">
              <label>Last Designation <span class="required">*</span></label>
              <div class="form-input-wrapper">
                <input type="text" id="designation" name="jobTitle" class="form-input" placeholder="Vice President" value="${sessionScope.reg_jobTitle}" required>
              </div>
              <c:if test="${not empty errors.jobTitle}"><span class="form-error">${errors.jobTitle}</span></c:if>
            </div>

            <div class="form-group <c:if test='${not empty errors.bio}'>field-error</c:if>" id="bio-group">
              <label>Professional Bio <span class="required">*</span></label>
              <textarea id="bio" name="bio" class="form-input" placeholder="Tell clients about your experience, achievements, and what makes your mentorship unique. Minimum 50 characters." required minlength="50">${sessionScope.reg_bio}</textarea>
              <c:if test="${not empty errors.bio}"><span class="form-error">${errors.bio}</span></c:if>
            </div>
          </c:if>

          <%-- STEP 3: Services --%>
          <c:if test="${currentStep == 3}">
            <p class="step-subtitle">Set up your service offerings</p>
            <input type="hidden" name="firstName" value="${sessionScope.reg_firstName}">
            <input type="hidden" name="lastName" value="${sessionScope.reg_lastName}">
            <input type="hidden" name="email" value="${sessionScope.reg_email}">
            <input type="hidden" name="password" value="${sessionScope.reg_password}">
            <input type="hidden" name="phone" value="${sessionScope.reg_phone}">
            <input type="hidden" name="domain" value="${sessionScope.reg_domain}">
            <input type="hidden" name="yearsExperience" value="${sessionScope.reg_yearsExperience}">
            <input type="hidden" name="company" value="${sessionScope.reg_company}">
            <input type="hidden" name="jobTitle" value="${sessionScope.reg_jobTitle}">
            <input type="hidden" name="bio" value="${sessionScope.reg_bio}">

            <div class="form-group" id="sessionTypes-group">
              <label>Session Types Offered <span class="required">*</span></label>
              <div class="checkbox-group">
                <label class="checkbox-item">
                  <input type="checkbox" name="sessionTypes" value="hourly" <c:if test="${fn:contains(sessionScope.reg_sessionTypes, 'hourly')}">checked</c:if>>
                  <span>Hourly Session (₹1,500+)</span>
                </label>
                <label class="checkbox-item">
                  <input type="checkbox" name="sessionTypes" value="halfday" <c:if test="${fn:contains(sessionScope.reg_sessionTypes, 'halfday')}">checked</c:if>>
                  <span>Half Day Session (₹4,000+)</span>
                </label>
                <label class="checkbox-item">
                  <input type="checkbox" name="sessionTypes" value="fullday" <c:if test="${fn:contains(sessionScope.reg_sessionTypes, 'fullday')}">checked</c:if>>
                  <span>Full Day Session (₹7,000+)</span>
                </label>
                <label class="checkbox-item">
                  <input type="checkbox" name="sessionTypes" value="retainer" <c:if test="${fn:contains(sessionScope.reg_sessionTypes, 'retainer')}">checked</c:if>>
                  <span>Monthly Retainer</span>
                </label>
              </div>
              <c:if test="${not empty errors.sessionTypes}"><span class="form-error">${errors.sessionTypes}</span></c:if>
            </div>

            <div class="form-group <c:if test='${not empty errors.pricePerSession}'>field-error</c:if>" id="price-group">
              <label>Base Price Per Session <span class="required">*</span></label>
              <div class="form-input-wrapper">
                <span class="input-prefix">₹</span>
                <input type="number" id="price" name="pricePerSession" class="form-input" placeholder="1500" min="1000" step="100" value="${sessionScope.reg_pricePerSession}" required>
              </div>
              <c:if test="${not empty errors.pricePerSession}"><span class="form-error">${errors.pricePerSession}</span></c:if>
            </div>

            <div class="form-group">
              <label>Profile Photo <span style="font-weight: normal; color: var(--gray-500);">(Optional)</span></label>
              <div class="photo-upload" id="photoUpload">
                <div class="photo-upload__content" onclick="document.getElementById('profilePhoto').click()">
                  <svg class="photo-upload__icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                    <path d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                  </svg>
                  <p class="photo-upload__text">Click to upload photo</p>
                  <p class="photo-upload__subtext">JPG or PNG, max 5MB</p>
                </div>
              </div>
              <input type="file" id="profilePhoto" name="profilePhoto" accept="image/*" style="display: none;">
            </div>
          </c:if>

          <div class="form-actions">
            <c:if test="${currentStep > 1}">
              <button type="submit" name="action" value="back" class="btn btn--secondary">Back</button>
            </c:if>
            <c:choose>
              <c:when test="${currentStep < 3}">
                <button type="submit" name="action" value="next" class="btn btn--primary">Continue</button>
              </c:when>
              <c:otherwise>
                <button type="submit" name="action" value="submit" class="btn btn--primary" style="width: 100%;">Create My Profile</button>
              </c:otherwise>
            </c:choose>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script src="js/main.js"></script>
  <script>
    document.getElementById('profilePhoto')?.addEventListener('change', function(e) {
      if (e.target.files[0]) {
        alert('Photo selected: ' + e.target.files[0].name);
      }
    });
  </script>
</body>
</html>
