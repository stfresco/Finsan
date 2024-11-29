// app/javascript/controllers/category_toggle_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["select", "customCategory"]

  connect() {
    console.log("Category Toggle Controller connected!")
  }

  toggleCustomCategory() {
    const selectedValue = this.selectTarget.value;
    if (selectedValue === "Otra") {
      this.customCategoryTarget.style.display = "block";
    } else {
      this.customCategoryTarget.style.display = "none";
    }
  }
}
