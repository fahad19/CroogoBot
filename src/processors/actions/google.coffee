# Usage: !google keyword here
action = (from, to, text, messsage) ->
  q = text.split(/\ (.+)/)[1]
  if !q || q.length is 0
    return 'no keyword given, mate'

  'http://google.com/search?q=' + escape q

module.exports = action