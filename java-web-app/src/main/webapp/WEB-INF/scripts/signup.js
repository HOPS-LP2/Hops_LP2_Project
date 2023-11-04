// const passwordInput = document.getElementById('password');
// const confirmPasswordInput = document.getElementById('confirm-password');
// const passwordReq = document.querySelector('.password-req');
// const phoneNumberInput = document.getElementById('phone-number');

// passwordInput.addEventListener('focus', () => {
//   passwordReq.style.display = 'block';
// });

// passwordInput.addEventListener('blur', () => {
//   passwordReq.style.display = 'none';
// });

// function isNumeric(input) {
//   return /^\d+$/.test(input);
// }

// function hasNumber(input) {
//   return /\d/.test(input);
// }

// function hasUpperCase(input) {
//   return /[A-Z]/.test(input);
// }

// function hasLowerCase(input) {
//   return /[a-z]/.test(input);
// }

// function validateCPF(strCPF) {
//   var Soma;
//   var Resto;
//   Soma = 0;
//   if (strCPF == "00000000000") return false;

//   for (i = 1; i <= 9; i++) Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (11 - i);
//   Resto = (Soma * 10) % 11;

//   if ((Resto == 10) || (Resto == 11)) Resto = 0;
//   if (Resto != parseInt(strCPF.substring(9, 10))) return false;

//   Soma = 0;
//   for (i = 1; i <= 10; i++) Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (12 - i);
//   Resto = (Soma * 10) % 11;

//   if ((Resto == 10) || (Resto == 11)) Resto = 0;
//   if (Resto != parseInt(strCPF.substring(10, 11))) return false;
//   return true;
// }

const CPFInput = document.getElementById('cpf');

CPFInput.addEventListener('input', function () {
  var v = this.value;

  if (isNaN(v[v.length - 1])) {
    this.value = v.substring(0, v.length - 1);
    return;
  }

  this.setAttribute("maxlength", "14");
  if (v.length == 3 || v.length == 7) this.value += ".";
  if (v.length == 11) this.value += "-";
});

const form = document.querySelector('#signup-form');
form.addEventListener('submit', event => {
  //   const inputs = document.querySelectorAll('input');
  //   const warning = document.querySelector('#warning');

  //   let hasEmptyField = false;
  //   inputs.forEach(input => {
  //     if (!input.value) {
  //       hasEmptyField = true;
  //       return;
  //     }
  //   })

  //   if (hasEmptyField) {
  //     warning.innerText = 'All fields must be filled!';
  //     event.preventDefault();
  //     return;
  //   }

  //   phoneNumber = phoneNumberInput.value;
  //   if (!isNumeric(phoneNumber)) {
  //     warning.innerText = 'Please enter a valid phone number!';
  //     event.preventDefault();
  //     return;
  //   }

  //   const password = passwordInput.value;
  //   if (!hasNumber(password) || !hasUpperCase(password) || !hasLowerCase(password)) {
  //     warning.innerText = 'Password created does not meet requirements';
  //     event.preventDefault();
  //     return;
  //   }

  //   if (confirmPasswordInput.value != password) {
  //     warning.innerText = 'Passwords do not match!';
  //     event.preventDefault();
  //     return;
  //   }

  CPFInput.value = CPFInput.value.replace(/[.-]/g, '');

  //   if (!validateCPF(CPFInput.value)) {
  //     warning.innerText = 'Invalid Social Security Number!';
  //     event.preventDefault();
  //     return;
  //   }
})