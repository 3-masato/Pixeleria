import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "submit"];

  /**
   * 初期化時に入力フィールドの状態をチェックします。
   */
  connect() {
    this.checkBlank();
  }

  /**
   * 入力フィールドが空かどうかをチェックし、
   * 結果に基づいて送信ボタンの無効化を設定します。
   */
  checkBlank() {
    this._setDisabledSubmit(this._isInputBlank());
  }

  /**
   * 送信ボタンの有効/無効状態を設定します。
   * @private
   * @param {boolean} disabled - 送信ボタンを無効化するかどうかの真偽値。
   */
  _setDisabledSubmit(disabled) {
    this.submitTarget.disabled = disabled;
  }

  /**
   * 入力フィールドが空かどうかを判断します。
   * @private
   * @returns {boolean} 入力フィールドが空の場合はtrue、そうでない場合はfalse。
   */
  _isInputBlank() {
    return this.inputTarget.value === "";
  }
}
