import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display"]

  connect() {
    this.startTime = new Date()
    this.timer = setInterval(() => {
      this.updateDisplay()
    }, 1000)
  }

  disconnect() {
    if (this.timer) {
      clearInterval(this.timer)
    }
  }

  updateDisplay() {
    const now = new Date()
    const diffInSeconds = Math.floor((now - this.startTime) / 1000)
    const minutes = Math.floor(diffInSeconds / 60)
    const seconds = diffInSeconds % 60
    this.displayTarget.textContent = `${minutes}:${seconds.toString().padStart(2, '0')}`
  }
}