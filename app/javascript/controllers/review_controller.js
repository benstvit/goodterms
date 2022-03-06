import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    let modal = document.getElementById("myModal");

    // Get the button that opens the modal
    // let btn = document.querySelectorAll(".review-btn");
    // console.log(btn)
    // Get the <span> element that closes the modal
    let span = document.getElementsByClassName("close")[0];

    // When the user clicks on the button, open the modal
    document.querySelectorAll(".review-btn").forEach((btn) => {
      btn.addEventListener("click", (event) => {
        modal.style.display = "block";
      });
    });

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
      modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }
  }
}
