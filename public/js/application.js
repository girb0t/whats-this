$(document).ready(function() {
  
	$('#signup').hide();
	$('#login').hide();

	$('#signup_btn').on('click', function(e){
		e.preventDefault();
		$('#login').hide();
		$('#signup').slideDown(500);
		console.log('yes')
	})

	$('#login_btn').on('click', function(e) {
		e.preventDefault();
		$('#signup').hide();
		$('#login').slideDown(500);
	})


  $('#save-picture-button').click(function(e) {
      var svg = paper.project.exportSVG({asString: true});
      var data = {svg: svg}
      $.post('/draw', data, function(response) {
              console.log('done');
      });
  })
 })
