config = require '../config'
irc    = require 'irc'

client = new ircClient config.irc.server, config.irc.nick, config.irc.options

Actions = require './processors/actions'
actions = new Actions client

Logger = require './processors/logger'
logger = new Logger client

client.addListener 'message', (from, to, text, message) ->
  actions.process from, to, text, message
  logger.process from, to, text, message

if config.server
  http   = require 'http'
  server = http.createServer (req, res) ->
    res.writeHead 200,
      'Content-type': 'text/html'
    res.end 'Hello from CroogoBot!'
  server.listen process.env.VMC_APP_PORT || 1337, null
