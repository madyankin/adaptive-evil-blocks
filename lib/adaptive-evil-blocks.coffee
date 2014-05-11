evil = window.evil

adaptive = (obj) ->

  obj.media = (query, callback) ->
    callback() if window.matchMedia(query).matches


evil.block.filters.splice(0, 0, adaptive)
