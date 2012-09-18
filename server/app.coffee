
# Module dependencies.

express = require 'express'
require 'coffee-script'

app = module.exports = express()

# Configuration

app.configure(->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.set 'view options', layout: false
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static __dirname + '/public'
)

app.configure 'development', ->
  app.use express.errorHandler dumpExceptions: true, showStack: true

app.configure 'production', ->
  app.use express.errorHandler()

# Routes

require('./routes').setup app

app.listen 3000, ->
  console.log "express-bootstrap app running"
