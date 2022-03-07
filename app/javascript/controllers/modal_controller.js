import { Controller } from "@hotwired/stimulus"
import swal from 'sweetalert';

export default class extends Controller {
  static targets = ['loan']

  connect() {
    console.log("The 'sweetalert' controller is now loaded!")

  }

  alert(event) {
    const loanId = event.currentTarget.dataset.id
    const findLoan = this.loanTargets.find(loan => loan.dataset.id === loanId)
    const user = event.currentTarget.dataset.user_id

    swal({
      title: "Mark this item as returned ?",
      text: "Once marked as returned, there is no going back!",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })



    .then((willDelete) => {
      console.log(willDelete)
      if (willDelete) {
        fetch(`/loans/${loanId}`,
                {method: 'PATCH',
                    headers:  {
                        "Accept": "application/json"
                    }
                }
            )
                .then((result)) => {
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
                .then((result) => {
                  findLoan.style.transition = "all 2s"
                  setTimeout(() => findLoan.style.transform = "translateX(-1200px)", 1000)
                  setTimeout(() => findLoan.remove(), 4000)
                })

                .catch((err) => {
                    console.log('Error',err)
                })
        swal("Poof! Your item has been returned!", {
          icon: "success",
        });
        setTimeout(() => swal.close(), 1000)
      } else {
        swal("Return request has been cancelled!");
        setTimeout(() => swal.close(), 1000)
      }
    });
  }

}
