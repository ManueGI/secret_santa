import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit"
export default class extends Controller {

  connect() {
  }


  static targets = ['wish', 'formedit', 'icon'];

  toggledisplay() {
      console.log("toggle connected");
      this.wishTarget.classList.toggle('d-none');
      this.formeditTarget.classList.toggle('d-none');
      this.iconTarget.classList.toggle('d-none');
    }
}
