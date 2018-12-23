module.exports = {
	module: {
		rules: [
			{
				test: /\.imba$/,
				loader: 'imba/loader',
			}
		]
	},
	resolve: {
		extensions: [".imba",".js", ".json"]
	},
	devServer: {
        historyApiFallback: true,
    },
	entry: "./src/index.imba",
	output: {  path: __dirname + '/dist', filename: "index.js", publicPath: '/' }
}