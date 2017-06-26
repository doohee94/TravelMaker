 $(function(){

/** 여행지 지역 메뉴 탭의 하위 메뉴 펼치기/접기 */
        $(".Gangwondo").click(function(){
             // 현재 클릭한 태그가 a 이기 때문에
            // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
//             $(".Gangwondodiv").show();
             
             var con = document.getElementById("Gangwondodiv");
             if(con.style.display=="none"){
                con.style.display = "block";
             }else{
                con.style.display = "none";
             }

//       $(".Gangwondodiv").css("display","block");
         });
       
        $(".Gyeonggido").click(function(){
           var con = document.getElementById("Gyeonggidodiv");
            if(con.style.display=="none"){
               con.style.display = "block";
            }else{
               con.style.display = "none";
            }
//              $(".Gyeonggidodiv").slideToggle("fast");
        });
        
        $(".Gyeongsangnamdo").click(function(){
           var con = document.getElementById("Gyeongsangnamdodiv");
            if(con.style.display=="none"){
               con.style.display = "block";
            }else{
               con.style.display = "none";
            }
//            $(".Gyeongsangnamdodiv").slideToggle("fast");
         });
        
        $(".Gyeongsangbukdo").click(function(){
           var con = document.getElementById("Gyeongsangbukdodiv");
            if(con.style.display=="none"){
               con.style.display = "block";
            }else{
               con.style.display = "none";
            }
//             $(".Gyeongsangbukdodiv").slideToggle("fast");
         });

        $(".Jeollanamdo").click(function(){
           var con = document.getElementById("Jeollanamdodiv");
            if(con.style.display=="none"){
               con.style.display = "block";
            }else{
               con.style.display = "none";
            }
        });
        
        $(".Jeollabukdo").click(function(){
           var con = document.getElementById("Jeollabukdodiv");
            if(con.style.display=="none"){
               con.style.display = "block";
            }else{
               con.style.display = "none";
            }
        });
        
        $(".Chungcheongnamdo").click(function(){
           var con = document.getElementById("Chungcheongnamdodiv");
            if(con.style.display=="none"){
               con.style.display = "block";
            }else{
               con.style.display = "none";
            }
        });
        
        $(".Chungcheongbukdo").click(function(){
           var con = document.getElementById("Chungcheongbukdodiv");
            if(con.style.display=="none"){
               con.style.display = "block";
            }else{
               con.style.display = "none";
            }
        });
        
 });