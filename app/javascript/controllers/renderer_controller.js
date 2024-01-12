import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="renderer"
export default class extends Controller {
  static targets = ['display']
  
  render(evt) {
    evt.preventDefault();
    evt.stopPropagation();
    this.displayTarget.classList.toggle("hidden")
  }
}
