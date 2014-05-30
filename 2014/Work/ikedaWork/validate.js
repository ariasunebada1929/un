function validate(){
	var select =document.getElementById('id_Kyuka1');
    var options = document.getElementById('id_Kyuka1').options;
    var value = options.item(select.selectedIndex).value;
    var message;
    var JissekiStart=document.getElementById('id_jissekiS1').value;
    if(value=="04"){
    	if(JissekiStart !=""){
			if (JissekiStart.match(/^[0-9][0-5][0-9]+$/)) {
				alert( "1“ú‚ÌÀÑ‹Î–±ŠÔEoĞ‚É13ˆÈ~‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢\n");
				return false;
			}
		}
    }
    if(value=="05"){
    	if(JissekiStart !=""){
			if (JissekiEnd.match(/^[1][2-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				alert( "1“ú‚ÌÀÑ‹Î–±ŠÔE‘ŞĞ‚É³‚µ‚¢‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢\n");
				return false;
			}
		}
    }
    
}