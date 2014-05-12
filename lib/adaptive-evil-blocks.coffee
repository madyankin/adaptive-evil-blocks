evil = window.evil


addBrackets = (query) ->
  re = /^([-\w]+:)\s*\d\w+$/im
  query.replace re, (match) -> "(#{match})"


media = (query, callback) ->
  mql = window.matchMedia addBrackets(query)

  if typeof(callback) is 'function' and mql.matches
    callback()
    return

  if typeof(callback) is 'object'
    match     = callback['match']
    mismatch  = callback['mismatch']

    return unless match

    handler = (mql) ->
      if mql.matches
        match()
      else
        mismatch() if mismatch

    mql.addListener(handler)
    handler(mql)


evil.block.filters.splice 0, 0, (obj) -> obj.media = media
