evil     = window.evil
body     = (html) -> evil.block.vitalize fixtures.html(html)
fixtures = null


describe 'adaptive', ->
  before -> fixtures = $('#fixtures')

  afterEach ->
    fixtures.html('')
    evil.block.defined = []


  it 'runs code if it matches a query', ->
    body '<div data-block="test"></div>'

    initialized = false
    evil.block '@@test',
      init: ->
        @media '(min-width: 1px)', -> initialized = true

    initialized.should.equal true


  it 'does not run code if it does not match a query', ->
    body '<div data-block="test"></div>'

    initialized = false
    evil.block '@@test',
      init: ->
        @media '(min-width: 10000px)', -> initialized = true

    initialized.should.equal false
