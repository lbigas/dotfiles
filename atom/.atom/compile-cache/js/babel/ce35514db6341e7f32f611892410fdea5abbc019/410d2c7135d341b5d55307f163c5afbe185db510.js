Object.defineProperty(exports, "__esModule", {
  value: true
});

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

/*
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
title      Main Theme Library                                  +
project    nord-atom-syntax                                    +
repository https://github.com/arcticicestudio/nord-atom-syntax +
author     Arctic Ice Studio                                   +
email      development@arcticicestudio.com                     +
copyright  Copyright (C) 2017                                  +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*/

var _fs = require("fs");

var _fs2 = _interopRequireDefault(_fs);

var _utils = require("./utils");

"use babel";
"use strict";exports["default"] = {
  writeConfig: function writeConfig(options) {
    var customCommentContrast = atom.config.get("nord-atom-syntax.accessibility.commentContrast");
    var config = "@theme-setting-accessibility-custom-comment-contrast: " + customCommentContrast + "%;\n";

    _fs2["default"].writeFile(__dirname + "/../styles/theme-settings-store.less", config, "utf8", function () {
      if (!options || !options.noReload) {
        (function () {
          var themePack = atom.packages.getLoadedPackage("nord-atom-syntax");

          if (themePack) {
            setImmediate(function () {
              return themePack.activate();
            });
          }
        })();
      }
      if (options && options.callback && typeof options.callback === "function") {
        options.callback();
      }
    });
  },

  activate: function activate() {
    var _this = this;

    (0, _utils.toggleClass)(true, "theme-nord-atom-syntax-accessibility-custom-comment-contrast");
    atom.config.onDidChange("nord-atom-syntax.accessibility.commentContrast", function () {
      return _this.writeConfig({ noReload: true });
    });
  }
};
module.exports = exports["default"];
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9ob21lL2xiaWdhcy8uYXRvbS9wYWNrYWdlcy9ub3JkLWF0b20tc3ludGF4L2xpYi9tYWluLmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7O2tCQVllLElBQUk7Ozs7cUJBQ1MsU0FBUzs7QUFickMsV0FBVyxDQUFDO0FBQ1osWUFBWSxDQUFDLHFCQWNFO0FBQ2IsYUFBVyxFQUFBLHFCQUFDLE9BQU8sRUFBRTtBQUNuQixRQUFJLHFCQUFxQixHQUFHLElBQUksQ0FBQyxNQUFNLENBQUMsR0FBRyxDQUFDLGdEQUFnRCxDQUFDLENBQUM7QUFDOUYsUUFBSSxNQUFNLDhEQUE0RCxxQkFBcUIsU0FBTSxDQUFDOztBQUVsRyxvQkFBRyxTQUFTLENBQUksU0FBUywyQ0FBd0MsTUFBTSxFQUFFLE1BQU0sRUFBRSxZQUFNO0FBQ3JGLFVBQUksQ0FBQyxPQUFPLElBQUksQ0FBQyxPQUFPLENBQUMsUUFBUSxFQUFFOztBQUNqQyxjQUFJLFNBQVMsR0FBRyxJQUFJLENBQUMsUUFBUSxDQUFDLGdCQUFnQixDQUFDLGtCQUFrQixDQUFDLENBQUM7O0FBRW5FLGNBQUksU0FBUyxFQUFFO0FBQ2Isd0JBQVksQ0FBQztxQkFBTSxTQUFTLENBQUMsUUFBUSxFQUFFO2FBQUEsQ0FBQyxDQUFDO1dBQzFDOztPQUNGO0FBQ0QsVUFBSSxPQUFPLElBQUksT0FBTyxDQUFDLFFBQVEsSUFBSSxPQUFPLE9BQU8sQ0FBQyxRQUFRLEtBQUssVUFBVSxFQUFFO0FBQ3pFLGVBQU8sQ0FBQyxRQUFRLEVBQUUsQ0FBQztPQUNwQjtLQUNGLENBQUMsQ0FBQztHQUNKOztBQUVELFVBQVEsRUFBQSxvQkFBRzs7O0FBQ1QsNEJBQVksSUFBSSxFQUFFLDhEQUE4RCxDQUFDLENBQUM7QUFDbEYsUUFBSSxDQUFDLE1BQU0sQ0FBQyxXQUFXLENBQUMsZ0RBQWdELEVBQUU7YUFBSyxNQUFLLFdBQVcsQ0FBQyxFQUFFLFFBQVEsRUFBRSxJQUFJLEVBQUUsQ0FBQztLQUFBLENBQUMsQ0FBQztHQUN0SDtDQUNGIiwiZmlsZSI6Ii9ob21lL2xiaWdhcy8uYXRvbS9wYWNrYWdlcy9ub3JkLWF0b20tc3ludGF4L2xpYi9tYWluLmpzIiwic291cmNlc0NvbnRlbnQiOlsiXCJ1c2UgYmFiZWxcIjtcblwidXNlIHN0cmljdFwiO1xuLypcbisrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKytcbnRpdGxlICAgICAgTWFpbiBUaGVtZSBMaWJyYXJ5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICtcbnByb2plY3QgICAgbm9yZC1hdG9tLXN5bnRheCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICtcbnJlcG9zaXRvcnkgaHR0cHM6Ly9naXRodWIuY29tL2FyY3RpY2ljZXN0dWRpby9ub3JkLWF0b20tc3ludGF4ICtcbmF1dGhvciAgICAgQXJjdGljIEljZSBTdHVkaW8gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICtcbmVtYWlsICAgICAgZGV2ZWxvcG1lbnRAYXJjdGljaWNlc3R1ZGlvLmNvbSAgICAgICAgICAgICAgICAgICAgICtcbmNvcHlyaWdodCAgQ29weXJpZ2h0IChDKSAyMDE3ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICtcbisrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKytcbiovXG5pbXBvcnQgZnMgZnJvbSBcImZzXCI7XG5pbXBvcnQgeyB0b2dnbGVDbGFzcyB9IGZyb20gXCIuL3V0aWxzXCI7XG5cbmV4cG9ydCBkZWZhdWx0IHtcbiAgd3JpdGVDb25maWcob3B0aW9ucykge1xuICAgIGxldCBjdXN0b21Db21tZW50Q29udHJhc3QgPSBhdG9tLmNvbmZpZy5nZXQoXCJub3JkLWF0b20tc3ludGF4LmFjY2Vzc2liaWxpdHkuY29tbWVudENvbnRyYXN0XCIpO1xuICAgIGxldCBjb25maWcgPSBgQHRoZW1lLXNldHRpbmctYWNjZXNzaWJpbGl0eS1jdXN0b20tY29tbWVudC1jb250cmFzdDogJHtjdXN0b21Db21tZW50Q29udHJhc3R9JTtcXG5gO1xuXG4gICAgZnMud3JpdGVGaWxlKGAke19fZGlybmFtZX0vLi4vc3R5bGVzL3RoZW1lLXNldHRpbmdzLXN0b3JlLmxlc3NgLCBjb25maWcsIFwidXRmOFwiLCAoKSA9PiB7XG4gICAgICBpZiAoIW9wdGlvbnMgfHwgIW9wdGlvbnMubm9SZWxvYWQpIHtcbiAgICAgICAgbGV0IHRoZW1lUGFjayA9IGF0b20ucGFja2FnZXMuZ2V0TG9hZGVkUGFja2FnZShcIm5vcmQtYXRvbS1zeW50YXhcIik7XG4gICAgICAgIFxuICAgICAgICBpZiAodGhlbWVQYWNrKSB7XG4gICAgICAgICAgc2V0SW1tZWRpYXRlKCgpID0+IHRoZW1lUGFjay5hY3RpdmF0ZSgpKTtcbiAgICAgICAgfVxuICAgICAgfVxuICAgICAgaWYgKG9wdGlvbnMgJiYgb3B0aW9ucy5jYWxsYmFjayAmJiB0eXBlb2Ygb3B0aW9ucy5jYWxsYmFjayA9PT0gXCJmdW5jdGlvblwiKSB7XG4gICAgICAgIG9wdGlvbnMuY2FsbGJhY2soKTtcbiAgICAgIH1cbiAgICB9KTtcbiAgfSxcblxuICBhY3RpdmF0ZSgpIHtcbiAgICB0b2dnbGVDbGFzcyh0cnVlLCBcInRoZW1lLW5vcmQtYXRvbS1zeW50YXgtYWNjZXNzaWJpbGl0eS1jdXN0b20tY29tbWVudC1jb250cmFzdFwiKTtcbiAgICBhdG9tLmNvbmZpZy5vbkRpZENoYW5nZShcIm5vcmQtYXRvbS1zeW50YXguYWNjZXNzaWJpbGl0eS5jb21tZW50Q29udHJhc3RcIiwgKCkgPT50aGlzLndyaXRlQ29uZmlnKHsgbm9SZWxvYWQ6IHRydWUgfSkpO1xuICB9XG59O1xuIl19