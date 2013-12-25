express = require("express")
http = require("http")
path = require("path")
app = express()

app.configure ->
  app.set "port", process.env.PORT or 8000
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use require('connect-assets')()
  app.use express.static(path.join(__dirname, "public"))
  app.use (req, res, next) ->
    if req.url.match(/^\/test\//)?
      res.sendfile path.join(__dirname, req.url)
    else
      next()
  app.use app.router
  app.use (req, res, next) ->
    throw new Error(req.url + " not found")
  app.use (err, req, res, next) ->
    console.log err
    res.send err.message

app.configure "development", ->
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )

app.configure "production", ->
  app.use express.errorHandler()

http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")

require("./initializers/routes_setup") app
