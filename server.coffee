express = require 'express'
coffeeScript = require 'connect-coffee-script'
liveload = require 'liveload'
lessMiddleware = require 'less-middleware'
app = express();

app.configure ->
	app.set 'views', __dirname + '/views'
	app.set 'view engine', 'jade'
	app.use express.bodyParser()
	app.use express.methodOverride()

	app.use app.router
	app.use liveload
		root:process.cwd()
		files:/.(css|jade|js|less|coffee)$/
		excludes:/^node_modules$/

	app.use lessMiddleware
		src : __dirname + '/app'

	app.use coffeeScript
		src: __dirname + '/app'
		bare: true
		sourceMap: true

	app.use(express.static(__dirname + '/app'));

app.get '/', (req, res) -> res.render('index', debug: true)
app.listen 3000
console.log('listening on port 3000');