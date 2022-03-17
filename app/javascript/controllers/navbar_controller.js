import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['lend', 'borrow']

  connect() {
    if (window.screen.width > 800) {
      this.borrowTarget.style.visibility = "hidden"
      this.lendTarget.style.visibility = "hidden"
    }
  }

  updateNavbar() {
    if (window.screen.width > 800) {
      if ((window.scrollY >= window.innerHeight) && (window.screen.width > 800)) {
        this.element.classList.add("navbar-lewagon-white")
        this.borrowTarget.style.visibility = "visible"
        this.lendTarget.style.visibility = "visible"
      } else {
        this.borrowTarget.style.visibility = "hidden"
        this.lendTarget.style.visibility = "hidden"
        this.element.classList.remove("navbar-lewagon-white")
      }
    } else {
      this.borrowTarget.style.display = "none"
      this.lendTarget.style.display = "none"
      this.element.classList.remove("navbar-lewagon-white")
    }
  }
}
