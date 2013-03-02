var config = require('./config');

var irc = require('irc');
var client = new irc.Client(config.server, config.nick, config.options);

var fs = require('fs');

var processor = function(client, from, to, text, message) {
  if (text && text.length > 2 && text[0] == '!') {
    var sendTo = from; // send privately
    if (to.indexOf('#') > -1) {
      sendTo = to; // send publicly
    }

    var action = String(text.split(' ')[0]).replace('!', '');
    if (fs.existsSync('./actions/' + action + '.js')) { // check if we have an action file
      var actionFunc = require('./actions/' + action + '.js');
      var output = actionFunc(client, from, to, text, message);
      if (output) {
        client.say(sendTo, output);
      }
    } else {
      client.say(sendTo, 'unknown action');
    }
  }
};

client.addListener('message', function(from, to, text, message) {
    processor(client, from, to, text, message);
});


var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end('Hello from CroogoBot!');
}).listen(process.env.VMC_APP_PORT || 1337, null);
