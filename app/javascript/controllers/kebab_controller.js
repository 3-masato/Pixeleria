import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu", "container"]

  connect() {
    this.handleBodyClick = this._handleBodyClick.bind(this);
    document.addEventListener("click", this.handleBodyClick);
  }

  disconnect() {
    document.removeEventListener("click", this.handleBodyClick);
  }

  toggleMenu(event) {
    // 既に開いているケバブメニューがある場合はそれ閉じる
    const openedKebabMenu = document.body.querySelector(`[data-kebab-target="menu"][data-show="true"]`);
    if (openedKebabMenu) {
      this.menuTarget.setAttribute("data-show", false);
    }

    const isVisible = this.menuTarget.getAttribute("data-show") === "true";
    this.menuTarget.setAttribute("data-show", !isVisible);

  }

  _handleBodyClick(event) {
    if (!this.containerTarget.contains(event.target)) {
      this.menuTarget.setAttribute("data-show", "false");
    }
  }
}