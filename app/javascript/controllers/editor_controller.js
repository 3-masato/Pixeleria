import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["editor", "form", "pixelData", "imageData"];

  connect() {
    const { editorTarget, pixelDataTarget } = this;
    const pixelData = pixelDataTarget.value.split(",").map(Number);
    editorTarget.loadPixelData(pixelData);
  }

  beforeSave(e) {
    const { editorTarget, formTarget, pixelDataTarget, imageDataTarget } = this;
    const detail = editorTarget.getDetails();

    e.preventDefault();

    pixelDataTarget.value = detail.pixelData.join(",");
    imageDataTarget.value = detail.imageData;

    formTarget.submit();
  }
}
