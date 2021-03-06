$(document).ready(function(){

  $('.color').css('background-color', '#000');
  $('.color').css('color', '#fff');

  
  var canvas;

  $(function () {
      canvas = window._canvas = new fabric.Canvas('canvas');
      canvas.backgroundColor = '#efefef';
      canvas.setHeight(500);
      canvas.setWidth(500);
      
      canvas.renderAll();
      canvas.isDrawingMode = !canvas.isDrawingMode;
      canvas.freeDrawingBrush.width = 13;
      canvas.freeDrawingBrush.color = "#fff";

      $('.color')[0].addEventListener('change', function (e) {
          console.log($(this).css('background-color'));
          canvas.freeDrawingBrush.color = $(this).css('background-color');
      })

      $('#save').click(function(e) {
          var svg = canvas.toSVG();
          var data = {svg: svg};
          $.post('/draw', data, function(response) {
              console.log('done');
              window.location.href = '/';
          })
  })
  });
})