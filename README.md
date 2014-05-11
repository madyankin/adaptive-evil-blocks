# Adaptive Evil Blocks

```
evil.block '@@test',

  render: -> ...
    @match '(max-width: 399px)', -> ...
    @match '(min-width: 400px)', -> ...

```