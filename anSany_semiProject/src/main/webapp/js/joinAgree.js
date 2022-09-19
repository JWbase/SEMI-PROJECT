$("#flexSwitchCheckDefault").on("click",function(){
    const chk = $(this).is(":checked");
    if(chk){
        $(".inp_check").prop('checked',true);
    } else{
        $(".inp_check").prop('checked',false);
    }
});

const btnView = $(".btn_view");
btnView.on("click",function(event){
    event.preventDefault();
    $(".modal-wrap").css("display","flex");
    const index = btnView.index(this);
    $(".allViewAgree").hide();
    $(".allViewAgree").eq(index).show();
});
$(".material-symbols-outlined").on("click",function(){
    $(".modal-wrap").css("display","none");
});

const agreeOneBtn = $(".chkBtn")
agreeOneBtn.on("click",function(){
    const index = agreeOneBtn.index(this);
    $(".inp_check").eq(index).prop('checked',true);
    $(".modal-wrap").css("display","none");
});

$(".btn-agree").on("click",function(){
    const status = $("input[name=essential]").is(":checked");
    if(status){
        location.href="/joinFrm.do";
    }else{
        alert("약관에 동의해주세요");
        
    }
});
