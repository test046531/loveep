// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

// トップに移動する固定ボタン
document.addEventListener('DOMContentLoaded', function() {
    const button = document.getElementById('fixed_button2top');
    if (button) {
      button.addEventListener('click', function() {
        window.scrollTo({
          top: 0,
          behavior: 'smooth'
        });
      });
    }
  });