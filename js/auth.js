let currentStep = 1;
const totalSteps = 3;
const formData = {
  firstName: '',
  lastName: '',
  email: '',
  password: '',
  phone: '',
  linkedin: '',
  domain: '',
  yearsExperience: '',
  company: '',
  designation: '',
  bio: '',
  expertise: [],
  sessionTypes: [],
  hourlyRate: '',
  photo: null
};

function initProgressBar() {
  updateProgressBar();
}

function updateProgressBar() {
  const progressBar = document.querySelector('.progress-bar');
  if (!progressBar) return;

  const steps = progressBar.querySelectorAll('.progress-bar__step');

  steps.forEach((step, index) => {
    const stepNum = index + 1;
    step.classList.remove('progress-bar__step--completed', 'progress-bar__step--active', 'progress-bar__step--pending');

    if (stepNum < currentStep) {
      step.classList.add('progress-bar__step--completed');
    } else if (stepNum === currentStep) {
      step.classList.add('progress-bar__step--active');
    } else {
      step.classList.add('progress-bar__step--pending');
    }
  });
}

function validateEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function validatePassword(password) {
  return password.length >= 8;
}

function validateStep(step) {
  const errors = [];

  if (step === 1) {
    if (!formData.firstName.trim()) errors.push({ field: 'firstName', message: 'First name is required' });
    if (!formData.lastName.trim()) errors.push({ field: 'lastName', message: 'Last name is required' });
    if (!formData.email.trim()) errors.push({ field: 'email', message: 'Email is required' });
    else if (!validateEmail(formData.email)) errors.push({ field: 'email', message: 'Please enter a valid email' });
    if (!formData.password) errors.push({ field: 'password', message: 'Password is required' });
    else if (!validatePassword(formData.password)) errors.push({ field: 'password', message: 'Password must be at least 8 characters' });
    if (!formData.phone.trim()) errors.push({ field: 'phone', message: 'Phone number is required' });
  }

  if (step === 2) {
    if (!formData.domain) errors.push({ field: 'domain', message: 'Please select a domain' });
    if (!formData.yearsExperience) errors.push({ field: 'yearsExperience', message: 'Years of experience is required' });
    if (!formData.company.trim()) errors.push({ field: 'company', message: 'Company name is required' });
    if (!formData.designation.trim()) errors.push({ field: 'designation', message: 'Designation is required' });
    if (!formData.bio.trim() || formData.bio.length < 50) errors.push({ field: 'bio', message: 'Bio must be at least 50 characters' });
  }

  if (step === 3) {
    if (formData.expertise.length === 0) errors.push({ field: 'expertise', message: 'Add at least one expertise tag' });
    if (!formData.hourlyRate || parseInt(formData.hourlyRate) < 50) errors.push({ field: 'hourlyRate', message: 'Hourly rate must be at least $50' });
    if (formData.sessionTypes.length === 0) errors.push({ field: 'sessionTypes', message: 'Select at least one session type' });
  }

  return errors;
}

function showFieldError(fieldId, message) {
  const wrapper = document.getElementById(`${fieldId}-group`);
  if (!wrapper) return;

  let errorEl = wrapper.querySelector('.form-error');
  if (!errorEl) {
    errorEl = document.createElement('div');
    errorEl.className = 'form-error visible';
    errorEl.innerHTML = `
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="12" cy="12" r="10"/>
        <line x1="12" y1="8" x2="12" y2="12"/>
        <line x1="12" y1="16" x2="12.01" y2="16"/>
      </svg>
      <span>${message}</span>
    `;
    wrapper.appendChild(errorEl);
  } else {
    errorEl.querySelector('span').textContent = message;
    errorEl.classList.add('visible');
  }

  const input = wrapper.querySelector('.form-input');
  if (input) input.classList.add('error');
}

function clearFieldError(fieldId) {
  const wrapper = document.getElementById(`${fieldId}-group`);
  if (!wrapper) return;

  const errorEl = wrapper.querySelector('.form-error');
  if (errorEl) errorEl.classList.remove('visible');

  const input = wrapper.querySelector('.form-input');
  if (input) {
    input.classList.remove('error');
    if (formData[fieldId]) input.classList.add('success');
  }
}

