/* global fetch */
import { Controller } from "@hotwired/stimulus";

import { safeEval } from "../utils/safe-eval.ts";

export default class extends Controller {
  static targets = ["select"];
  static values = { id: Number };

  /**
   * 状態変更をサーバーに送信し、応答に基づいてUIを更新する
   */
  async change() {
    const selectedValue = this.selectTarget.value;
    const url = `/admin/reports/${this.idValue}/update_status`;

    const code = await this._fetchAndUpdate(url, { status: selectedValue });
    if (code) {
      safeEval(code);
    }
  }

  /**
   * @private
   * サーバーへの非同期リクエストを処理
   */
  async _fetchAndUpdate(url, data) {
    const response = await fetch(url, {
      method: "POST",
      headers: this._headers(),
      body: JSON.stringify(data)
    });

    return response.ok && response.headers.get("Content-Type").includes("javascript")
      ? await response.text()
      : null;
  }

  /**
   * @private
   * CSRFトークンを含む標準ヘッダーを生成
   */
  _headers() {
    return {
      "Content-Type": "application/json",
      "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
    };
  }
}