$(document).ready(function() {

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
    $('.tab-pages div.tab-page').hide();
    $(".tab-pages div.tab-page:nth-child(" + (index + 1) + ")").show();
  });

  // $('.picture-container svg').attr("width", 300)
  // $('.picture-container svg').attr("height", 300)
  // $('.picture-container svg').attr("viewBox", "0 0 400 400")

 })


// viewBox="0 0 400 400"
// heigh/width="300"