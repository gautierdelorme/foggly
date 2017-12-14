// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

document.addEventListener('turbolinks:load', function() {
  $(function(){
      var scrollable = $(".scrollable")
      if (scrollable.length > 0)
        scrollable.scrollTop(scrollable[0].scrollHeight)
  })
})

document.addEventListener('ajax:complete',function (event) {
  var xhr = event.detail[0]
  if ((xhr.getResponseHeader('Content-Type') || '').substring(0, 9) === 'text/html') {
    var referrer = window.location.href
    var snapshot = Turbolinks.Snapshot.wrap(xhr.response)
    Turbolinks.controller.cache.put(referrer, snapshot)
    Turbolinks.visit(referrer, { action: 'restore' })
  }
}, false)

document.addEventListener('click', function(e) {
  if (e.target.classList.contains('print-link')) window.print()
})
