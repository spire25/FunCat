$(function(){
    // 비밀번호 조건
    $('#member_pw').on("keyup", function(){
        var pwd = document.getElementById('member_pw').value;
        var special = ["!", ".", "@", "#", "$", "%", "&"];
        var length_check = 0;
        var special_check = 0;
 
        if(pwd.length < 6){
            //alert('6글자 이상, 16글자 이하만 이용 가능합니다.');
            document.getElementById('pwdcheck').innerHTML='* 6글자 이상, 16글자 이하만 이용 가능합니다.';
        } else if(pwd.length>16){
            //alert('6글자 이상, 16글자 이하만 이용 가능합니다.');
            document.getElementById('pwdcheck').innerHTML='* 6글자 이상, 16글자 이하만 이용 가능합니다.';
        } else if(pwd.length >= 6 && pwd.length<=16){
            for(var i=0;i<special.length;i++){
                if(pwd.indexOf(special[i]) != -1){
                    document.getElementById('pwdcheck').innerHTML='<span class="blue">사용가능한 비밀번호입니다.</sapn>';
                    break;
                } else {
                    document.getElementById('pwdcheck').innerHTML='* !, @, ., #, $, %, & 특수기호를 포함해주세요.';
                }
            }
        }
    });

    // 비밀번호 같은지 확인
    $('#pwd2').on("keyup", function(){
        var pwd = document.getElementById('member_pw').value;
        var pwd2 = document.getElementById('pwd2').value;

        if(pwd != pwd2 ){
            document.getElementById('pwdvalidate').innerHTML='* 비밀번호가 일치하지 않습니다.';
        } else{
            document.getElementById('pwdvalidate').innerHTML='<span class="blue">비밀번호가 일치합니다.</span>';
        }
    });

    // 핸드폰 번호 패턴
    $('#member_phone').on("keyup", function(){
        var string = document.getElementById('member_phone').value;
        var temp = string.replace(/^(\d{3})(\d{4})(\d{4})$/, `$1-$2-$3`);
        document.getElementById('member_phone').value = temp;
    });
});