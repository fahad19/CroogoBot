// Generated by CoffeeScript 1.5.0
(function() {
  var action;

  action = function(from, to, text, messsage) {
    var q;
    q = text.split(/\ (.+)/)[1];
    if (!q || q.length === 0) {
      return 'no ID given';
    }
    return 'https://github.com/croogo/croogo/pull/' + escape(q);
  };

  module.exports = action;

}).call(this);
