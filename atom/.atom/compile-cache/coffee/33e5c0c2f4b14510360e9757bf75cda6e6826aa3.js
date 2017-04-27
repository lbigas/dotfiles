(function() {
  var TabNumbers, TabNumbersView;

  TabNumbersView = null;

  module.exports = TabNumbers = {
    config: {
      showNumberOfOpenTabs: {
        type: 'boolean',
        "default": true
      }
    },
    activate: function() {},
    deactivate: function() {
      var ref, ref1;
      if ((ref = this.tabNumbersView) != null) {
        ref.destroy();
      }
      this.tabNumbersView = null;
      if ((ref1 = this.statusBarTile) != null) {
        ref1.destroy();
      }
      return this.statusBarTile = null;
    },
    consumeStatusBar: function(statusBar) {
      return atom.config.observe('tab-numbers.showNumberOfOpenTabs', (function(_this) {
        return function(newValue) {
          if (newValue) {
            if (TabNumbersView == null) {
              TabNumbersView = require('./tab-numbers-view');
            }
            if (_this.tabNumbersView == null) {
              _this.tabNumbersView = new TabNumbersView();
            }
            return _this.statusBarTile = statusBar.addLeftTile({
              item: _this.tabNumbersView,
              priority: 200
            });
          } else {
            return _this.deactivate();
          }
        };
      })(this));
    }
  };

}).call(this);

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiL2hvbWUvbGJpZ2FzLy5hdG9tL3BhY2thZ2VzL3RhYi1udW1iZXJzL2xpYi90YWItbnVtYmVycy5jb2ZmZWUiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7QUFBQSxNQUFBOztFQUFBLGNBQUEsR0FBaUI7O0VBRWpCLE1BQU0sQ0FBQyxPQUFQLEdBQWlCLFVBQUEsR0FDZjtJQUFBLE1BQUEsRUFDRTtNQUFBLG9CQUFBLEVBQ0U7UUFBQSxJQUFBLEVBQU0sU0FBTjtRQUNBLENBQUEsT0FBQSxDQUFBLEVBQVMsSUFEVDtPQURGO0tBREY7SUFLQSxRQUFBLEVBQVUsU0FBQSxHQUFBLENBTFY7SUFPQSxVQUFBLEVBQVksU0FBQTtBQUNWLFVBQUE7O1dBQWUsQ0FBRSxPQUFqQixDQUFBOztNQUNBLElBQUMsQ0FBQSxjQUFELEdBQWtCOztZQUNKLENBQUUsT0FBaEIsQ0FBQTs7YUFDQSxJQUFDLENBQUEsYUFBRCxHQUFpQjtJQUpQLENBUFo7SUFhQSxnQkFBQSxFQUFrQixTQUFDLFNBQUQ7YUFDaEIsSUFBSSxDQUFDLE1BQU0sQ0FBQyxPQUFaLENBQW9CLGtDQUFwQixFQUF3RCxDQUFBLFNBQUEsS0FBQTtlQUFBLFNBQUMsUUFBRDtVQUN0RCxJQUFHLFFBQUg7O2NBQ0UsaUJBQWtCLE9BQUEsQ0FBUSxvQkFBUjs7O2NBQ2xCLEtBQUMsQ0FBQSxpQkFBc0IsSUFBQSxjQUFBLENBQUE7O21CQUN2QixLQUFDLENBQUEsYUFBRCxHQUFpQixTQUFTLENBQUMsV0FBVixDQUFzQjtjQUFBLElBQUEsRUFBTSxLQUFDLENBQUEsY0FBUDtjQUF1QixRQUFBLEVBQVUsR0FBakM7YUFBdEIsRUFIbkI7V0FBQSxNQUFBO21CQUtFLEtBQUMsQ0FBQSxVQUFELENBQUEsRUFMRjs7UUFEc0Q7TUFBQSxDQUFBLENBQUEsQ0FBQSxJQUFBLENBQXhEO0lBRGdCLENBYmxCOztBQUhGIiwic291cmNlc0NvbnRlbnQiOlsiVGFiTnVtYmVyc1ZpZXcgPSBudWxsXG5cbm1vZHVsZS5leHBvcnRzID0gVGFiTnVtYmVycyA9XG4gIGNvbmZpZzpcbiAgICBzaG93TnVtYmVyT2ZPcGVuVGFiczpcbiAgICAgIHR5cGU6ICdib29sZWFuJ1xuICAgICAgZGVmYXVsdDogdHJ1ZVxuXG4gIGFjdGl2YXRlOiAtPlxuXG4gIGRlYWN0aXZhdGU6IC0+XG4gICAgQHRhYk51bWJlcnNWaWV3Py5kZXN0cm95KClcbiAgICBAdGFiTnVtYmVyc1ZpZXcgPSBudWxsXG4gICAgQHN0YXR1c0JhclRpbGU/LmRlc3Ryb3koKVxuICAgIEBzdGF0dXNCYXJUaWxlID0gbnVsbFxuXG4gIGNvbnN1bWVTdGF0dXNCYXI6IChzdGF0dXNCYXIpIC0+XG4gICAgYXRvbS5jb25maWcub2JzZXJ2ZSAndGFiLW51bWJlcnMuc2hvd051bWJlck9mT3BlblRhYnMnLCAobmV3VmFsdWUpID0+XG4gICAgICBpZiBuZXdWYWx1ZVxuICAgICAgICBUYWJOdW1iZXJzVmlldyA/PSByZXF1aXJlICcuL3RhYi1udW1iZXJzLXZpZXcnXG4gICAgICAgIEB0YWJOdW1iZXJzVmlldyA/PSBuZXcgVGFiTnVtYmVyc1ZpZXcoKVxuICAgICAgICBAc3RhdHVzQmFyVGlsZSA9wqBzdGF0dXNCYXIuYWRkTGVmdFRpbGUoaXRlbTogQHRhYk51bWJlcnNWaWV3LCBwcmlvcml0eTogMjAwKVxuICAgICAgZWxzZVxuICAgICAgICBAZGVhY3RpdmF0ZSgpXG4iXX0=
