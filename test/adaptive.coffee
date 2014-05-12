evil     = window.evil
body     = (html) -> evil.block.vitalize fixtures.html(html)
fixtures = null


describe 'media', ->
  before -> fixtures = $('#fixtures')

  beforeEach ->
    body '<div data-block="test"></div>'

  afterEach ->
    fixtures.html('')
    evil.block.defined = []


  it 'runs a callback if it matches a query', ->
    initialized = false
    evil.block '@@test',
      init: ->
        @media '(min-width: 1px)', -> initialized = true

    initialized.should.equal true


  it 'does not run a callback if it does not match a query', ->
    initialized = false
    evil.block '@@test',
      init: ->
        @media '(min-width: 10000px)', -> initialized = true

    initialized.should.equal false


  it 'runs a match callback from the listener if it matches a query', ->
    initialized = false
    evil.block '@@test',
      init: ->
        @media '(min-width: 1px)', match: -> initialized = true

    initialized.should.equal true


  it 'does not run a match callback from the listener if it matches a query', ->
    initialized = false
    evil.block '@@test',
      init: ->
        @media '(min-width: 10000px)', match: -> initialized = true

    initialized.should.equal false


  it 'runs different callbacks from the listener on different queries', ->
    body '<div data-block="one"></div> <div data-block="two"></div>'

    one = null
    evil.block '@@one',
      init: ->
        @media '(min-width: 10000px)',
          match:    -> one = 'match'
          mismatch: -> one = 'mismatch'

    one.should.equal 'mismatch'

    two = null
    evil.block '@@two',
      init: ->
        @media '(min-width: 1px)',
          match:    -> two = 'match'
          mismatch: -> two = 'mismatch'

    two.should.equal 'match'

