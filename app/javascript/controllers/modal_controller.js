import { Controller } from "@hotwired/stimulus"
import swal from 'sweetalert';


export default class extends Controller {
  static targets = ['loan', 'accept', 'review', 'link']

  connect() {
  }

  launchReview(){
    this.reviewTargets.forEach(element => {
      element.setAttribute("style", "display: block;");
    });
  }

  close() {
    this.reviewTargets.forEach(element => {
      element.removeAttribute("style");
    });
  }

  alert(event) {
    const loanId = event.currentTarget.dataset.id
    const findLoan = this.loanTargets.find(loan => loan.dataset.id === loanId)
    const userName = this.loanTarget.dataset.name
    // const link = document.createElement('div')
    // link.innerHTML = `Please don't forget to give ${userName} a <a href="www.google.com">review</a>`
    // const review = this.loanTarget.dataset.review

    console.log(findLoan)
    swal({
      title: "Mark this item as returned ?",
      text: `Please don't forget to give ${userName} a review first`,
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })



    .then((willDelete) => {
      if (willDelete) {
        fetch(`/loans/${loanId}`,
                {method: 'PATCH',
                    headers:  {
                        "Accept": "application/json"
                    }
                }
            )
                .then(() => {
                  // findLoan.style.transition = "all 2s"
                  setTimeout(() => findLoan.style.transform = "translateX(2000px)", 800)
                  setTimeout(() => findLoan.remove(), 3000)
                  setTimeout(location.reload(), 4000)
                })


                .catch((err) => {
                    console.log('Error',err)
                })

        // setTimeout(() => swal.close(), 3000)
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

    .then(() => {
      fetch(`/loans/${loanId}`,
              {method: 'PATCH',
                  headers:  {
                      "Accept": "application/json"
                  }
              }
          )
          .then(() => {
            // console.log('LoanID: ',loanId)
            findLoan.style.transition = "all 2s"
            setTimeout(() => findLoan.remove(), 200)
            setTimeout(location.reload(), 500)
          })

          .catch((err) => {
              console.log('Error',err)
          })

            })
    setTimeout(() => swal.close(), 2000)
  }

  clickHandler(e) {
    this.linkTargets.forEach(link => {
      link.addEventListener("click", clickHandler);
    })
    e.preventDefault();
    const href = this.getAttribute("a");
    const offsetTop = document.querySelector(href).offsetTop;

    scroll({
      top: offsetTop,
      behavior: "smooth"
    });
  }

}
