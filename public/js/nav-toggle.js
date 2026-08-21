document.addEventListener("DOMContentLoaded", () => {
  const toggleBtn = document.getElementById("nav-toggle") || document.querySelector(".navbar-toggle, .nav-toggle");
  const navbar = document.getElementById("nav-menu") || document.querySelector(".navbar-glass, .nav-menu-glass");
  const overlay = document.querySelector(".overlay");
  const navLinks = document.querySelectorAll(".nav-link");

  if (toggleBtn && navbar) {
    toggleBtn.addEventListener("click", (e) => {
      e.stopPropagation();
      toggleBtn.classList.toggle("active");
      navbar.classList.toggle("active");

      if (overlay) {
        overlay.classList.toggle("active");
      }
    });

    document.addEventListener("click", (e) => {
      if (!navbar.contains(e.target) && !toggleBtn.contains(e.target)) {
        toggleBtn.classList.remove("active");
        navbar.classList.remove("active");
        if (overlay) overlay.classList.remove("active");
      }
    });

    navLinks.forEach(link => {
      link.addEventListener("click", () => {
        toggleBtn.classList.remove("active");
        navbar.classList.remove("active");
        if (overlay) overlay.classList.remove("active");
      });
    });
  }
});
