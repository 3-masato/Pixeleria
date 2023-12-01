const { environment } = require('@rails/webpacker')

// TypeScriptのファイルを解決するための設定
const typescript =  require('./loaders/typescript')
environment.loaders.prepend('typescript', typescript)
module.exports = environment
