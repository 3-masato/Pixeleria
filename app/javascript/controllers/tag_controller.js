import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "tags", "template"];

  /**
   * 新しいタグを追加します。
   */
  addTag() {
    const tagValue = this.inputTarget.value.trim();
    if (tagValue === "") return;

    const uniqueIndex = Date.now();
    const newFieldHtml = this._generateFieldHtml(tagValue, uniqueIndex);

    this.tagsTarget.insertAdjacentHTML("beforeend", newFieldHtml);
    this.inputTarget.value = "";
  }

  /**
   * タグフィールドのHTMLを生成します。
   * @param {string} value - タグの値。
   * @param {number} index - ユニークなインデックス。
   * @returns {string} 生成されたHTML文字列。
   * @private
   */
  _generateFieldHtml(value, index) {
    const fieldTemplate = this.templateTarget.innerHTML;
    return fieldTemplate.replaceAll("%%index%%", index).replaceAll("%%value%%", value).trim();
  }

  /**
   * タグを削除します。
   * @param {Event} e - イベントオブジェクト。
   */
  removeTag(e) {
    const removeButton = e.target.closest(".remove-tag");
    if (!removeButton) return;

    const tagField = removeButton.closest(".tag-field");
    if (tagField) {
      tagField.remove();
    }
  }

  /**
   * Enterキーが押された時の挙動を制御します。
   * @param {KeyboardEvent} e - イベントオブジェクト。
   */
  handleEnterKey(e) {
    if (e.key === "Enter") {
      e.preventDefault();
      this.addTag();
    }
  }
}
