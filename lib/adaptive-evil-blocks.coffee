evil = window.evil

adaptive = (obj) ->

  mql = matchMedia(obj.initIf)
  mql.matches


evil.block.filters.splice(0, 0, adaptive)
