$(document).ready(function() {
  
	$('#signup').hide();
	$('#login').hide();

	$('#signup_btn').on('click', function(e){
		e.preventDefault();
		$('#login').hide();
		$('#signup').slideDown(500);
	})

	$('#login_btn').on('click', function(e) {
		e.preventDefault();
		$('#signup').hide();
		$('#login').slideDown(500);
	})


  // $('#save-picture-button').click(function(e) {
  //     var svg = paper.project.exportSVG({asString: true});
  //     var data = {svg: svg}
  //     $.post('/draw', data, function(response) {
  //             console.log('done');
  //     });
  // })

  $('.tab li').click(function(e) {
    var index = $(this).index();
    $('.tab li').removeClass("active");
    $(this).addClass("active");
    $('.tab-pages div').hide();
    $(".tab-pages div:nth-child(" + (index + 1) + ")").show();
  });

  // $('.picture-frame svg').attr("width", 300)
  // $('.picture-frame svg').attr("height", 300)
  // $('.picture-frame svg').attr("viewBox", "0 0 400 400")

 })


// viewBox="0 0 400 400"
// heigh/width="300"