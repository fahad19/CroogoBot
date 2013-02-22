/**
 * Usage: !bug 123
 */
var action = function(client, from, to, text, message) {
  var q = text.split(/ (.+)/)[1];
  if (!q || q.length == 0) {
    return 'no ID given';
  }

  return 'http://croogo.lighthouseapp.com/projects/32818/tickets/' + escape(q);
};

module.exports = action;