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
    width       = window.innerWidth

    evil.block '@@test',
      initIf: "(max-width: #{width}px)"
      init: -> initialized = true

    initialized.should.equal true


  it 'does not init block if it does not match', ->
    body '<div data-block="test"></div>'

    initialized = false
    width       = window.innerWidth

    evil.block '@@test',
      initIf: "(min-width: #{width + 1}px)"
      init: -> initialized = true

    initialized.should.equal false
