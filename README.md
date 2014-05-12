# Adaptive Evil Blocks

[Evil Blocks]:    https://github.com/ai/evil-blocks/
[matchMedia.js]:  https://github.com/paulirish/matchMedia.js/
[media queries]:  http://www.w3.org/TR/css3-mediaqueries/

Adaptive Evil Blocks is a filter that adds adaptivity to [Evil Blocks].
The [matchMedia.js] polyfill is used for old browsers.

The adaptivity is provided by the `@media` method powered by underlying
matchMedia API. So you can use [media queries] syntax.

## Installation

### Ruby on Rails

Add the `adaptive-evil-blocks-rails` gem to `Gemfile`:

```ruby
gem "adaptive-evil-blocks-rails"
```

Add `adaptive-evil-blocks` to your scripts:

```js
//= require adaptive-evil-blocks
```

### Others
Add the `pkg/adaptive-evil-blocks.js` file to your project or install
the bower package:

```
bower install adaptive-evil-blocks
```

If you support old browsers, you may want to use the
`pkg/adaptive-evil-blocks.polyfilled.js` file.


## Usage

Run code once only if it matches a media query:
```coffee
evil.block '@@block',

  init: ->
    @media '(max-width: 399px)', -> ...
    @media '(min-width: 400px)', -> ...

```

The `match` callback is executed every time on query match, the `mismatch`
callback is executed every time on query mismatch.

```coffee
evil.block '@@block',

  init: ->
    @media '(max-width: 399px)', match: -> ...
    @media '(min-width: 400px)', match: -> ...

    @media '(max-width: 399px)', match: -> ... , mismatch: -> ...
    @media '(min-width: 400px)', match: -> ... , mismatch: -> ...
```

Also you can omit brackets for properties like `max-width` and `min-width`:

```coffee
evil.block '@@block',
  init: ->
    @media 'max-width: 399px', -> ...
```
