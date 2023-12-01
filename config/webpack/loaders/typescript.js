module.exports = {
  test: /\.ts$/,
  use: [
    {
      loader: 'babel-loader',
      options: {
        presets: [
          '@babel/preset-env',
          '@babel/preset-typescript'
        ]
      }
    }
  ],
  exclude: /node_modules/
}