document.addEventListener('turbolinks:load', function () {
  const form = document.querySelector('.registration_form');
  if (form) { form.addEventListener('input', checkConfirmation) }
})

function checkConfirmation() {
  const password = document.getElementById('user_password')
  const password_confirmation = document.getElementById('user_password_confirmation')

  const SuccessIcon = this.querySelector('.octicon-check-circle-fill')
  const FailedIcon = this.querySelector('.octicon-x-circle-fill')

  if (password_confirmation.value == "") {
    FailedIcon.classList.add('hide')
    SuccessIcon.classList.add('hide')
    return
  }

  if (password.value == password_confirmation.value) {
    SuccessIcon.classList.remove('hide')
    FailedIcon.classList.add('hide')
  } else {
    FailedIcon.classList.remove('hide')
    SuccessIcon.classList.add('hide')
  }
}
