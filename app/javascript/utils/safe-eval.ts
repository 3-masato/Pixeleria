/**
 * 指定された文字列を `new Function` を使用してJavaScriptコードとして実行します。
 * 指定されたコードは厳格モードで実行されます。
 *
 * 文字列をJavaScriptコードとして評価する性質上、XSS等セキュリティ上のリスクを伴うため、
 * 信頼できないソースからのコードを実行することは避けてください。
 *
 * @param code - 実行するJavaScriptコード
 */
export function safeEval(code: string): void {
  new Function(`"use strict";${code}`)();
}
