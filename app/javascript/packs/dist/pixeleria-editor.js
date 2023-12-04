var I = Object.defineProperty;
var D = (e, t, n) => t in e ? I(e, t, { enumerable: !0, configurable: !0, writable: !0, value: n }) : e[t] = n;
var f = (e, t, n) => (D(e, typeof t != "symbol" ? t + "" : t, n), n);
function a() {
}
function S(e) {
  return e();
}
function N() {
  return /* @__PURE__ */ Object.create(null);
}
function g(e) {
  e.forEach(S);
}
function v(e) {
  return typeof e == "function";
}
function H(e, t) {
  return e != e ? t == t : e !== t || e && typeof e == "object" || typeof e == "function";
}
function J(e) {
  return Object.keys(e).length === 0;
}
function T(e, t) {
  e.appendChild(t);
}
function V(e, t, n) {
  const r = U(e);
  if (!r.getElementById(t)) {
    const i = k("style");
    i.id = t, i.textContent = n, z(r, i);
  }
}
function U(e) {
  if (!e)
    return document;
  const t = e.getRootNode ? e.getRootNode() : e.ownerDocument;
  return t && /** @type {ShadowRoot} */
  t.host ? (
    /** @type {ShadowRoot} */
    t
  ) : e.ownerDocument;
}
function z(e, t) {
  return T(
    /** @type {Document} */
    e.head || e,
    t
  ), t.sheet;
}
function B(e, t, n) {
  e.insertBefore(t, n || null);
}
function E(e) {
  e.parentNode && e.parentNode.removeChild(e);
}
function k(e) {
  return document.createElement(e);
}
function M(e, t, n) {
  n == null ? e.removeAttribute(t) : e.getAttribute(t) !== n && e.setAttribute(t, n);
}
function F(e) {
  return Array.from(e.childNodes);
}
function G(e) {
  const t = {};
  return e.childNodes.forEach(
    /** @param {Element} node */
    (n) => {
      t[n.slot || "default"] = !0;
    }
  ), t;
}
let O;
function p(e) {
  O = e;
}
const d = [], P = [];
let _ = [];
const L = [], K = /* @__PURE__ */ Promise.resolve();
let x = !1;
function Q() {
  x || (x = !0, K.then(R));
}
function w(e) {
  _.push(e);
}
const y = /* @__PURE__ */ new Set();
let h = 0;
function R() {
  if (h !== 0)
    return;
  const e = O;
  do {
    try {
      for (; h < d.length; ) {
        const t = d[h];
        h++, p(t), W(t.$$);
      }
    } catch (t) {
      throw d.length = 0, h = 0, t;
    }
    for (p(null), d.length = 0, h = 0; P.length; )
      P.pop()();
    for (let t = 0; t < _.length; t += 1) {
      const n = _[t];
      y.has(n) || (y.add(n), n());
    }
    _.length = 0;
  } while (d.length);
  for (; L.length; )
    L.pop()();
  x = !1, y.clear(), p(e);
}
function W(e) {
  if (e.fragment !== null) {
    e.update(), g(e.before_update);
    const t = e.dirty;
    e.dirty = [-1], e.fragment && e.fragment.p(e.ctx, t), e.after_update.forEach(w);
  }
}
function X(e) {
  const t = [], n = [];
  _.forEach((r) => e.indexOf(r) === -1 ? t.push(r) : n.push(r)), n.forEach((r) => r()), _ = t;
}
const Y = /* @__PURE__ */ new Set();
function Z(e, t) {
  e && e.i && (Y.delete(e), e.i(t));
}
function tt(e, t, n) {
  const { fragment: r, after_update: i } = e.$$;
  r && r.m(t, n), w(() => {
    const s = e.$$.on_mount.map(S).filter(v);
    e.$$.on_destroy ? e.$$.on_destroy.push(...s) : g(s), e.$$.on_mount = [];
  }), i.forEach(w);
}
function et(e, t) {
  const n = e.$$;
  n.fragment !== null && (X(n.after_update), g(n.on_destroy), n.fragment && n.fragment.d(t), n.on_destroy = n.fragment = null, n.ctx = []);
}
function nt(e, t) {
  e.$$.dirty[0] === -1 && (d.push(e), Q(), e.$$.dirty.fill(0)), e.$$.dirty[t / 31 | 0] |= 1 << t % 31;
}
function st(e, t, n, r, i, s, o = null, $ = [-1]) {
  const u = O;
  p(e);
  const c = e.$$ = {
    fragment: null,
    ctx: [],
    // state
    props: s,
    update: a,
    not_equal: i,
    bound: N(),
    // lifecycle
    on_mount: [],
    on_destroy: [],
    on_disconnect: [],
    before_update: [],
    after_update: [],
    context: new Map(t.context || (u ? u.$$.context : [])),
    // everything else
    callbacks: N(),
    dirty: $,
    skip_bound: !1,
    root: t.target || u.$$.root
  };
  o && o(c.root);
  let m = !1;
  if (c.ctx = n ? n(e, t.props || {}, (l, j, ...C) => {
    const A = C.length ? C[0] : j;
    return c.ctx && i(c.ctx[l], c.ctx[l] = A) && (!c.skip_bound && c.bound[l] && c.bound[l](A), m && nt(e, l)), j;
  }) : [], c.update(), m = !0, g(c.before_update), c.fragment = r ? r(c.ctx) : !1, t.target) {
    if (t.hydrate) {
      const l = F(t.target);
      c.fragment && c.fragment.l(l), l.forEach(E);
    } else
      c.fragment && c.fragment.c();
    t.intro && Z(e.$$.fragment), tt(e, t.target, t.anchor), R();
  }
  p(u);
}
let q;
typeof HTMLElement == "function" && (q = class extends HTMLElement {
  constructor(t, n, r) {
    super();
    /** The Svelte component constructor */
    f(this, "$$ctor");
    /** Slots */
    f(this, "$$s");
    /** The Svelte component instance */
    f(this, "$$c");
    /** Whether or not the custom element is connected */
    f(this, "$$cn", !1);
    /** Component props data */
    f(this, "$$d", {});
    /** `true` if currently in the process of reflecting component props back to attributes */
    f(this, "$$r", !1);
    /** @type {Record<string, CustomElementPropDefinition>} Props definition (name, reflected, type etc) */
    f(this, "$$p_d", {});
    /** @type {Record<string, Function[]>} Event listeners */
    f(this, "$$l", {});
    /** @type {Map<Function, Function>} Event listener unsubscribe functions */
    f(this, "$$l_u", /* @__PURE__ */ new Map());
    this.$$ctor = t, this.$$s = n, r && this.attachShadow({ mode: "open" });
  }
  addEventListener(t, n, r) {
    if (this.$$l[t] = this.$$l[t] || [], this.$$l[t].push(n), this.$$c) {
      const i = this.$$c.$on(t, n);
      this.$$l_u.set(n, i);
    }
    super.addEventListener(t, n, r);
  }
  removeEventListener(t, n, r) {
    if (super.removeEventListener(t, n, r), this.$$c) {
      const i = this.$$l_u.get(n);
      i && (i(), this.$$l_u.delete(n));
    }
  }
  async connectedCallback() {
    if (this.$$cn = !0, !this.$$c) {
      let t = function(s) {
        return () => {
          let o;
          return {
            c: function() {
              o = k("slot"), s !== "default" && M(o, "name", s);
            },
            /**
             * @param {HTMLElement} target
             * @param {HTMLElement} [anchor]
             */
            m: function(c, m) {
              B(c, o, m);
            },
            d: function(c) {
              c && E(o);
            }
          };
        };
      };
      if (await Promise.resolve(), !this.$$cn)
        return;
      const n = {}, r = G(this);
      for (const s of this.$$s)
        s in r && (n[s] = [t(s)]);
      for (const s of this.attributes) {
        const o = this.$$g_p(s.name);
        o in this.$$d || (this.$$d[o] = b(o, s.value, this.$$p_d, "toProp"));
      }
      for (const s in this.$$p_d)
        !(s in this.$$d) && this[s] !== void 0 && (this.$$d[s] = this[s], delete this[s]);
      this.$$c = new this.$$ctor({
        target: this.shadowRoot || this,
        props: {
          ...this.$$d,
          $$slots: n,
          $$scope: {
            ctx: []
          }
        }
      });
      const i = () => {
        this.$$r = !0;
        for (const s in this.$$p_d)
          if (this.$$d[s] = this.$$c.$$.ctx[this.$$c.$$.props[s]], this.$$p_d[s].reflect) {
            const o = b(
              s,
              this.$$d[s],
              this.$$p_d,
              "toAttribute"
            );
            o == null ? this.removeAttribute(this.$$p_d[s].attribute || s) : this.setAttribute(this.$$p_d[s].attribute || s, o);
          }
        this.$$r = !1;
      };
      this.$$c.$$.after_update.push(i), i();
      for (const s in this.$$l)
        for (const o of this.$$l[s]) {
          const $ = this.$$c.$on(s, o);
          this.$$l_u.set(o, $);
        }
      this.$$l = {};
    }
  }
  // We don't need this when working within Svelte code, but for compatibility of people using this outside of Svelte
  // and setting attributes through setAttribute etc, this is helpful
  attributeChangedCallback(t, n, r) {
    var i;
    this.$$r || (t = this.$$g_p(t), this.$$d[t] = b(t, r, this.$$p_d, "toProp"), (i = this.$$c) == null || i.$set({ [t]: this.$$d[t] }));
  }
  disconnectedCallback() {
    this.$$cn = !1, Promise.resolve().then(() => {
      this.$$cn || (this.$$c.$destroy(), this.$$c = void 0);
    });
  }
  $$g_p(t) {
    return Object.keys(this.$$p_d).find(
      (n) => this.$$p_d[n].attribute === t || !this.$$p_d[n].attribute && n.toLowerCase() === t
    ) || t;
  }
});
function b(e, t, n, r) {
  var s;
  const i = (s = n[e]) == null ? void 0 : s.type;
  if (t = i === "Boolean" && typeof t != "boolean" ? t != null : t, !r || !n[e])
    return t;
  if (r === "toAttribute")
    switch (i) {
      case "Object":
      case "Array":
        return t == null ? null : JSON.stringify(t);
      case "Boolean":
        return t ? "" : null;
      case "Number":
        return t ?? null;
      default:
        return t;
    }
  else
    switch (i) {
      case "Object":
      case "Array":
        return t && JSON.parse(t);
      case "Boolean":
        return t;
      case "Number":
        return t != null ? +t : t;
      default:
        return t;
    }
}
function rt(e, t, n, r, i, s) {
  let o = class extends q {
    constructor() {
      super(e, n, i), this.$$p_d = t;
    }
    static get observedAttributes() {
      return Object.keys(t).map(
        ($) => (t[$].attribute || $).toLowerCase()
      );
    }
  };
  return Object.keys(t).forEach(($) => {
    Object.defineProperty(o.prototype, $, {
      get() {
        return this.$$c && $ in this.$$c ? this.$$c[$] : this.$$d[$];
      },
      set(u) {
        var c;
        u = b($, u, t), this.$$d[$] = u, (c = this.$$c) == null || c.$set({ [$]: u });
      }
    });
  }), r.forEach(($) => {
    Object.defineProperty(o.prototype, $, {
      get() {
        var u;
        return (u = this.$$c) == null ? void 0 : u[$];
      }
    });
  }), s && (o = s(o)), e.element = /** @type {any} */
  o, o;
}
class it {
  constructor() {
    /**
     * ### PRIVATE API
     *
     * Do not use, may change at any time
     *
     * @type {any}
     */
    f(this, "$$");
    /**
     * ### PRIVATE API
     *
     * Do not use, may change at any time
     *
     * @type {any}
     */
    f(this, "$$set");
  }
  /** @returns {void} */
  $destroy() {
    et(this, 1), this.$destroy = a;
  }
  /**
   * @template {Extract<keyof Events, string>} K
   * @param {K} type
   * @param {((e: Events[K]) => void) | null | undefined} callback
   * @returns {() => void}
   */
  $on(t, n) {
    if (!v(n))
      return a;
    const r = this.$$.callbacks[t] || (this.$$.callbacks[t] = []);
    return r.push(n), () => {
      const i = r.indexOf(n);
      i !== -1 && r.splice(i, 1);
    };
  }
  /**
   * @param {Partial<Props>} props
   * @returns {void}
   */
  $set(t) {
    this.$$set && !J(t) && (this.$$.skip_bound = !0, this.$$set(t), this.$$.skip_bound = !1);
  }
}
const ot = "4";
typeof window < "u" && (window.__svelte || (window.__svelte = { v: /* @__PURE__ */ new Set() })).v.add(ot);
function ct(e) {
  V(e, "svelte-1o84quh", "h1.svelte-1o84quh{text-align:center}");
}
function $t(e) {
  let t;
  return {
    c() {
      t = k("h1"), t.textContent = "Pxieleria Editor", M(t, "class", "svelte-1o84quh");
    },
    m(n, r) {
      B(n, t, r);
    },
    p: a,
    i: a,
    o: a,
    d(n) {
      n && E(t);
    }
  };
}
class ut extends it {
  constructor(t) {
    super(), st(this, t, null, $t, H, {}, ct);
  }
}
customElements.define("pixeleria-editor", rt(ut, {}, [], [], !0));
export {
  ut as default
};
