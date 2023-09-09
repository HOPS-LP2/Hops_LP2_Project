const show_password = document.querySelector('.show-password');
const show_password_img = document.querySelector('.show-password img');
const password_input = document.querySelector('#password');

show_password.addEventListener('click', () => {
    password_input.type = password_input.type === 'password' ? 'text' : 'password'

    show_password_img.src = show_password_img.src.includes('open') ? '../public/icons/eye-close.png' : '../public/icons/eye-open.png'
})