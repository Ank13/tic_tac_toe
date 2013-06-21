$(document).ready(function() {
  
  $(function() {
    var pusher = new Pusher('e8019d4e37ae401f9ea2');
    var channel = pusher.subscribe('my_notifications');
    var notifier = new PusherNotifier(channel);
  });


});
