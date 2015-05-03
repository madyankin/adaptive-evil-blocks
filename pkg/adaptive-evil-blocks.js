/*
 * adaptive-evil-blocks-0.1.3
 * Adaptivity support for Evil Blocks
 * https://github.com/outpunk/adaptive-evil-blocks
 * 2015 Alexander Madyankin <alexander@madyankin.name>
 */

(function() {
  var addBrackets, evil, media;

  evil = window.evil;

  addBrackets = function(query) {
    var re;
    re = /^([-\w]+:)\s*\d\w+$/im;
    return query.replace(re, function(match) {
      return "(" + match + ")";
    });
  };

  media = function(query, callback) {
    var handler, match, mismatch, mql;
    mql = window.matchMedia(addBrackets(query));
    if (typeof callback === 'function' && mql.matches) {
      callback();
      return;
    }
    if (typeof callback === 'object') {
      match = callback['match'];
      mismatch = callback['mismatch'];
      if (!match) {
        return;
      }
      handler = function(mql) {
        if (mql.matches) {
          return match();
        } else {
          if (mismatch) {
            return mismatch();
          }
        }
      };
      mql.addListener(handler);
      return handler(mql);
    }
  };

  evil.block.filters.splice(0, 0, function(obj) {
    return obj.media = media;
  });

}).call(this);
