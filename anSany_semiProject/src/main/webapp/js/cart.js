//장바구니 체크박스 선언
const selectAll = $(".selectbox>input");
const selectOne = $(".cart-checkbox>input");

//장바구니 전체선택 시
selectAll.on("change",function(){
    if($(this).prop("checked")){
        selectOne.prop("checked",true);
    }else{
        selectOne.prop("checked",false);
    }
    calCheckedCount();
    calCheckedPrice();
});

//장바구니 개별선택 시
selectOne.on("change",function(){
    if($(this).prop("checked")){
        if(selectOne.prop("checked")){
            selectAll.prop("checked",true);
        }
    }else{
        selectAll.prop("checked",false);
    }
    calCheckedCount();
    calCheckedPrice();
});

//가격, 수량, 가격*수량, 총수량, 총가격 선언
const cartPrice = $(".cart-price-value");
let cartCountVal = $(".cart-count-value");
let cartPriceSum = $(".cart-pricesum-value");
let totalCount = $("#total-count");
let totalPrice = $("#total-price");

//장바구니 수량 증&감 버튼 선언
const cartCountMinus = $(".cart-count-minus");
const cartCountPlus = $(".cart-count-plus");

//수량 감소(-)버튼 클릭 시 1개 감소
cartCountMinus.on("click",function(){
    let cartCount = $(this).next();
    if(cartCount.val()==1){
        //수량이 1개면 감소X
        return;
    }
    cartCount.val(Number(cartCount.val())-1);
    //가격과 합계 불러오기
    let cartPrice = $(this).parent().parent().prev().find("input");
    let cartPriceSum = $(this).parent().parent().next().find("input");
    //가격에서 콤마 제거 후 합계(가격*수량)계산
    let numPrice = removeComma(cartPrice.val());
    let numPriceSum = numPrice*cartCount.val();
    console.log(typeof numPriceSum, numPriceSum);
    cartPriceSum.val(numPriceSum);
    //변경한 수량과 합계를 총수량, 결제예정금액에 반영
    calCheckedCount();
    calCheckedPrice();
    //계산한 합계에 콤마 추가
    numPriceSum = addComma(numPriceSum);
    cartPriceSum.val(numPriceSum);
});

//수량 증가(+)버튼 클릭 시 1개 증가
cartCountPlus.on("click",function(){
    let cartCount = $(this).prev();
    if(cartCount.val()>=50){
        //수량이 50개면 증가X
        alert("대량구매는 고객센터로 문의해주세요.(1588-4444)");
        return;
    }
    cartCount.val(Number(cartCount.val())+1);
    //가격과 합계 불러오기
    let cartPrice = $(this).parent().parent().prev().find("input");
    let cartPriceSum = $(this).parent().parent().next().find("input");
    //가격에서 콤마 제거 후 합계(가격*수량)계산
    let numPrice = removeComma(cartPrice.val());
    let numPriceSum = numPrice*cartCount.val();
    console.log(typeof numPriceSum, numPriceSum);
    cartPriceSum.val(numPriceSum);
    //변경한 수량과 합계를 총수량, 결제예정금액에 반영
    calCheckedCount();
    calCheckedPrice();
    //계산한 합계에 콤마 추가
    console.log(typeof numPriceSum, numPriceSum);
    numPriceSum = addComma(numPriceSum);
    console.log(typeof numPriceSum, numPriceSum);
    cartPriceSum.val(numPriceSum);
});

