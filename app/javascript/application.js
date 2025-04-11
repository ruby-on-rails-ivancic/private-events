// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", () => {
    const flashModal = document.getElementById("flash-modal");
    if (flashModal && flashModal.innerHTML.trim() !== "") {
      // Show the flash modal
      flashModal.style.display = "block";
  
      // Hide it after 3 seconds (3000ms); adjust timing as needed.
      setTimeout(() => {
        // Optionally add a fade-out transition
        flashModal.style.transition = "opacity 0.5s ease-out";
        flashModal.style.opacity = "0";
  
        // Then hide completely after the transition
        setTimeout(() => {
          flashModal.style.display = "none";
        }, 500);
      }, 3000);
    }
  });
  
