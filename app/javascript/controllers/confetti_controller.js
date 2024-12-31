import { Controller } from "@hotwired/stimulus";
import confetti from "canvas-confetti"

export default class extends Controller {
  connect() {
    this.element.addEventListener("click", () => {
      // Small delay to ensure the confetti appears after form submission starts
      setTimeout(() => {
        confetti({
          particleCount: 100,
          spread: 70,
          origin: { y: 0.6 }
        });
      }, 100);
    });
  }
}