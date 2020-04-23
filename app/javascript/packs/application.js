// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
/*purgecss start ignore*/
import "layouts/application.css";
import "@fortawesome/fontawesome-free/js/all.js"
import "shared/flashes.js"
/*purgecss end ignore*/
// Add Choices Dropdown
const Choices = require('choices.js')
document.addEventListener("turbolinks:load", function () {
  var dropDownSelects = new Choices('#dropdown-choice-select')
})

// document.addEventListener("turbolinks:load", function() {
//   var dropDownSelects = new Choices('#dropdown-choice-select-1')
// })

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
