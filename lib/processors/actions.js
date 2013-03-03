// Generated by CoffeeScript 1.5.0
(function() {
  var Actions;

  Actions = (function() {

    Actions.prototype.client = null;

    function Actions(client) {
      this.client = client;
    }

    Actions.prototype.process = function(from, to, text, message) {
      var action, actionFunc, output, sendTo;
      if (text && text.length > 2 && text[0] === '!') {
        sendTo = from;
        if (to.indexOf('#' > -1)) {
          sendTo = to;
        }
        action = String(text.split(' ')[0]).replace('!', '');
        if (fs.existsSync('../actions/' + action + '.js')) {
          actionFunc = require('../actions/' + action);
          output = actionFunc(from, to, text, message);
          if (output) {
            return this.client.say(sendTo, output);
          }
        } else {
          return this.client.say('unknown action');
        }
      }
    };

    return Actions;

  })();

}).call(this);