//수량 입력 시 입력값만큼 변경
cartCountVal.on("change",function(){
    if($(this).val()!=Number($(this).val())){
        //입력값이 숫자가 아니면 1개로 초기화
        $(this).val(1);
    }else if($(this).val()<1){
        //입력값이 1개 미만이면 1개로 초기화
        $(this).val(1);
    }else if($(this).val()>50){
        //입력값이 50개 초과 시 1개로 초기화
        alert("대량구매는 고객센터로 문의해주세요.(1588-4444)");
        $(this).val(1);
    }
    //가격과 합계 불러오기
    let cartPrice = $(this).parent().parent().prev().find("input");
    let cartPriceSum = $(this).parent().parent().next().find("input");
    //가격에서 콤마 제거 후 합계(가격*수량)계산
    let numPrice = removeComma(cartPrice.val());
    let numPriceSum = numPrice*$(this).val();
    console.log(typeof numPriceSum, numPriceSum);
    cartPriceSum.val(numPriceSum);
    //변경한 수량과 합계를 총수량, 결제예정금액에 반영
    calCheckedCount();
    calCheckedPrice();
    //계산한 합계에 콤마 추가
    numPriceSum = addComma(numPriceSum);
    cartPriceSum.val(numPriceSum);
});

//선택목록 수량 계산 함수
function calCheckedCount(){
    const checkedOne = $("input:checkbox[name=select-one]:checked");
    checkedCount = checkedOne.parent().siblings(".cart-count").children().find("input");
    let calCount = 0;
    checkedCount.each(function(index, item){
        calCount = calCount + Number($(item).val());
    });
    totalCount.val(calCount);
}

//선택목록 가격 계산 함수
function calCheckedPrice(){
    const checkedOne = $("input:checkbox[name=select-one]:checked");
    checkedPrice = checkedOne.parent().siblings(".cart-pricesum").find("input");
    let calPrice = 0;
    //합계에서 콤마 제거 후 숫자로 형변환하여 계산
    checkedPrice.each(function(index, item){
        let numPriceSum = removeComma($(item).val());
        calPrice = calPrice + Number(numPriceSum);
    });
    totalPrice.val(calPrice);
    //계산한 총금액에 콤마 추가
    let commaNum = addComma(totalPrice.val());
    totalPrice.val(commaNum);
}

//숫자 세자리마다 콤마(,)찍는 함수
function addComma(value){
    value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
    return value;
}

//숫자 콤마(,)제거하는 함수
function removeComma(value){
    value = value.replace(/[^\d]+/g, "");
    return value;
}

//장바구니 목록별 삭제 버튼(X) 선언
const cartRemoveBtn = $(".cart-removebtn");
//목록별 삭제 버튼 누르면 해당 목록만 삭제
cartRemoveBtn.on("click",function(){
    $(this).parents("tr").remove();
    calCheckedCount();
    calCheckedPrice();
    viewCartList();
});
const selectRemoveBtn = $(".select-removebtn");

//선택삭제 버튼 누르면 선택한 목록 모두 삭제
selectRemoveBtn.on("click",function(){
    $(".cart-checkbox>input:checked").each(function (index, item) {
        $(item).parents("tr").remove();
        calCheckedCount();
        calCheckedPrice();
        viewCartList();
    });
});

//장바구니 빈 화면<div>, 테이블<div>, 선택버튼<div> 선언
const cartEmpty = $(".cart-empty");
const cartTable = $(".cart-table");
const cartSelect = $(".cart-select");

//장바구니 목록 유무에 따른 화면표시 함수
function viewCartList(){
    const cartTr = $(".cart-table tbody>tr");
    console.log(cartTr.length);
    //장바구니 목록 있으면 cartTable 및 선택버튼 표시, 없으면 cartEmpty표시
    if(cartTr.length<1){
        cartTable.hide();
        cartSelect.hide();
        cartEmpty.fadeIn();
    }else{
        cartEmpty.hide();
        cartTable.show();
        cartSelect.show();
    }
}

//초기화면 설정
viewCartList();
window.onload = function(){
    //장바구니 목록 전체선택 후 총수량과 총금액 계산
    selectAll.prop("checked",true);
    selectOne.prop("checked",true);
    calCheckedCount();
    calCheckedPrice();
    //불러온 제품가격 및 결제예상금액에 콤마 추가
    cartPrice.each(function(index, item){
        let commaNum = addComma($(this).val());
        $(this).val(commaNum);
    });
    cartPriceSum.each(function(index, item){
        let commaNum = addComma($(this).val());
        $(this).val(commaNum);
    });
}