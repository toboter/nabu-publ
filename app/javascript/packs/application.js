/* eslint no-console:0 */

import 'bootstrap'
import 'toastr'
import '@fortawesome/fontawesome-free/js/all.min'
import '../css/application.scss'
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

document.addEventListener('turbolinks:load', function () {
  FontAwesome.dom.i2svg()
})

const application = Application.start()
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))