function clearAllErrors() {
  document.querySelectorAll('.form-error').forEach(el => el.classList.remove('visible'));
  document.querySelectorAll('.form-input').forEach(el => {
    el.classList.remove('error', 'success');
  });
}

function shakeButton() {
  const btn = document.querySelector('.form-actions .btn--primary');
  if (btn) {
    btn.classList.add('shake');
    setTimeout(() => btn.classList.remove('shake'), 400);
  }
}

function updateButtonVisibility() {
  const prevBtn = document.querySelector('[data-action="prev"]');
  const nextBtn = document.querySelector('[data-action="next"]');

  if (prevBtn) {
    prevBtn.style.display = currentStep === 1 ? 'none' : 'block';
  }
  if (nextBtn) {
    nextBtn.textContent = currentStep === totalSteps ? 'Complete Registration' : 'Continue';
  }
}

function goToStep(nextStep) {
  const errors = validateStep(currentStep);

  if (errors.length > 0) {
    shakeButton();
    errors.forEach(err => showFieldError(err.field, err.message));
    return;
  }

  if (nextStep > totalSteps) {
    submitForm();
    return;
  }

  const currentStepEl = document.querySelector(`.form-step[data-step="${currentStep}"]`);
  const nextStepEl = document.querySelector(`.form-step[data-step="${nextStep}"]`);

  if (currentStepEl && nextStepEl) {
    currentStepEl.classList.add('exiting');

    setTimeout(() => {
      currentStepEl.classList.add('hidden');
      currentStepEl.classList.remove('exiting');
      nextStepEl.classList.remove('hidden');
      nextStepEl.classList.add('entering');

      setTimeout(() => {
        nextStepEl.classList.remove('entering');
      }, 50);

      currentStep = nextStep;
      updateProgressBar();
      updateButtonVisibility();
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }, 250);
  } else {
    currentStep = nextStep;
    updateProgressBar();
    updateButtonVisibility();
  }
}

function updatePasswordStrength(password) {
  const strengthBars = document.querySelectorAll('.password-strength__bar');
  const strengthLabel = document.querySelector('.password-strength__label');

  let strength = 0;
  if (password.length >= 8) strength++;
  if (/[A-Z]/.test(password)) strength++;
  if (/[0-9]/.test(password)) strength++;
  if (/[^A-Za-z0-9]/.test(password)) strength++;

  const levels = ['weak', 'fair', 'good', 'strong'];
  const colors = ['weak', 'fair', 'good', 'strong'];

  strengthBars.forEach((bar, i) => {
    bar.classList.remove('active', ...levels);
    if (i < strength) {
      bar.classList.add('active', levels[strength - 1]);
    }
  });

  if (strengthLabel) {
    strengthLabel.classList.remove(...levels);
    if (strength > 0) {
      strengthLabel.classList.add(levels[strength - 1]);
      strengthLabel.textContent = levels[strength - 1].charAt(0).toUpperCase() + levels[strength - 1].slice(1);
    } else {
      strengthLabel.textContent = '';
    }
  }
}

function initFormFields() {
  const fields = ['firstName', 'lastName', 'email', 'phone', 'password', 'linkedin', 'company', 'designation', 'bio', 'hourlyRate'];

  fields.forEach(field => {
    const input = document.getElementById(field);
    if (!input) return;

    input.addEventListener('input', () => {
      formData[field] = input.value;
      clearFieldError(field);
      if (field === 'password') updatePasswordStrength(input.value);
    });

    input.addEventListener('blur', () => {
      if (formData[field]) {
        input.classList.add('success');
      }
    });
  });

  const selectFields = ['domain', 'yearsExperience'];
  selectFields.forEach(field => {
    const select = document.getElementById(field);
    if (!select) return;

    select.addEventListener('change', () => {
      formData[field] = select.value;
      clearFieldError(field);
      if (formData[field]) select.classList.add('success');
    });
  });
}

