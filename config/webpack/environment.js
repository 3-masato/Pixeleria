const { environment } = require("@rails/webpacker");
const webpack = require("webpack");

// TypeScriptのファイルを解決するための設定
const typescript = require("./loaders/typescript");
environment.loaders.prepend("typescript", typescript);

module.exports = environment;
