evil     = window.evil
body     = (html) -> evil.block.vitalize fixtures.html(html)
fixtures = null


describe 'adaptive', ->
  before -> fixtures = $('#fixtures')

  afterEach ->
    fixtures.html('')
    evil.block.defined = []


  it 'inits block if it matches', ->
    body '<div data-block="test"></div>'

    initialized = false
    window.innerWidth = 500

    evil.block '@@test',
      initIf: {minWidth: 501}
      init: -> initialized = true

    initialized.should.equal false
