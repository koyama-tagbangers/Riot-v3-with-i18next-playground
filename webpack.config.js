const path = require("path");

const HtmlWebpackPlugin = require("html-webpack-plugin");

/** @type {import('webpack').Configuration} */
module.exports = {
  module: {
    rules: [
      {
        test: /\.tag$/,
        exclude: /node_modules/,
        use: ["esbuild-loader", "riot-tag-loader"],
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: ["esbuild-loader"],
      },
    ],
  },
  plugins: [new HtmlWebpackPlugin()],
};
