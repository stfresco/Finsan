import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="check-balance"
export default class extends Controller {
  static targets = ["balance", "select", "submit", "amount"]

  connect() {

  }

  disableEgreso() {
    if (this.selectTarget.value === "Egreso" && parseFloat(this.balanceTarget.innerText) === 0.0) {
      this.submitTarget.disabled = true
      this.amountTarget.style.color = 'red'
      alert("Tu saldo es insuficiente para un egreso")
    } else {
      this.amountTarget.style.color = 'green'
      this.submitTarget.disabled = false
    }
  }

  saldo() {
    if (parseFloat(this.amountTarget.value) > parseFloat(this.balanceTarget.innerText) && this.selectTarget.value === 'Egreso') {
      this.amountTarget.style.color = 'red'
      this.submitTarget.disabled = true
      alert("Tu saldo es insuficiente para un egreso")
    } else {
      this.amountTarget.style.color = 'green'
      this.submitTarget.disabled = false
    }
  }
}
