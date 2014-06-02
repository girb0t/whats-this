$(document).ready(function(){

  $('.color').css('background-color', '#000');
  $('.color').css('color', '#fff');

  
  var canvas;

  $(function () {
      canvas = window._canvas = new fabric.Canvas('canvas');
      canvas.backgroundColor = '#efefef';
      
      canvas.renderAll();
      canvas.isDrawingMode = !canvas.isDrawingMode;
      canvas.freeDrawingBrush.width = 15;
      canvas.freeDrawingBrush.color = "#fff";



      // document.getElementById('freedraw').addEventListener('click', function () {
      //     canvas.isDrawingMode = !canvas.isDrawingMode;
      //     canvas.freeDrawingBrush.width = 15;
      // });

      // document.getElementById('colorpicker').addEventListener('change', function (e) {
      //     console.log(e.target.value);
      //     // canvas.freeDrawingBrush.color = e.target.value;
      //     canvas.freeDrawingBrush.color = '#33FF33';
      // });

      $('.color')[0].addEventListener('change', function (e) {
          console.log($(this).css('background-color'));
          canvas.freeDrawingBrush.color = $(this).css('background-color');
      })

      $('#save').click(function(e) {
          var svg = canvas.toSVG();
          // console.log(picture);
          var data = {svg: svg}
          $.post('/draw', data, function(response) {
              console.log('done');
              window.location.href = '/';
          })
  })
  });
})