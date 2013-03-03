class Bot

  constructor: (options) ->
    @config = options.config

  run: ->
    irc    = require 'irc'

    client = new irc.Client @config.irc.server, @config.irc.nick, @config.irc.options

    Actions = require './processors/actions'
    actions = new Actions 
      client: client
      config: @config

    Logger = require './processors/logger'
    logger = new Logger 
      client: client
      config: @config

    client.addListener 'message', (from, to, text, message) ->
      actions.process from, to, text, message
      logger.process from, to, text, message

    if @config.server
      http   = require 'http'
      server = http.createServer (req, res) ->
        res.writeHead 200,
          'Content-type': 'text/html'
        res.end 'Hello from CroogoBot!'
      server.listen process.env.VMC_APP_PORT || 1337, null

module.exports = Bot