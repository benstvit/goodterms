import { Controller } from "@hotwired/stimulus"
import swal from 'sweetalert';

export default class extends Controller {
  static targets = ['loan', 'accept']

  connect() {
    console.log("The 'sweetalert' controller is now loaded!")

  }

  alert(event) {
    const loanId = event.currentTarget.dataset.id
    const findLoan = this.loanTargets.find(loan => loan.dataset.id === loanId)

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
                .then(() => {
                  findLoan.style.transition = "all 2s"
                  setTimeout(() => findLoan.style.transform = "translateX(1200px)", 800)
                  setTimeout(() => findLoan.remove(), 3000)
                })


                .catch((err) => {
                    console.log('Error',err)
                })
        swal("Please give now a quick review for your experience !", {
          icon: "success",
        })

        setTimeout(() => swal.close(), 1000)
      } else {
        swal("Return request has been cancelled!");
        setTimeout(() => swal.close(), 1000)
      }
    });
  }

  confirm(event) {

    const loanId = event.currentTarget.dataset.id
    const findLoan = this.acceptTargets.find(loan => loan.dataset.id === loanId)

    swal({
      title: "Loan Accepted!",
      icon: "success",
      button: "Back",
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
                .then(() => {
                  findLoan.style.transition = "all 2s"
                  setTimeout(() => findLoan.remove(), 200)
                })

                .catch((err) => {
                    console.log('Error',err)
                })
              }
            })
    setTimeout(() => swal.close(), 1000)
  }
}
