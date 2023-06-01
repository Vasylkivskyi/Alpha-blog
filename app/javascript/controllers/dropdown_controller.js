import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["item"];
  connect() {
    console.log("Dropdown:", this.itemTarget);
  }

  click() {
    this.itemTarget.classList.toggle("invisible");
  }
}
