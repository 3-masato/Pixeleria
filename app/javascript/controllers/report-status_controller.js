/* global fetch */
import { Controller } from "@hotwired/stimulus";

import { safeEval } from "../utils/safe-eval.ts";
import { fetchWithCsrf } from "../utils/fetch.ts";

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
    const response = await fetchWithCsrf(url, {
      method: "POST",
      body: JSON.stringify(data),
      headers: { "Content-Type": "application/json" }
    });

    return response.ok && response.headers.get("Content-Type").includes("javascript")
      ? await response.text()
      : null;
  }
}