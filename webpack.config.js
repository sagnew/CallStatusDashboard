var path = require('path');
var webpack = require('webpack');

module.exports = {
  entry: './bundleEntry.js',
  output: { path: __dirname, filename: '/static/bundle.js' },
  module: {
    loaders: [
      { test: /.jsx?$/, loader: 'babel-loader', exclude: /node_modules/ }
    ]
  },
};
