var path;

function onMouseDown(event) {
  // Create a new path and select it:
  path = new Path();
  var color = $('.color').css('background-color')
  // var color = #fff
  path.strokeColor = color;
  path.strokeWidth = 5; 

  // Add a segment to the path where
  // you clicked:
  path.add(event.point);
}

function onMouseDrag(event) {
  // Every drag event, add a segment
  // to the path at the position of the mouse:
  path.add(event.point);
}