function initExpertiseTags() {
  const container = document.querySelector('.expertise-tags-input');
  const input = container?.querySelector('input');

  if (!container || !input) return;

  function addTag(text) {
    if (!text.trim() || formData.expertise.includes(text.trim())) return;

    formData.expertise.push(text.trim());

    const tag = document.createElement('span');
    tag.className = 'expertise-tag';
    tag.innerHTML = `
      ${text.trim()}
      <button type="button" data-tag="${text.trim()}">
        <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
          <line x1="18" y1="6" x2="6" y2="18"/>
          <line x1="6" y1="6" x2="18" y2="18"/>
        </svg>
      </button>
    `;

    container.insertBefore(tag, input);
    input.value = '';
    clearFieldError('expertise');
  }

  input.addEventListener('keydown', (e) => {
    if (e.key === 'Enter' || e.key === ',') {
      e.preventDefault();
      addTag(input.value);
    }
  });

  container.addEventListener('click', (e) => {
    const removeBtn = e.target.closest('button[data-tag]');
    if (removeBtn) {
      const tag = removeBtn.closest('.expertise-tag');
      const tagText = removeBtn.dataset.tag;
      formData.expertise = formData.expertise.filter(t => t !== tagText);
      tag.remove();
    } else {
      input.focus();
    }
  });
}

function initSessionTypeSelection() {
  const checkboxes = document.querySelectorAll('input[name="sessionType"]');

  checkboxes.forEach(cb => {
    cb.addEventListener('change', () => {
      if (cb.checked) {
        if (!formData.sessionTypes.includes(cb.value)) {
          formData.sessionTypes.push(cb.value);
        }
      } else {
        formData.sessionTypes = formData.sessionTypes.filter(t => t !== cb.value);
      }
      clearFieldError('sessionTypes');
    });
  });
}

function initPhotoUpload() {
  const dropZone = document.querySelector('.photo-upload');
  const fileInput = document.getElementById('photoInput');

  if (!dropZone || !fileInput) return;

  dropZone.addEventListener('click', () => fileInput.click());

  dropZone.addEventListener('dragover', (e) => {
    e.preventDefault();
    dropZone.classList.add('drag-over');
  });

  dropZone.addEventListener('dragleave', () => {
    dropZone.classList.remove('drag-over');
  });

  dropZone.addEventListener('drop', (e) => {
    e.preventDefault();
    dropZone.classList.remove('drag-over');

    const file = e.dataTransfer.files[0];
    if (file && file.type.startsWith('image/')) {
      handlePhotoUpload(file);
    }
  });

  fileInput.addEventListener('change', () => {
    if (fileInput.files[0]) {
      handlePhotoUpload(fileInput.files[0]);
    }
  });
}

function handlePhotoUpload(file) {
  const dropZone = document.querySelector('.photo-upload');
  const preview = dropZone.querySelector('.photo-upload__preview');
  const previewImg = dropZone.querySelector('.photo-upload__preview-circle');
  const filename = dropZone.querySelector('.photo-upload__filename');

  formData.photo = file;

  const reader = new FileReader();
  reader.onload = (e) => {
    previewImg.src = e.target.result;
    filename.textContent = file.name;
    dropZone.classList.add('has-preview');
  };
  reader.readAsDataURL(file);
}

function submitForm() {
  console.log('Form submitted:', formData);
  window.location.href = 'booking-confirmation.html';
}

function initAuthForm() {
  initProgressBar();
  initFormFields();
  initExpertiseTags();
  initSessionTypeSelection();
  initPhotoUpload();
  updateButtonVisibility();

  document.querySelector('.form-actions')?.addEventListener('click', (e) => {
    const nextBtn = e.target.closest('[data-action="next"]');
    const prevBtn = e.target.closest('[data-action="prev"]');

    if (nextBtn) {
      goToStep(currentStep + 1);
    }

    if (prevBtn) {
      goToStep(currentStep - 1);
    }
  });
}

document.addEventListener('DOMContentLoaded', initAuthForm);