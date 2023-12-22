/**
 * CSRFトークンを含むヘッダーを付加したfetchリクエストを実行します。
 *
 * @param input - リソースへのパスまたはURL。
 * @param init - fetchリクエストのオプション。ヘッダーやメソッドなどを含む。
 * @returns fetchリクエストの結果を返すPromiseオブジェクト。
 */
export function fetchWithCsrf(...[input, init = {}]: Parameters<typeof fetch>) {
  const csrfToken = document.querySelector<HTMLMetaElement>("meta[name='csrf-token']")?.content ?? "";
  const defaultHeaders = {
    "X-Requested-With": "XMLHttpRequest",
    "X-CSRF-Token": csrfToken,
  };
  const headers: HeadersInit = {
    ...defaultHeaders,
    ...init.headers,
  };
  const fetchOptions: RequestInit = {
    ...init,
    headers,
  };

  return fetch(input, fetchOptions);
}
