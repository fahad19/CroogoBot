class Logger

  client: null

  constructor: (options) ->
    @client = options.client
    @config = options.config

  process: (from, to, text, message) ->
    if text and text.length > 0 and text[0] is not '!' and to.indexOf '#' > -1 and from is not @config.irc.nick and from.indexOf '#' is -1
      moment = require 'moment'
      mysql = require 'mysql'
      connection = mysql.createConnection @config.mysql

      row = 
        username: connection.escape from
        message: connection.escape text
        created: moment().utc().format 'YYYY-MM-DD HH:mm::ss'

      query = connection.query 'INSERT INTO ' + @config.mysql.tables.messages + ' SET ?', row, (err, result) ->
        #done

module.exports = Logger