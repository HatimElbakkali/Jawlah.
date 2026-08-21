document.addEventListener("DOMContentLoaded", () => {
  const observerOptions = {
    threshold: 0.1,
    rootMargin: "0px 0px -50px 0px",
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("show");
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  const animatedElements = document.querySelectorAll(
    ".feature-title, .feature-desc, .feature-icon, .behind-img, .testimonial-card, .section-title, .testimonials-title, .section-desc, .quote-text, .quote-img, .section-activities-header, .activity-row, .pack-title-wrapper, .image-pack, .pack-info, .social-icons, .contact-form, .reveal"
  );
  animatedElements.forEach((element) => observer.observe(element));

  const returnBtn = document.getElementById("return-btn");
  if (returnBtn) {
    window.addEventListener("scroll", () => {
      returnBtn.style.display = window.scrollY >= 1000 ? "block" : "none";
    });

    returnBtn.addEventListener("click", () => {
      window.scrollTo({ top: 0, behavior: "smooth" });
    });
  }
});
