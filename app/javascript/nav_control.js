document.addEventListener('turbolinks:load', (event) => {
  const burger = document.querySelector('.navbar-burger.burger');
  const menu = document.querySelector('.navbar-menu');

  burger.addEventListener('click', (event) => {
    event.stopPropagation();
    menu.classList.toggle('is-active');
  });

  menu.addEventListener('click', (event) => {
    event.stopPropagation();
  });

  window.addEventListener('click', () => {
    menu.classList.toggle('is-active', false);
  });
});


