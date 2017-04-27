(function() {
  var CompositeDisposable, HighlightColumnView, Point, Range, ref,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ref = require('atom'), CompositeDisposable = ref.CompositeDisposable, Point = ref.Point, Range = ref.Range;

  HighlightColumnView = (function(superClass) {
    extend(HighlightColumnView, superClass);

    function HighlightColumnView() {
      return HighlightColumnView.__super__.constructor.apply(this, arguments);
    }

    HighlightColumnView.prototype.initialize = function(editor, editorElement, cursor) {
      this.editor = editor;
      this.editorElement = editorElement;
      this.cursor = cursor;
      this.classList.add('highlight-column');
      this.attachToLines();
      this.handleEvents();
      this.updateHighlight();
      return this;
    };

    HighlightColumnView.prototype.attachToLines = function() {
      var lines, ref1;
      lines = (ref1 = this.editorElement.rootElement) != null ? typeof ref1.querySelector === "function" ? ref1.querySelector('.lines') : void 0 : void 0;
      return lines != null ? lines.appendChild(this) : void 0;
    };

    HighlightColumnView.prototype.handleEvents = function() {
      var configSubscriptions, cursorChanged, dispose, subscriptions, updateHighlightCallback;
      updateHighlightCallback = (function(_this) {
        return function() {
          return _this.updateHighlight();
        };
      })(this);
      subscriptions = new CompositeDisposable;
      configSubscriptions = this.handleConfigEvents();
      subscriptions.add(atom.config.onDidChange('editor.fontSize', function() {
        return setTimeout(updateHighlightCallback, 0);
      }));
      if (this.editorElement.hasTiledRendering) {
        subscriptions.add(this.editorElement.onDidChangeScrollLeft(updateHighlightCallback));
      }
      cursorChanged = (function(_this) {
        return function() {
          return _this.updateHighlight();
        };
      })(this);
      subscriptions.add(this.cursor.onDidChangePosition(cursorChanged));
      subscriptions.add(this.editorElement.onDidAttach((function(_this) {
        return function() {
          _this.attachToLines();
          return updateHighlightCallback();
        };
      })(this)));
      dispose = (function(_this) {
        return function() {
          subscriptions.dispose();
          configSubscriptions.dispose();
          return _this.remove();
        };
      })(this);
      subscriptions.add(this.editor.onDidDestroy(function() {
        return dispose();
      }));
      return subscriptions.add(this.cursor.onDidDestroy(function() {
        return dispose();
      }));
    };

    HighlightColumnView.prototype.handleConfigEvents = function() {
      var subscriptions, updateHighlightCallback;
      updateHighlightCallback = (function(_this) {
        return function() {
          return _this.updateHighlight();
        };
      })(this);
      subscriptions = new CompositeDisposable;
      subscriptions.add(atom.config.observe('highlight-column.opacity', updateHighlightCallback));
      subscriptions.add(atom.config.observe('highlight-column.enabled', updateHighlightCallback));
      subscriptions.add(atom.config.observe('highlight-column.lineMode', updateHighlightCallback));
      return subscriptions;
    };

    HighlightColumnView.prototype.updateHighlight = function() {
      var rect, width;
      if (this.isEnabled()) {
        rect = this.highlightRect();
        width = rect.width;
        if (this.isLineMode()) {
          width = 1;
        }
        this.style.left = rect.left + "px";
        this.style.width = width + "px";
        this.style.opacity = this.opacity();
        return this.style.display = 'block';
      } else {
        return this.style.display = 'none';
      }
    };

    HighlightColumnView.prototype.isEnabled = function() {
      var ref1;
      return (ref1 = atom.config.get('highlight-column.enabled')) != null ? ref1 : true;
    };

    HighlightColumnView.prototype.isLineMode = function() {
      return atom.config.get('highlight-column.lineMode');
    };

    HighlightColumnView.prototype.opacity = function() {
      var ref1;
      if (this.isLineMode()) {
        return 0.3;
      } else {
        return (ref1 = atom.config.get('highlight-column.opacity')) != null ? ref1 : 0.15;
      }
    };

    HighlightColumnView.prototype.highlightRect = function() {
      var rect;
      rect = this._cursorPixelRect();
      if (!rect.width || rect.width === 0) {
        rect.width = this.editor.getDefaultCharWidth();
      }
      if (this.editorElement.hasTiledRendering) {
        rect.left -= this.editorElement.getScrollLeft();
      }
      return rect;
    };

    HighlightColumnView.prototype._cursorPixelRect = function() {
      var column, range, rect, ref1, row, screenRange;
      ref1 = this.cursor.getScreenPosition(), row = ref1.row, column = ref1.column;
      screenRange = new Range(new Point(row, column), new Point(row, column + 1));
      rect = this.editorElement.pixelRectForScreenRange(screenRange);
      range = this.editorElement.pixelRangeForScreenRange(screenRange);
      rect.left = range.start.left;
      rect.right = range.end.left;
      return rect;
    };

    return HighlightColumnView;

  })(HTMLDivElement);

  module.exports = document.registerElement('highlight-column', {
    "extends": 'div',
    prototype: HighlightColumnView.prototype
  });

}).call(this);

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiL2hvbWUvbGJpZ2FzLy5hdG9tL3BhY2thZ2VzL2hpZ2hsaWdodC1jb2x1bW4vbGliL2hpZ2hsaWdodC1jb2x1bW4tZWxlbWVudC5jb2ZmZWUiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7QUFBQSxNQUFBLDJEQUFBO0lBQUE7OztFQUFBLE1BQXNDLE9BQUEsQ0FBUSxNQUFSLENBQXRDLEVBQUMsNkNBQUQsRUFBc0IsaUJBQXRCLEVBQTZCOztFQUV2Qjs7Ozs7OztrQ0FDSixVQUFBLEdBQVksU0FBQyxNQUFELEVBQVUsYUFBVixFQUEwQixNQUExQjtNQUFDLElBQUMsQ0FBQSxTQUFEO01BQVMsSUFBQyxDQUFBLGdCQUFEO01BQWdCLElBQUMsQ0FBQSxTQUFEO01BQ3BDLElBQUMsQ0FBQSxTQUFTLENBQUMsR0FBWCxDQUFlLGtCQUFmO01BQ0EsSUFBQyxDQUFBLGFBQUQsQ0FBQTtNQUNBLElBQUMsQ0FBQSxZQUFELENBQUE7TUFDQSxJQUFDLENBQUEsZUFBRCxDQUFBO2FBQ0E7SUFMVTs7a0NBT1osYUFBQSxHQUFlLFNBQUE7QUFDYixVQUFBO01BQUEsS0FBQSxvR0FBa0MsQ0FBRSxjQUFlOzZCQUNuRCxLQUFLLENBQUUsV0FBUCxDQUFtQixJQUFuQjtJQUZhOztrQ0FJZixZQUFBLEdBQWMsU0FBQTtBQUNaLFVBQUE7TUFBQSx1QkFBQSxHQUEwQixDQUFBLFNBQUEsS0FBQTtlQUFBLFNBQUE7aUJBQUcsS0FBQyxDQUFBLGVBQUQsQ0FBQTtRQUFIO01BQUEsQ0FBQSxDQUFBLENBQUEsSUFBQTtNQUUxQixhQUFBLEdBQWdCLElBQUk7TUFDcEIsbUJBQUEsR0FBc0IsSUFBQyxDQUFBLGtCQUFELENBQUE7TUFDdEIsYUFBYSxDQUFDLEdBQWQsQ0FBa0IsSUFBSSxDQUFDLE1BQU0sQ0FBQyxXQUFaLENBQXdCLGlCQUF4QixFQUEyQyxTQUFBO2VBRTNELFVBQUEsQ0FBVyx1QkFBWCxFQUFvQyxDQUFwQztNQUYy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LE9BQUEsQ0FBQSxFQUFTLEtBQVQ7SUFDQSxTQUFBLEVBQVcsbUJBQW1CLENBQUMsU0FEL0I7R0FEZTtBQTFGakIiLCJzb3VyY2VzQ29udGVudCI6WyJ7Q29tcG9zaXRlRGlzcG9zYWJsZSwgUG9pbnQsIFJhbmdlfSA9IHJlcXVpcmUgJ2F0b20nXG5cbmNsYXNzIEhpZ2hsaWdodENvbHVtblZpZXcgZXh0ZW5kcyBIVE1MRGl2RWxlbWVudFxuICBpbml0aWFsaXplOiAoQGVkaXRvciwgQGVkaXRvckVsZW1lbnQsIEBjdXJzb3IpLT5cbiAgICBAY2xhc3NMaXN0LmFkZCgnaGlnaGxpZ2h0LWNvbHVtbicpXG4gICAgQGF0dGFjaFRvTGluZXMoKVxuICAgIEBoYW5kbGVFdmVudHMoKVxuICAgIEB1cGRhdGVIaWdobGlnaHQoKVxuICAgIHRoaXNcblxuICBhdHRhY2hUb0xpbmVzOiAtPlxuICAgIGxpbmVzID0gQGVkaXRvckVsZW1lbnQucm9vdEVsZW1lbnQ/LnF1ZXJ5U2VsZWN0b3I/KCcubGluZXMnKVxuICAgIGxpbmVzPy5hcHBlbmRDaGlsZChAKVxuXG4gIGhhbmRsZUV2ZW50czogLT5cbiAgICB1cGRhdGVIaWdobGlnaHRDYWxsYmFjayA9ID0+IEB1cGRhdGVIaWdobGlnaHQoKVxuXG4gICAgc3Vic2NyaXB0aW9ucyA9IG5ldyBDb21wb3NpdGVEaXNwb3NhYmxlXG4gICAgY29uZmlnU3Vic2NyaXB0aW9ucyA9IEBoYW5kbGVDb25maWdFdmVudHMoKVxuICAgIHN1YnNjcmlwdGlvbnMuYWRkIGF0b20uY29uZmlnLm9uRGlkQ2hhbmdlICdlZGl0b3IuZm9udFNpemUnLCAtPlxuICAgICAgIyBzZXRUaW1lb3V0IGJlY2F1c2Ugd2UgbmVlZCB0byB3YWl0IGZvciB0aGUgZWRpdG9yIG1lYXN1cmVtZW50IHRvIGhhcHBlblxuICAgICAgc2V0VGltZW91dCh1cGRhdGVIaWdobGlnaHRDYWxsYmFjaywgMClcblxuICAgICMgRklYTUU6IHJlbW92ZSBjb25kaXRpb25hbCBhcyBzb29uIGFzIHRoZSB0aWxlZCBlZGl0b3IgaXMgcmVsZWFzZWQuXG4gICAgaWYgQGVkaXRvckVsZW1lbnQuaGFzVGlsZWRSZW5kZXJpbmdcbiAgICAgIHN1YnNjcmlwdGlvbnMuYWRkIEBlZGl0b3JFbGVtZW50Lm9uRGlkQ2hhbmdlU2Nyb2xsTGVmdCh1cGRhdGVIaWdobGlnaHRDYWxsYmFjaylcblxuICAgIGN1cnNvckNoYW5nZWQgPSA9PlxuICAgICAgQHVwZGF0ZUhpZ2hsaWdodCgpXG4gICAgc3Vic2NyaXB0aW9ucy5hZGQgQGN1cnNvci5vbkRpZENoYW5nZVBvc2l0aW9uKGN1cnNvckNoYW5nZWQpXG5cbiAgICBzdWJzY3JpcHRpb25zLmFkZCBAZWRpdG9yRWxlbWVudC5vbkRpZEF0dGFjaCA9PlxuICAgICAgQGF0dGFjaFRvTGluZXMoKVxuICAgICAgdXBkYXRlSGlnaGxpZ2h0Q2FsbGJhY2soKVxuXG4gICAgZGlzcG9zZSA9ID0+XG4gICAgICBzdWJzY3JpcHRpb25zLmRpc3Bvc2UoKVxuICAgICAgY29uZmlnU3Vic2NyaXB0aW9ucy5kaXNwb3NlKClcbiAgICAgIEByZW1vdmUoKVxuXG4gICAgc3Vic2NyaXB0aW9ucy5hZGQgQGVkaXRvci5vbkRpZERlc3Ryb3kgLT4gZGlzcG9zZSgpXG4gICAgc3Vic2NyaXB0aW9ucy5hZGQgQGN1cnNvci5vbkRpZERlc3Ryb3kgLT4gZGlzcG9zZSgpXG5cbiAgaGFuZGxlQ29uZmlnRXZlbnRzOiAtPlxuICAgIHVwZGF0ZUhpZ2hsaWdodENhbGxiYWNrID0gPT4gQHVwZGF0ZUhpZ2hsaWdodCgpXG4gICAgc3Vic2NyaXB0aW9ucyA9IG5ldyBDb21wb3NpdGVEaXNwb3NhYmxlXG4gICAgc3Vic2NyaXB0aW9ucy5hZGQgYXRvbS5jb25maWcub2JzZXJ2ZSgnaGlnaGxpZ2h0LWNvbHVtbi5vcGFjaXR5JywgdXBkYXRlSGlnaGxpZ2h0Q2FsbGJhY2spXG4gICAgc3Vic2NyaXB0aW9ucy5hZGQgYXRvbS5jb25maWcub2JzZXJ2ZSgnaGlnaGxpZ2h0LWNvbHVtbi5lbmFibGVkJywgdXBkYXRlSGlnaGxpZ2h0Q2FsbGJhY2spXG4gICAgc3Vic2NyaXB0aW9ucy5hZGQgYXRvbS5jb25maWcub2JzZXJ2ZSgnaGlnaGxpZ2h0LWNvbHVtbi5saW5lTW9kZScsIHVwZGF0ZUhpZ2hsaWdodENhbGxiYWNrKVxuICAgIHN1YnNjcmlwdGlvbnNcblxuICB1cGRhdGVIaWdobGlnaHQ6IC0+XG4gICAgaWYgQGlzRW5hYmxlZCgpXG4gICAgICByZWN0ID0gQGhpZ2hsaWdodFJlY3QoKVxuICAgICAgd2lkdGggPSByZWN0LndpZHRoXG4gICAgICB3aWR0aCA9IDEgaWYgQGlzTGluZU1vZGUoKVxuICAgICAgQHN0eWxlLmxlZnQgPSBcIiN7cmVjdC5sZWZ0fXB4XCJcbiAgICAgIEBzdHlsZS53aWR0aCA9IFwiI3t3aWR0aH1weFwiXG4gICAgICBAc3R5bGUub3BhY2l0eSA9IEBvcGFjaXR5KClcbiAgICAgIEBzdHlsZS5kaXNwbGF5ID0gJ2Jsb2NrJ1xuICAgIGVsc2VcbiAgICAgIEBzdHlsZS5kaXNwbGF5ID0gJ25vbmUnXG5cbiAgaXNFbmFibGVkOiAtPiBhdG9tLmNvbmZpZy5nZXQoJ2hpZ2hsaWdodC1jb2x1bW4uZW5hYmxlZCcpID8gdHJ1ZVxuXG4gIGlzTGluZU1vZGU6IC0+IGF0b20uY29uZmlnLmdldCgnaGlnaGxpZ2h0LWNvbHVtbi5saW5lTW9kZScpXG5cbiAgb3BhY2l0eTogLT5cbiAgICBpZiBAaXNMaW5lTW9kZSgpXG4gICAgICAwLjNcbiAgICBlbHNlXG4gICAgICBhdG9tLmNvbmZpZy5nZXQoJ2hpZ2hsaWdodC1jb2x1bW4ub3BhY2l0eScpID8gMC4xNVxuXG4gIGhpZ2hsaWdodFJlY3Q6IC0+XG4gICAgcmVjdCA9IEBfY3Vyc29yUGl4ZWxSZWN0KClcbiAgICByZWN0LndpZHRoID0gQGVkaXRvci5nZXREZWZhdWx0Q2hhcldpZHRoKCkgaWYgIXJlY3Qud2lkdGggb3IgcmVjdC53aWR0aCBpcyAwXG5cbiAgICAjIEZJWE1FOiByZW1vdmUgY29uZGl0aW9uYWwgYXMgc29vbiBhcyB0aGUgdGlsZWQgZWRpdG9yIGlzIHJlbGVhc2VkLlxuICAgIHJlY3QubGVmdCAtPSBAZWRpdG9yRWxlbWVudC5nZXRTY3JvbGxMZWZ0KCkgaWYgQGVkaXRvckVsZW1lbnQuaGFzVGlsZWRSZW5kZXJpbmdcbiAgICByZWN0XG5cbiAgX2N1cnNvclBpeGVsUmVjdDogLT5cbiAgICB7cm93LCBjb2x1bW59ID0gQGN1cnNvci5nZXRTY3JlZW5Qb3NpdGlvbigpXG4gICAgc2NyZWVuUmFuZ2UgPSBuZXcgUmFuZ2UobmV3IFBvaW50KHJvdywgY29sdW1uKSwgbmV3IFBvaW50KHJvdywgY29sdW1uICsgMSkpXG4gICAgcmVjdCA9IEBlZGl0b3JFbGVtZW50LnBpeGVsUmVjdEZvclNjcmVlblJhbmdlKHNjcmVlblJhbmdlKVxuICAgIHJhbmdlID0gQGVkaXRvckVsZW1lbnQucGl4ZWxSYW5nZUZvclNjcmVlblJhbmdlKHNjcmVlblJhbmdlKVxuICAgIHJlY3QubGVmdCA9IHJhbmdlLnN0YXJ0LmxlZnRcbiAgICByZWN0LnJpZ2h0ID0gcmFuZ2UuZW5kLmxlZnRcbiAgICByZWN0XG5cbm1vZHVsZS5leHBvcnRzID0gZG9jdW1lbnQucmVnaXN0ZXJFbGVtZW50KCdoaWdobGlnaHQtY29sdW1uJyxcbiAgZXh0ZW5kczogJ2RpdidcbiAgcHJvdG90eXBlOiBIaWdobGlnaHRDb2x1bW5WaWV3LnByb3RvdHlwZVxuKVxuIl19
