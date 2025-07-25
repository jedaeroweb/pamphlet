# Pin npm packages by running ./bin/importmap

Rails.application.config.importmap.draw do
  pin "application"
  pin "@hotwired/turbo-rails", to: "turbo.min.js"
  pin "rails-ujs", to: "rails-ujs.js"
  pin "jquery" # @3.7.1
  pin "fancybox", to: "fancybox.js"
  pin "tagcanvas", to: "tagcanvas.min.js"
  pin "bootstrap", to: "bootstrap.min.js"
  pin "common", to: "common.js"
  pin "index", to: "index.js"
end