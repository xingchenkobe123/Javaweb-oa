
            //ul的展开与关闭
            function open_ul(p,ul){

                var open=true;

                p.click(function() {



                    if(open){
                         ul.css("display","none");
                         open=false;
                    }else{
                        ul.css("display","block");
                        open=true;
                    }


                });
            }



            for(var i=0;i<7;i++){
                  open_ul($(document.getElementsByTagName("p")[i]),$(document.getElementsByClassName("show_hidden")[i]));
            }


            //打开所有
            $(".all").find("span").first().click(function(event) {

                $('.show_hidden').css("display","block");

            });

             //关闭所有
            $(".all").find("span").last().click(function(event) {

               $('.show_hidden').css("display","none");
            });
          
