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
      if (willDelete) {
        fetch(`/loans/${loanId}`,
                {method: 'delete',
                    headers:  {
                        "Accept": "application/json"
                    }
                }
            )
                .then((result) => {
                  findLoan.style.transition = "all 2s"
                  // setTimeout(() => findLoan.style.transform = "translateX(-1200px)", 1000)
                  setTimeout(() => findLoan.remove(), 4000)
                })

                .catch((err) => {
                    console.log(err)
                })
        swal("Poof! Your item has been deleted!", {
          icon: "success",
        });
        setTimeout(() => swal.close(), 1000)
      } else {
        swal("Your item is safe!");
        setTimeout(() => swal.close(), 1000)
      }
    });
  }

}
