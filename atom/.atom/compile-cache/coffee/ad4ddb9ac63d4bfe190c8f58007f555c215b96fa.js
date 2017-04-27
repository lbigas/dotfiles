(function() {
  var CompositeDisposable, TabNumbersView, View,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  View = require('atom-space-pen-views').View;

  CompositeDisposable = require('atom').CompositeDisposable;

  module.exports = TabNumbersView = (function(superClass) {
    extend(TabNumbersView, superClass);

    function TabNumbersView() {
      return TabNumbersView.__super__.constructor.apply(this, arguments);
    }

    TabNumbersView.prototype.nTabs = 0;

    TabNumbersView.content = function() {
      return this.div({
        "class": 'tab-numbers inline-block',
        tabindex: -1
      }, (function(_this) {
        return function() {
          return _this.div({
            outlet: 'tabNumbers'
          }, function() {
            _this.span({
              "class": 'icon icon-versions'
            });
            return _this.span({
              "class": 'tabs-count',
              outlet: 'tabCount'
            }, '0');
          });
        };
      })(this));
    };

    TabNumbersView.prototype.initialize = function() {
      this.subscriptions = new CompositeDisposable;
      this.update();
      this.subscriptions.add(atom.workspace.onDidAddPaneItem((function(_this) {
        return function(event) {
          return _this.update();
        };
      })(this)));
      return this.subscriptions.add(atom.workspace.onDidDestroyPaneItem((function(_this) {
        return function(event) {
          return _this.update();
        };
      })(this)));
    };

    TabNumbersView.prototype.destroy = function() {
      this.subscriptions.dispose();
      return this.detach();
    };

    TabNumbersView.prototype.update = function() {
      var ref;
      this.nTabs = atom.workspace.getPaneItems().length;
      this.tabNumbers.toggleClass('text-warning', this.nTabs >= 5 && this.nTabs < 10);
      this.tabNumbers.toggleClass('text-error', this.nTabs >= 10);
      this.tabCount.text(this.nTabs);
      if ((ref = this.toolTipDisposable) != null) {
        ref.dispose();
      }
      return this.toolTipDisposable = atom.tooltips.add(this.element, {
        title: this.nTabs + " open tabs"
      });
    };

    return TabNumbersView;

  })(View);

}).call(this);

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiL2hvbWUvbGJpZ2FzLy5hdG9tL3BhY2thZ2VzL3RhYi1udW1iZXJzL2xpYi90YWItbnVtYmVycy12aWV3LmNvZmZlZSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQTtBQUFBLE1BQUEseUNBQUE7SUFBQTs7O0VBQUMsT0FBUSxPQUFBLENBQVEsc0JBQVI7O0VBQ1Isc0JBQXVCLE9BQUEsQ0FBUSxNQUFSOztFQUV4QixNQUFNLENBQUMsT0FBUCxHQUNNOzs7Ozs7OzZCQUNKLEtBQUEsR0FBTzs7SUFFUCxjQUFDLENBQUEsT0FBRCxHQUFVLFNBQUE7YUFDUixJQUFDLENBQUEsR0FBRCxDQUFLO1FBQUEsQ0FBQSxLQUFBLENBQUEsRUFBTywwQkFBUDtRQUFtQyxRQUFBLEVBQVUsQ0FBQyxDQUE5QztPQUFMLEVBQXNELENBQUEsU0FBQSxLQUFBO2VBQUEsU0FBQTtpQkFDcEQsS0FBQyxDQUFBLEdBQUQsQ0FBSztZQUFBLE1BQUEsRUFBUSxZQUFSO1dBQUwsRUFBMkIsU0FBQTtZQUN6QixLQUFDLENBQUEsSUFBRCxDQUFNO2NBQUEsQ0FBQSxLQUFBLENBQUEsRUFBTyxvQkFBUDthQUFOO21CQUNBLEtBQUMsQ0FBQSxJQUFELENBQU07Y0FBQSxDQUFBLEtBQUEsQ0FBQSxFQUFPLFlBQVA7Y0FBcUIsTUFBQSxFQUFRLFVBQTdCO2FBQU4sRUFBK0MsR0FBL0M7VUFGeUIsQ0FBM0I7UUFEb0Q7TUFBQSxDQUFBLENBQUEsQ0FBQSxJQUFBLENBQXREO0lBRFE7OzZCQU1WLFVBQUEsR0FBWSxTQUFBO01BQ1YsSUFBQyxDQUFBLGFBQUQsR0FBaUIsSUFBSTtNQUNyQixJQUFDLENBQUEsTUFBRCxDQUFBO01BRUEsSUFBQyxDQUFBLGFBQWEsQ0FBQyxHQUFmLENBQW1CLElBQUksQ0FBQyxTQUFTLENBQUMsZ0JBQWYsQ0FBZ0MsQ0FBQSxTQUFBLEtBQUE7ZUFBQSxTQUFDLEtBQUQ7aUJBQ2pELEtBQUMsQ0FBQSxNQUFELENBQUE7UUFEaUQ7TUFBQSxDQUFBLENBQUEsQ0FBQSxJQUFBLENBQWhDLENBQW5CO2FBR0EsSUFBQyxDQUFBLGFBQWEsQ0FBQyxHQUFmLENBQW1CLElBQUksQ0FBQyxTQUFTLENBQUMsb0JBQWYsQ0FBb0MsQ0FBQSxTQUFBLEtBQUE7ZUFBQSxTQUFDLEtBQUQ7aUJBQ3JELEtBQUMsQ0FBQSxNQUFELENBQUE7UUFEcUQ7TUFBQSxDQUFBLENBQUEsQ0FBQSxJQUFBLENBQXBDLENBQW5CO0lBUFU7OzZCQVVaLE9BQUEsR0FBUyxTQUFBO01BQ1AsSUFBQyxDQUFBLGFBQWEsQ0FBQyxPQUFmLENBQUE7YUFDQSxJQUFDLENBQUEsTUFBRCxDQUFBO0lBRk87OzZCQUlULE1BQUEsR0FBUSxTQUFBO0FBQ04sVUFBQTtNQUFBLElBQUMsQ0FBQSxLQUFELEdBQVMsSUFBSSxDQUFDLFNBQVMsQ0FBQyxZQUFmLENBQUEsQ0FBNkIsQ0FBQztNQUV2QyxJQUFDLENBQUEsVUFBVSxDQUFDLFdBQVosQ0FBd0IsY0FBeEIsRUFBd0MsSUFBQyxDQUFBLEtBQUQsSUFBVSxDQUFWLElBQWUsSUFBQyxDQUFBLEtBQUQsR0FBUyxFQUFoRTtNQUNBLElBQUMsQ0FBQSxVQUFVLENBQUMsV0FBWixDQUF3QixZQUF4QixFQUFzQyxJQUFDLENBQUEsS0FBRCxJQUFVLEVBQWhEO01BRUEsSUFBQyxDQUFBLFFBQVEsQ0FBQyxJQUFWLENBQWUsSUFBQyxDQUFBLEtBQWhCOztXQUNrQixDQUFFLE9BQXBCLENBQUE7O2FBQ0EsSUFBQyxDQUFBLGlCQUFELEdBQXFCLElBQUksQ0FBQyxRQUFRLENBQUMsR0FBZCxDQUFrQixJQUFDLENBQUEsT0FBbkIsRUFBNEI7UUFBQSxLQUFBLEVBQVUsSUFBQyxDQUFBLEtBQUYsR0FBUSxZQUFqQjtPQUE1QjtJQVJmOzs7O0tBdkJtQjtBQUo3QiIsInNvdXJjZXNDb250ZW50IjpbIntWaWV3fSA9IHJlcXVpcmUgJ2F0b20tc3BhY2UtcGVuLXZpZXdzJ1xue0NvbXBvc2l0ZURpc3Bvc2FibGV9ID0gcmVxdWlyZSAnYXRvbSdcblxubW9kdWxlLmV4cG9ydHMgPVxuY2xhc3MgVGFiTnVtYmVyc1ZpZXcgZXh0ZW5kcyBWaWV3XG4gIG5UYWJzOiAwXG5cbiAgQGNvbnRlbnQ6IC0+XG4gICAgQGRpdiBjbGFzczogJ3RhYi1udW1iZXJzIGlubGluZS1ibG9jaycsIHRhYmluZGV4OiAtMSwgPT5cbiAgICAgIEBkaXYgb3V0bGV0OiAndGFiTnVtYmVycycsID0+XG4gICAgICAgIEBzcGFuIGNsYXNzOiAnaWNvbiBpY29uLXZlcnNpb25zJ1xuICAgICAgICBAc3BhbiBjbGFzczogJ3RhYnMtY291bnQnLCBvdXRsZXQ6ICd0YWJDb3VudCcsICcwJ1xuXG4gIGluaXRpYWxpemU6IC0+XG4gICAgQHN1YnNjcmlwdGlvbnMgPSBuZXcgQ29tcG9zaXRlRGlzcG9zYWJsZVxuICAgIEB1cGRhdGUoKVxuXG4gICAgQHN1YnNjcmlwdGlvbnMuYWRkIGF0b20ud29ya3NwYWNlLm9uRGlkQWRkUGFuZUl0ZW0gKGV2ZW50KSA9PlxuICAgICAgQHVwZGF0ZSgpXG5cbiAgICBAc3Vic2NyaXB0aW9ucy5hZGQgYXRvbS53b3Jrc3BhY2Uub25EaWREZXN0cm95UGFuZUl0ZW0gKGV2ZW50KSA9PlxuICAgICAgQHVwZGF0ZSgpXG5cbiAgZGVzdHJveTogLT5cbiAgICBAc3Vic2NyaXB0aW9ucy5kaXNwb3NlKClcbiAgICBAZGV0YWNoKClcblxuICB1cGRhdGU6IC0+XG4gICAgQG5UYWJzID0gYXRvbS53b3Jrc3BhY2UuZ2V0UGFuZUl0ZW1zKCkubGVuZ3RoXG5cbiAgICBAdGFiTnVtYmVycy50b2dnbGVDbGFzcygndGV4dC13YXJuaW5nJywgQG5UYWJzID49IDUgJiYgQG5UYWJzIDwgMTApXG4gICAgQHRhYk51bWJlcnMudG9nZ2xlQ2xhc3MoJ3RleHQtZXJyb3InLCBAblRhYnMgPj0gMTApXG5cbiAgICBAdGFiQ291bnQudGV4dChAblRhYnMpXG4gICAgQHRvb2xUaXBEaXNwb3NhYmxlPy5kaXNwb3NlKClcbiAgICBAdG9vbFRpcERpc3Bvc2FibGUgPSBhdG9tLnRvb2x0aXBzLmFkZCBAZWxlbWVudCwgdGl0bGU6IFwiI3tAblRhYnN9IG9wZW4gdGFic1wiXG4iXX0=
