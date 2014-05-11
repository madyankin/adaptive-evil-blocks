# Adaptive Evil Blocks

[Evil Blocks]:    https://github.com/ai/evil-blocks/
[matchMedia.js]:  https://github.com/paulirish/matchMedia.js/
[media queries]:  http://www.w3.org/TR/css3-mediaqueries/

Adaptive Evil Blocks is a filter that adds adaptivity to [Evil Blocks].
The [matchMedia.js] polyfill is used for old browsers.

The adaptivity is provided by the `@media` method powered by underlying
matchMedia API. So you can use [media queries] syntax.

## Usage

Run code once only if it matches a query:
```
evil.block '@@block',

  init: -> ...
    @media '(max-width: 399px)', -> ...
    @media '(min-width: 400px)', -> ...

```

The `match` callback is executed every time on query match, the `mismatch`
callback is executed every time on query mismatch.
```
evil.block '@@block',

  init: -> ...
    @media '(max-width: 399px), match: -> ...
    @media '(min-width: 400px), match: -> ...

    @media '(max-width: 399px), match: -> ... , mismatch: -> ...
    @media '(min-width: 400px), match: -> ... , mismatch: -> ...
```