"use babel";
"use strict";
/*
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
title      Util Theme Library                                  +
project    nord-atom-syntax                                    +
repository https://github.com/arcticicestudio/nord-atom-syntax +
author     Arctic Ice Studio                                   +
email      development@arcticicestudio.com                     +
copyright  Copyright (C) 2017                                  +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*/
Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = {
  toggleClass: function toggleClass(boolean, className) {
    var root = document.querySelector("atom-workspace");

    if (boolean) {
      root.classList.add(className);
    } else {
      root.classList.remove(className);
    }
  }
};
module.exports = exports["default"];
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9ob21lL2xiaWdhcy8uYXRvbS9wYWNrYWdlcy9ub3JkLWF0b20tc3ludGF4L2xpYi91dGlscy5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQSxXQUFXLENBQUM7QUFDWixZQUFZLENBQUM7Ozs7Ozs7Ozs7Ozs7O3FCQVdFO0FBQ2IsYUFBVyxFQUFBLHFCQUFDLE9BQU8sRUFBRSxTQUFTLEVBQUU7QUFDOUIsUUFBSSxJQUFJLEdBQUcsUUFBUSxDQUFDLGFBQWEsQ0FBQyxnQkFBZ0IsQ0FBQyxDQUFDOztBQUVwRCxRQUFJLE9BQU8sRUFBRTtBQUNYLFVBQUksQ0FBQyxTQUFTLENBQUMsR0FBRyxDQUFDLFNBQVMsQ0FBQyxDQUFDO0tBQy9CLE1BQU07QUFDTCxVQUFJLENBQUMsU0FBUyxDQUFDLE1BQU0sQ0FBQyxTQUFTLENBQUMsQ0FBQztLQUNsQztHQUNGO0NBQ0YiLCJmaWxlIjoiL2hvbWUvbGJpZ2FzLy5hdG9tL3BhY2thZ2VzL25vcmQtYXRvbS1zeW50YXgvbGliL3V0aWxzLmpzIiwic291cmNlc0NvbnRlbnQiOlsiXCJ1c2UgYmFiZWxcIjtcblwidXNlIHN0cmljdFwiO1xuLypcbisrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKytcbnRpdGxlICAgICAgVXRpbCBUaGVtZSBMaWJyYXJ5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICtcbnByb2plY3QgICAgbm9yZC1hdG9tLXN5bnRheCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICtcbnJlcG9zaXRvcnkgaHR0cHM6Ly9naXRodWIuY29tL2FyY3RpY2ljZXN0dWRpby9ub3JkLWF0b20tc3ludGF4ICtcbmF1dGhvciAgICAgQXJjdGljIEljZSBTdHVkaW8gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICtcbmVtYWlsICAgICAgZGV2ZWxvcG1lbnRAYXJjdGljaWNlc3R1ZGlvLmNvbSAgICAgICAgICAgICAgICAgICAgICtcbmNvcHlyaWdodCAgQ29weXJpZ2h0IChDKSAyMDE3ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICtcbisrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKytcbiovXG5leHBvcnQgZGVmYXVsdCB7XG4gIHRvZ2dsZUNsYXNzKGJvb2xlYW4sIGNsYXNzTmFtZSkge1xuICAgIGxldCByb290ID0gZG9jdW1lbnQucXVlcnlTZWxlY3RvcihcImF0b20td29ya3NwYWNlXCIpO1xuICAgIFxuICAgIGlmIChib29sZWFuKSB7XG4gICAgICByb290LmNsYXNzTGlzdC5hZGQoY2xhc3NOYW1lKTtcbiAgICB9IGVsc2Uge1xuICAgICAgcm9vdC5jbGFzc0xpc3QucmVtb3ZlKGNsYXNzTmFtZSk7XG4gICAgfVxuICB9XG59O1xuIl19