(function() {
  var HighlightColumn, HighlightColumnElement;

  HighlightColumnElement = require('./highlight-column-element');

  module.exports = HighlightColumn = {
    config: {
      opacity: {
        type: 'number',
        "default": 0.15,
        minimum: 0,
        maximum: 1
      },
      enabled: {
        type: 'boolean',
        "default": true
      },
      lineMode: {
        type: 'boolean',
        "default": false
      }
    },
    activate: function() {
      atom.commands.add('atom-workspace', 'highlight-column:toggle', (function(_this) {
        return function() {
          return atom.config.set('highlight-column.enabled', !atom.config.get('highlight-column.enabled'));
        };
      })(this));
      return atom.workspace.observeTextEditors(function(editor) {
        return editor.observeCursors((function(_this) {
          return function(cursor) {
            var editorElement, highlightColumnElement;
            editorElement = atom.views.getView(editor);
            return highlightColumnElement = new HighlightColumnElement().initialize(editor, editorElement, cursor);
          };
        })(this));
      });
    }
  };

}).call(this);

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiL2hvbWUvbGJpZ2FzLy5hdG9tL3BhY2thZ2VzL2hpZ2hsaWdodC1jb2x1bW4vbGliL21haW4uY29mZmVlIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0FBQUEsTUFBQTs7RUFBQSxzQkFBQSxHQUF5QixPQUFBLENBQVEsNEJBQVI7O0VBRXpCLE1BQU0sQ0FBQyxPQUFQLEdBQWlCLGVBQUEsR0FDZjtJQUFBLE1BQUEsRUFDRTtNQUFBLE9BQUEsRUFDRTtRQUFBLElBQUEsRUFBTSxRQUFOO1FBQ0EsQ0FBQSxPQUFBLENBQUEsRUFBUyxJQURUO1FBRUEsT0FBQSxFQUFTLENBRlQ7UUFHQSxPQUFBLEVBQVMsQ0FIVDtPQURGO01BS0EsT0FBQSxFQUNFO1FBQUEsSUFBQSxFQUFNLFNBQU47UUFDQSxDQUFBLE9BQUEsQ0FBQSxFQUFTLElBRFQ7T0FORjtNQVFBLFFBQUEsRUFDRTtRQUFBLElBQUEsRUFBTSxTQUFOO1FBQ0EsQ0FBQSxPQUFBLENBQUEsRUFBUyxLQURUO09BVEY7S0FERjtJQWNBLFFBQUEsRUFBVSxTQUFBO01BQ1IsSUFBSSxDQUFDLFFBQVEsQ0FBQyxHQUFkLENBQWtCLGdCQUFsQixFQUFvQyx5QkFBcEMsRUFBK0QsQ0FBQSxTQUFBLEtBQUE7ZUFBQSxTQUFBO2lCQUM3RCxJQUFJLENBQUMsTUFBTSxDQUFDLEdBQVosQ0FBZ0IsMEJBQWhCLEVBQTRDLENBQUMsSUFBSSxDQUFDLE1BQU0sQ0FBQyxHQUFaLENBQWdCLDBCQUFoQixDQUE3QztRQUQ2RDtNQUFBLENBQUEsQ0FBQSxDQUFBLElBQUEsQ0FBL0Q7YUFHQSxJQUFJLENBQUMsU0FBUyxDQUFDLGtCQUFmLENBQWtDLFNBQUMsTUFBRDtlQUNoQyxNQUFNLENBQUMsY0FBUCxDQUFzQixDQUFBLFNBQUEsS0FBQTtpQkFBQSxTQUFDLE1BQUQ7QUFDcEIsZ0JBQUE7WUFBQSxhQUFBLEdBQWdCLElBQUksQ0FBQyxLQUFLLENBQUMsT0FBWCxDQUFtQixNQUFuQjttQkFDaEIsc0JBQUEsR0FBNkIsSUFBQSxzQkFBQSxDQUFBLENBQXdCLENBQUMsVUFBekIsQ0FBb0MsTUFBcEMsRUFBNEMsYUFBNUMsRUFBMkQsTUFBM0Q7VUFGVDtRQUFBLENBQUEsQ0FBQSxDQUFBLElBQUEsQ0FBdEI7TUFEZ0MsQ0FBbEM7SUFKUSxDQWRWOztBQUhGIiwic291cmNlc0NvbnRlbnQiOlsiSGlnaGxpZ2h0Q29sdW1uRWxlbWVudCA9IHJlcXVpcmUgJy4vaGlnaGxpZ2h0LWNvbHVtbi1lbGVtZW50J1xuXG5tb2R1bGUuZXhwb3J0cyA9IEhpZ2hsaWdodENvbHVtbiA9XG4gIGNvbmZpZzpcbiAgICBvcGFjaXR5OlxuICAgICAgdHlwZTogJ251bWJlcidcbiAgICAgIGRlZmF1bHQ6IDAuMTVcbiAgICAgIG1pbmltdW06IDBcbiAgICAgIG1heGltdW06IDFcbiAgICBlbmFibGVkOlxuICAgICAgdHlwZTogJ2Jvb2xlYW4nXG4gICAgICBkZWZhdWx0OiB0cnVlXG4gICAgbGluZU1vZGU6XG4gICAgICB0eXBlOiAnYm9vbGVhbidcbiAgICAgIGRlZmF1bHQ6IGZhbHNlXG5cblxuICBhY3RpdmF0ZTogLT5cbiAgICBhdG9tLmNvbW1hbmRzLmFkZCAnYXRvbS13b3Jrc3BhY2UnLCAnaGlnaGxpZ2h0LWNvbHVtbjp0b2dnbGUnLCA9PlxuICAgICAgYXRvbS5jb25maWcuc2V0KCdoaWdobGlnaHQtY29sdW1uLmVuYWJsZWQnLCAhYXRvbS5jb25maWcuZ2V0KCdoaWdobGlnaHQtY29sdW1uLmVuYWJsZWQnKSlcblxuICAgIGF0b20ud29ya3NwYWNlLm9ic2VydmVUZXh0RWRpdG9ycyAoZWRpdG9yKSAtPlxuICAgICAgZWRpdG9yLm9ic2VydmVDdXJzb3JzIChjdXJzb3IpID0+XG4gICAgICAgIGVkaXRvckVsZW1lbnQgPSBhdG9tLnZpZXdzLmdldFZpZXcoZWRpdG9yKVxuICAgICAgICBoaWdobGlnaHRDb2x1bW5FbGVtZW50ID0gbmV3IEhpZ2hsaWdodENvbHVtbkVsZW1lbnQoKS5pbml0aWFsaXplKGVkaXRvciwgZWRpdG9yRWxlbWVudCwgY3Vyc29yKVxuIl19
