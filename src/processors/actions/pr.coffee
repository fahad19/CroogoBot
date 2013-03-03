# Usage: !pr 123
action = (from, to, text, messsage) ->
  q = text.split(/\ (.+)/)[1]
  if !q || q.length is 0
    return 'no ID given'

  'https://github.com/croogo/croogo/pull/' + escape q

module.exports = action