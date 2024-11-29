import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="capitalize"
export default class CapitalizeController extends Controller {
  static targets = ["bank"];

  connect() {
    console.log("Capitalize controller connected!")
  }

  capitalize() {
    const value = this.bankTarget.value;
    this.bankTarget.value = value.toUpperCase();
  }
}
