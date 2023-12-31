const { environment } = require("@rails/webpacker");
const webpack = require("webpack");

// TypeScriptのファイルを解決するための設定
const typescript = require("./loaders/typescript");
environment.loaders.prepend("typescript", typescript);

environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery/src/jquery",
    jQuery: "jquery/src/jquery",
  })
);

module.exports = environment;
