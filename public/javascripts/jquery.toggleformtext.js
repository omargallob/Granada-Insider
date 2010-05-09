/*
 * ToggleFormText
 *
 * Author:   Grzegorz Frydrychowicz
 * E-mail:   grzegorz.frydrychowicz@gmail.com
 * Date:     16-11-2007
*/

$(document).ready(function(){
    $("input:text, textarea, input:password").each(function(){
        if(this.value == '')
            this.value = this.title;
    });
    $("input:text, textarea, input:password").focus(function(){
        if(this.value == this.title)
            this.value = '';
    });
    $("input:text, textarea, input:password").blur(function(){
        if(this.value == '')
            this.value = this.title;
    });
    $("input:image, input:button, input:submit").click(function(){
        $(this.form.elements).each(function(){
            if(this.type =='text' || this.type =='textarea' || this.type =='password' ){
                if(this.value == this.title && this.title != ''){
                    this.value='';
                }
            }
        });
    });
});