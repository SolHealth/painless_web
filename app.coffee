express = require 'express'
http = require 'http'
path = require 'path'

error = require './helpers/error'
routes = require './routes'

app = express()
app.configure ->
  app.set 'port', process.env.PORT or 3000
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'coffee'
  app.set 'view options', layout: false
  app.engine 'coffee', require('coffeecup').__express
  app.use express.favicon __dirname + '/public/favicon.ico', { maxAge: 86400000 }
  app.use express.logger 'dev'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser 'ABHIKJANARDAN'
  app.use express.session()
  app.use (req, res, next) ->
    res.locals.path = req.path
    next()
  app.use app.router
  app.use express.compress()
  app.use require('connect-assets')()
  app.use express.static(path.join(__dirname, 'public'))
  app.use (err, req, res, next) ->
    res.status 500

    if req.accepts 'html'
      error.render500 res
      return
    if req.accepts 'json'
      res.send 500, { error: err }
      return

    res.type('txt').send 'Error'

  app.use (req, res, next) ->
    res.status 404

    if req.accepts 'html'
      error.render404 res, "this page doesn't exist"
      return

    if req.accepts 'json'
      res.send 404, { error: 'Not Found' }
      return

  app.locals require './helpers/layout'

app.configure 'development', ->
  app.use express.errorHandler showStack: true, dumpExceptions: true

app.get '/', routes.index

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port#{app.get('port')}"