<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="pageTitleOverride" value="Sign In — MentorMarket" />

<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/auth.css">
<style>
  .auth-form-container.login { max-width: 420px; }
  
  .login-tabs {
    display: flex;
    background: var(--gray-100);
    border-radius: var(--radius-full);
    padding: 4px;
    margin-bottom: 32px;
    position: relative;
  }
  
  .login-tabs__tab {
    flex: 1;
    padding: 12px 16px;
    font-size: 14px;
    font-weight: 500;
    color: var(--gray-600);
    text-align: center;
    cursor: pointer;
    border-radius: var(--radius-full);
    transition: color 200ms;
    position: relative;
    z-index: 1;
    text-decoration: none;
  }
  
  .login-tabs__tab.active { color: var(--navy-deep); }
  .login-tabs__tab:hover { color: var(--navy-deep); }
  
  .login-tabs__pill {
    position: absolute;
    top: 4px;
    left: 4px;
    width: calc(50% - 4px);
    height: calc(100% - 8px);
    background: var(--white);
    border-radius: var(--radius-full);
    box-shadow: var(--shadow-xs);
    transition: transform 200ms var(--ease-spring);
  }
  
  .login-tabs__pill.pos-2 { transform: translateX(100%); }
  
  .login-card {
    background: var(--white);
    border: 1px solid var(--gray-200);
    border-radius: var(--radius-xl);
    padding: 40px;
  }
  
  .forgot-password {
    display: block;
    text-align: right;
    font-size: 13px;
    color: var(--gold-primary);
    margin-bottom: 24px;
    font-weight: 500;
    text-decoration: none;
  }
  
  .forgot-password:hover { text-decoration: underline; }
  
  .login-divider { display: flex; align-items: center; gap: 16px; margin: 24px 0; }
  .login-divider__line { flex: 1; height: 1px; background: var(--gray-200); }
  .login-divider__text { font-size: 12px; color: var(--gray-400); }
  
  .social-login { display: flex; gap: 12px; }
  .social-login__btn {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    height: 48px;
    border: 1.5px solid var(--gray-200);
    border-radius: var(--radius-md);
    background: var(--white);
    font-size: 13px;
    font-weight: 500;
    color: var(--gray-700);
    cursor: pointer;
    transition: all 200ms;
  }
  .social-login__btn:hover { border-color: var(--gray-400); background: var(--gray-100); }
  .social-login__btn svg { width: 18px; height: 18px; }
  
  .no-account { text-align: center; margin-top: 24px; font-size: 14px; color: var(--gray-600); }
  .no-account a { color: var(--gold-primary); font-weight: 600; text-decoration: none; }
  .no-account a:hover { text-decoration: underline; }
  
  .brand-illustration { width: 100%; max-width: 280px; margin: 0 auto 32px; opacity: 0.9; }
  .brand-illustration svg { width: 100%; height: auto; }
  
  .login-error {
    background: #FEF2F2;
    border: 1px solid #FECACA;
    color: #DC2626;
    padding: 12px 16px;
    border-radius: var(--radius-md);
    margin-bottom: 24px;
    font-size: 14px;
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

        <div class="brand-illustration">
          <svg viewBox="0 0 280 200" fill="none">
            <circle cx="140" cy="100" r="80" fill="rgba(245,166,35,0.08)"/>
            <circle cx="140" cy="100" r="60" fill="rgba(245,166,35,0.06)"/>
            <circle cx="140" cy="100" r="40" fill="rgba(245,166,35,0.10)"/>
            <path d="M100 90 L120 110 L180 50" stroke="#F5A623" stroke-width="4" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
            <circle cx="95" cy="85" r="20" fill="rgba(255,255,255,0.10)" stroke="rgba(255,255,255,0.20)" stroke-width="2"/>
            <path d="M95 78v14M88 85h14" stroke="rgba(255,255,255,0.60)" stroke-width="2" stroke-linecap="round"/>
            <circle cx="185" cy="85" r="20" fill="rgba(255,255,255,0.10)" stroke="rgba(255,255,255,0.20)" stroke-width="2"/>
            <path d="M185 78v14M178 85h14" stroke="rgba(255,255,255,0.60)" stroke-width="2" stroke-linecap="round"/>
            <circle cx="140" cy="130" r="24" fill="rgba(255,255,255,0.15)" stroke="rgba(255,255,255,0.25)" stroke-width="2"/>
            <path d="M132 130l6 6 10-12" stroke="#F5A623" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M40 160 L60 140 L80 160" stroke="rgba(255,255,255,0.15)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M200 160 L220 140 L240 160" stroke="rgba(255,255,255,0.15)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        </div>

        <h2>Welcome Back</h2>
        <p>Your industry experts are ready to help. Sign in to continue your journey.</p>

        <div class="auth-page__trust-list">
          <div class="auth-page__trust-item">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/>
            </svg>
            Your data is encrypted and secure
          </div>
          <div class="auth-page__trust-item">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/>
            </svg>
            Quick access to your sessions
          </div>
          <div class="auth-page__trust-item">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/>
            </svg>
            99.9% uptime guarantee
          </div>
        </div>
      </div>
    </div>

    <div class="auth-page__form-side">
      <div class="auth-form-container login">
        <div class="login-card">
          <h1 style="font-family: var(--font-heading); font-size: 28px; font-weight: 700; color: var(--gray-800); margin-bottom: 8px; text-align: center;">Welcome Back</h1>
          <p style="font-size: 15px; color: var(--gray-600); text-align: center; margin-bottom: 32px;">Sign in to continue</p>

          <%-- Error messages from failed login --%>
          <c:if test="${not empty requestScope.loginError}">
            <div class="login-error">${requestScope.loginError}</div>
          </c:if>
          
          <%-- Also support error param --%>
          <c:if test="${not empty param.error && empty requestScope.loginError}">
            <div class="login-error">
              <c:choose>
                <c:when test="${param.error == 'invalid_credentials'}">Invalid email or password. Please try again.</c:when>
                <c:when test="${param.error == 'session_expired'}">Your session has expired. Please log in again.</c:when>
                <c:when test="${param.error == 'unauthorized'}">You are not authorized to access this page.</c:when>
                <c:otherwise>An error occurred. Please try again.</c:otherwise>
              </c:choose>
            </div>
          </c:if>

          <%-- Tab selection based on URL param --%>
          <c:set var="activeTab" value="${not empty param.tab ? param.tab : 'buyer'}" />
          
          <div class="login-tabs">
            <div class="login-tabs__pill <c:if test='${activeTab == \"expert\"}'>pos-2</c:if>"></div>
            <a href="login.jsp?tab=buyer" class="login-tabs__tab <c:if test='${activeTab == \"buyer\"}'>active</c:if>">I'm a Buyer</a>
            <a href="login.jsp?tab=expert" class="login-tabs__tab <c:if test='${activeTab == \"expert\"}'>active</c:if>">I'm an Expert</a>
          </div>

          <%-- Buyer Login Form --%>
          <c:if test="${activeTab == 'buyer'}">
            <form action="login" method="POST">
              <input type="hidden" name="userType" value="BUYER">
              <div class="form-group" id="buyerEmail-group">
                <label>Email Address</label>
                <div class="form-input-wrapper">
                  <input type="email" id="buyerEmail" name="email" class="form-input" placeholder="marcus@company.com" required>
                </div>
              </div>
              <div class="form-group" id="buyerPassword-group">
                <label>Password</label>
                <div class="form-input-wrapper">
                  <input type="password" id="buyerPassword" name="password" class="form-input" placeholder="Enter your password" required>
                </div>
              </div>
              <a href="forgot-password.jsp" class="forgot-password">Forgot password?</a>
              <button type="submit" class="btn btn--primary" style="width: 100%; height: 52px; font-size: 16px; box-shadow: var(--shadow-gold);">
                Sign In as Buyer
              </button>
            </form>
          </c:if>

          <%-- Expert Login Form --%>
          <c:if test="${activeTab == 'expert'}">
            <form action="login" method="POST">
              <input type="hidden" name="userType" value="EXPERT">
              <div class="form-group" id="expertEmail-group">
                <label>Email Address</label>
                <div class="form-input-wrapper">
                  <input type="email" id="expertEmail" name="email" class="form-input" placeholder="sarah.chen@company.com" required>
                </div>
              </div>
              <div class="form-group" id="expertPassword-group">
                <label>Password</label>
                <div class="form-input-wrapper">
                  <input type="password" id="expertPassword" name="password" class="form-input" placeholder="Enter your password" required>
                </div>
              </div>
              <a href="forgot-password.jsp" class="forgot-password">Forgot password?</a>
              <button type="submit" class="btn btn--primary" style="width: 100%; height: 52px; font-size: 16px; box-shadow: var(--shadow-gold);">
                Sign In as Expert
              </button>
            </form>
          </c:if>

          <div class="login-divider">
            <span class="login-divider__line"></span>
            <span class="login-divider__text">or continue with</span>
            <span class="login-divider__line"></span>
          </div>

          <div class="social-login">
            <button type="button" class="social-login__btn" disabled>
              <svg viewBox="0 0 24 24">
                <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
              </svg>
              Google
            </button>
            <button type="button" class="social-login__btn" disabled>
              <svg viewBox="0 0 24 24" fill="currentColor">
                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
              </svg>
              LinkedIn
            </button>
          </div>
        </div>

        <p class="no-account">
          Don't have an account? <a href="register-buyer.jsp">Sign up as Buyer</a> or <a href="register-expert.jsp">become an Expert</a>
        </p>
      </div>
    </div>
  </div>

</body>
</html>
