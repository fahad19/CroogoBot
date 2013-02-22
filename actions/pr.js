var action = function(client, from, to, text, message) {
  var q = text.split(/ (.+)/)[1];
  if (!q || q.length == 0) {
    return 'no ID given';
  }

  return 'https://github.com/croogo/croogo/pull/' + escape(q);
};

module.exports = action;