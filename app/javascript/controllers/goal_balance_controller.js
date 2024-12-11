import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["submit", "input"]
  static values = { amount: Number }
  connect() {
    // console.log("coneccion extiosa")
    console.log(this.submitTarget)
    console.log(this.inputTarget)
    console.log(this.amountValue)
  }

  disableEgreso() {
    console.log(this.submitTarget)
    console.log(this.inputTarget.value)
    const inputvalue = parseFloat(this.inputTarget.value) || 0
    if (inputvalue > this.amountValue || inputvalue === 0.0 ) {
      this.inputTarget.classList.add("is-invalid")
      this.submitTarget.disabled = true
      // alert("Tu saldo es insuficiente")
    } else {
      this.inputTarget.classList.remove("is-invalid")
      this.submitTarget.disabled = false
    }
 }

  // saldo() {
  //   if (parseFloat(this.amountTarget.value) > parseFloat(this.balanceTarget.innerText) && this.selectTarget.value === 'Egreso') {
  //     this.amountTarget.style.color = 'red'
  //     this.submitTarget.disabled = true
  //     alert("Tu saldo es insuficiente para un egreso")
  //   } else {
  //     this.amountTarget.style.color = 'green'
  //     this.submitTarget.disabled = false
  //   }
  // }
}
