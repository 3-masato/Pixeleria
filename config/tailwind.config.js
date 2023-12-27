const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
    "./app/components/**/*.{erb,haml,html,slim,rb}"
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      animation: {
        "slide-left":
          "slide-left 0.32s cubic-bezier(0.190, 1.000, 0.220, 1.000) 0.3s forwards",
        "slide-out-top": "slide-out-top 0.16s cubic-bezier(0.550, 0.055, 0.675, 0.190) 6s both"
      },
      keyframes: {
        "slide-left": {
          "0%": {
            transform: "translateX(100%)",
            opacity: "0",
          },
          to: {
            transform: "translateX(calc(0%))",
            opacity: "1",
          },
        },
        "slide-out-top": {
          "0%": {
            transform: "translateY(0)",
            opacity: "1",
          },
          to: {
            transform: "translateY(-0.25rem)",
            opacity: "0",
            display: "none"
          },
        },
      },
    },
  },
  variants: {
    imageRendering: ["responsive"],
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
    require("tailwindcss-image-rendering")(),
  ]
};
