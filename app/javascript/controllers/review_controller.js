import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('Hey mate')
    let modal = document.getElementById("myModal");


    let span = document.getElementsByClassName("close")[0];

    document.querySelectorAll(".review-btn").forEach((btn) => {
      btn.addEventListener("click", (event) => {
        modal.style.display = "block";
      });
    });

    span.onclick = function() {
      modal.style.display = "none";
    }

    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }
  }
}
