import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mytransactions"
export default class extends Controller {
  connect() {
  }

  displayTransactions(e) {
    e.preventDefault()
    const mytransationsTable = document.querySelector(".mytransactions")
    mytransationsTable.classList.toggle("d-none")

  }

}
