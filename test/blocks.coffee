evil     = window.evil
body     = (html) -> evil.block.vitalize fixtures.html(html)
fixtures = null

describe 'evil.block', ->
  before -> fixtures = $('#fixtures')

  afterEach ->
    fixtures.html('')
    evil.block.defined = []
