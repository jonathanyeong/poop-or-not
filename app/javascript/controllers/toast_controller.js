// app/javascript/controllers/toast_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Toast controller connected!")

    // Listen for new toasts being added
    const observer = new MutationObserver((mutations) => {
      mutations.forEach((mutation) => {
        mutation.addedNodes.forEach((node) => {
          if (node.id === 'toast') {
            this.animateToast(node)
          }
        })
      })
    })

    observer.observe(this.element, { childList: true })
  }

  animateToast(toast) {
    // Show the toast
    setTimeout(() => {
      toast.classList.remove('translate-y-[-100%]', 'opacity-0')
    }, 100)

    // Hide and remove the toast
    setTimeout(() => {
      toast.classList.add('translate-y-[-100%]', 'opacity-0')

      // Remove the element after animation
      setTimeout(() => {
        toast.remove()
      }, 300)
    }, 3000)
  }
}