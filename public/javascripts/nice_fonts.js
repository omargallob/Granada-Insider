// JavaScript Document
jQuery.fn.nice_fonts = function(){
	Cufon.replace('#navbar ul li', {
		   fontFamily: "Quicksand Bold",
		   color: 'black',
		   fontSize: "24px",
	  		hover: {
	   		color: 'white'
	  	 }
	 });
	Cufon.replace('h1', {
		   fontFamily: "Quicksand Bold",
		   color: 'black',
		   fontSize: "24px",
	  		hover: {
	   		color: 'white'
	  	 }
	 });
	 	Cufon.replace('h4', {
		   fontFamily: "Quicksand Bold",
		   color: 'black',
		   fontSize: "16px",
	  		hover: {
	   		color: 'white'
	  	 }
	 });
}