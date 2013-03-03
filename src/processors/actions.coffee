class Actions

  client: null

  constructor: (options) ->
    @client = options.client
    @config = options.config

  process: (from, to, text, message) ->
    if text and text.length > 2 and text[0] is '!'
      sendTo = from # send privately
      if to.indexOf '#' > -1
        sendTo = to # send publicly
      
      fs = require 'fs'
      action = String(text.split(' ')[0]).replace '!', ''
      if fs.existsSync './lib/processors/actions/' + action + '.js'
        actionFunc = require './actions/' + action
        output = actionFunc from, to, text, message
        if output
          @client.say sendTo, output
      else
        @client.say 'unknown action'

module.exports = Actions