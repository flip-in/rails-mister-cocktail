const show_form = () => {
  const formButton = document.querySelector('#formButton')
  const form = document.querySelector('.form-container')
  const cancel = document.querySelector('#cancelButton')
  if (form) {
    formButton.addEventListener('click', function () {
      form.classList.toggle('d-none');
    });
    cancel.addEventListener('click', function () {
      form.classList.toggle('d-done');
    });

  }
}

export {show_form}