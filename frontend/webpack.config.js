const path = require("path");
const autoprefixer = require("autoprefixer");
const tailwindcss = require("tailwindcss");
const HtmlWebPackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");

const NODE_ENV = process.env.NODE_ENV;
const isProd = NODE_ENV === "production";

const plugins = [
  new HtmlWebPackPlugin({
    template: path.resolve(__dirname, "src/index.html"),
    inject: "body",
  }),
  new MiniCssExtractPlugin({
    filename: isProd ? "css/[name].[contenthash].css" : "css/[name].css",
    chunkFilename: isProd ? "css/[id].[contenthash].css" : "css/[id].css",
  }),
  new CopyWebpackPlugin({
    patterns: [
      {
        from: path.resolve(__dirname, "src/public"),
        to: path.resolve(__dirname, "dist/public"),
      },
    ],
  }),
];

module.exports = {
  plugins,
  mode: "development",
  entry: {
    app: [path.resolve(__dirname, "src/index.js")],
  },
  output: {
    filename: "js/[name].js",
    path: path.resolve(__dirname, "dist/client"),
    publicPath: "/",
  },
  resolve: {
    extensions: [".js", ".jsx"],
    alias: {
      "@components": path.resolve(__dirname, "src/components"),
      "@pages": path.resolve(__dirname, "src/Pages"),
      "@contexts": path.resolve(__dirname, "src/contexts"),
      "@constants": path.resolve(__dirname, "src/constants"),
      "@repositories": path.resolve(__dirname, "src/repositories"),
      "@lib": path.resolve(__dirname, "src/lib"),
      "@queries": path.resolve(__dirname, "src/queries"),
    },
  },
  devtool: "source-map",
  devServer: {
    historyApiFallback: true,
  },
  module: {
    rules: [
      {
        test: /\.js$|jsx/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
        },
      },
      // All output '.js' files will have any sourcemaps re-processed by 'source-map-loader'.
      {
        enforce: "pre",
        test: /\.js$/,
        loader: "source-map-loader",
      },
      // SCSS files
      {
        test: /\.s?css$/,
        use: [
          isProd ? MiniCssExtractPlugin.loader : "style-loader",
          {
            loader: "css-loader",
            options: {
              sourceMap: true,
              importLoaders: 2,
            },
          },
          {
            loader: "postcss-loader",
            options: {
              postcssOptions: {
                plugins: [autoprefixer(), tailwindcss(), "postcss-import"],
              },
            },
          },
          "sass-loader",
        ],
      },
    ],
  },
};
