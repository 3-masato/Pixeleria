import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "content", "chevron"]

  toggle() {
    const { contentTarget, buttonTarget, chevronTarget } = this;
    const contentHeight = `${contentTarget.scrollHeight}px`;
    const isOpen = buttonTarget.classList.toggle("open");
    contentTarget.style.height = isOpen ? contentHeight : 0;
    chevronTarget.style.transform = isOpen ? "rotate(180deg)" : null;
  }
}
