# Usage: !bug 123
action = (from, to, text, messsage) ->
  q = text.split(/\ (.+)/)[1]
  if !q || q.length is 0
    return 'no ID given'

  'http://croogo.lighthouseapp.com/projects/32818/tickets/' + escape q

module.exports = action