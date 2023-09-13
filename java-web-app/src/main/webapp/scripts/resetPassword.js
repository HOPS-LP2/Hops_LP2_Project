const show_password = document.querySelector('.show-password');
const passwordInput = document.querySelector('#password');
const show_confirmPassword = document.querySelector('.show-confirm-password');
const confirmPasswordInput = document.querySelector('#confirm-password');

show_password.addEventListener('click', () => {
    passwordInput.type = passwordInput.type === 'password' ? 'text' : 'password'

    show_password.src = show_password.src.includes('open') ? '../public/icons/eye-close.png' : '../public/icons/eye-open.png'
})

show_confirmPassword.addEventListener('click', () => {
    confirmPasswordInput.type = confirmPasswordInput.type === 'password' ? 'text' : 'password'

    show_confirmPassword.src = show_confirmPassword.src.includes('open') ? '../public/icons/eye-close.png' : '../public/icons/eye-open.png'
})

function hasNumber(input) {
    return /\d/.test(input);
  }
  
  function hasUpperCase(input) {
    return /[A-Z]/.test(input);
  }
  
  function hasLowerCase(input) {
    return /[a-z]/.test(input);
  }

const form = document.querySelector('#reset-form');
form.addEventListener('submit', event => {
const warning = document.querySelector('#wrong');

const password = passwordInput.value;
if (!hasNumber(password) || !hasUpperCase(password) || !hasLowerCase(password)) {
  warning.innerText = 'Password created does not meet requirements';
  event.preventDefault();
  return;
}

if (confirmPasswordInput.value != password) {
  warning.innerText = 'Passwords do not match!';
  event.preventDefault();
  return;
}
})