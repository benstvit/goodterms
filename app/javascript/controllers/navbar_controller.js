import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['lend', 'borrow']

  updateNavbar() {
    if (window.scrollY >= window.innerHeight) {
      this.element.classList.add("navbar-lewagon-white")
      this.borrowTarget.style.visibility = "visible"
      this.lendTarget.style.visibility = "visible"
    } else {
      this.borrowTarget.style.visibility = "hidden"
      this.lendTarget.style.visibility = "hidden"
      this.element.classList.remove("navbar-lewagon-white")

    }
  };
}
