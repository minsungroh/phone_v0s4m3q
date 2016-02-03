<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.phone.payment.*" %>
<%@ page import="com.phone.member.*" %>
<%@ page import="web.tool.*" %>
<% String root = application.getContextPath(); %>
<% PaymentVO paymentVO = (PaymentVO)request.getAttribute("PaymentVO"); %>
<% MemberVO memberVO = (MemberVO)request.getAttribute("MemberVO"); %>
<%DecimalFormat df = new DecimalFormat("#,###,###"); %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script> <!-- 이 부분은 jquery 선언 후 사용해야 된다. -->

<script type="text/javascript"> 
window.onload = function(){
	  $("#rname").attr("value", "");
	  $("#zipcode").attr("value", "");
	  $("#address1").attr("value", "");
	  $("#address2").attr("value", "");
	  evt("card1", "click", card_p);
	  evt("card2", "click", etrans_p);
	  evt("card3", "click", btrans_p);
  }
  
function delivery1(){
	$("#rname").attr("value", "");
	$("#zipcode").attr("value", "");
	$("#address1").attr("value", "");
	$("#address2").attr("value", "");
}

function delivery2(rname, zipcode, address1, address2){
	 $("#rname").attr("value", rname);
	  $("#zipcode").attr("value", zipcode);
	  $("#address1").attr("value", address1);
	  $("#address2").attr("value", address2);
}

/* 전화번호 입력 정규화, 자동 - 입력(예 01040793588 --> 010-4079-3588)*/
function phone_format() {
  var num = $("#m_phone").val();
  
  var phone_num = num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
  
  $("#m_phone").val(phone_num);
  
  $("#mobile1").val(num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1"));
  $("#mobile2").val(num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$2"));
  $("#mobile3").val(num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$3"));
}

function card_p(){
	$("#card_select").css("display", "block");
	$("#e_trans_select").css("display", "none");
	$("#r_trans_select").css("display", "none");
}

function etrans_p(){
	 $("#card_select").css("display", "none");
	  $("#e_trans_select").css("display", "block");
	  $("#r_trans_select").css("display", "none");
}

function btrans_p(){
	  $("#card_select").css("display", "none");
	  $("#e_trans_select").css("display", "none");
	  $("#r_trans_select").css("display", "block");
}
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="../menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='title' style="font-size: 2em; text-align: center; font-weight: bold; color: #FF0000">주문서</DIV>
 
<DIV style="width:70%; margin: 0 auto;">
<FORM name='frm' method='POST' action='./update.do'>
  <input type="hidden" name="payno" id="payno" value="<%=paymentVO.getPayno()%>">
  <span style="font-weight: bold;">1. 주문상품 확인</span>
  <fieldset style="border: none;">
    <table border="1" style="width:100%; border-collapse: collapse; border-bottom: 2px solid black">
      <colgroup>
        <col style="width:70%; border-left: none;"/>
        <col style="width:10%;"/> 
        <col style="width:10%;"/>
        <col style="width:10%; border-right: none;"/>
      </colgroup>
        <TR style="background-color: #CCCCCC;">
          <TH class='th'>상품정보</TH>
          <TH class='th'>수량(EA)</TH>
          <TH class='th'>할인금액</TH>
          <TH class='th'>결재금액</TH>
      </TR>
      <tr>
        <td style="padding-left: 1%;">
          <a href="#"><img src="./images/festival01_m.jpg" style="float: left"></a>&nbsp;
          <span style="line-height:80px; vertical-align: middle;"><a href="#">[ <%=paymentVO.getContentno() %> ] <%=Tool.textLength(50, paymentVO.getItem()) %></a></span></td>
        <td style="text-align: center;"><%=paymentVO.getPcnt() %></td>
        <td style="text-align: center;">0</td>
        <td style="text-align: center;"><%=df.format(paymentVO.getPaymoney()) %></td>
       </tr>
    </table>
    <table style="width:100%; border-collapse: collapse;">
      <colgroup>
        <col style="width:20%" />
        <col style="width:3%" />
        <col style="width:20%" />
        <col style="width:3%" />
        <col style="width:20%" />
        <col style="width:3%" />
        <col style="width:20%" />
      </colgroup>
      <tr>
        <th>상품금액<br><br><%=df.format(paymentVO.getPaymoney()) %></th>
        <th><img src="./images/ico_plus.gif"></th>
        <th>배송비<br><br>0</th>
        <th><img src="./images/ico_minus.gif"></th>
        <th>할인금액<br><br>0</th>
        <th><img src="./images/ico_total.gif"></th>
        <th>총 결제금액<br><br><%=df.format(paymentVO.getPaymoney()) %></th>
    </table>
    <br><br>
    
    <!-- 2. 배송지 정보 -->
    <table border="1" style="width:100%; border-collapse: collapse;">
      <colgroup>
        <col style="width:20%;" />
        <col style="width:80%;" />
      </colgroup>
      <tr>
        <th colspan="2">2. 배송지 정보 입력&nbsp;<span style="font-size: 13px; color: #ff6600;">( * 필수입력  )</span></th>
      </tr>
      <tr>
        <td style="line-height: 35px;">배송지 선택</td>
        <td>
         <label><input type="radio" name="delivery" id="delivery" checked="checked" value="new" 
         onclick="delivery1()">새로운배송지</label>
         <label><input type="radio" name="delivery" id="delivery" value="default"
         onclick="delivery2('<%=memberVO.getMname()%>', '<%=memberVO.getZipcode() %>', '<%=memberVO.getAddress1() %>', '<%=memberVO.getAddress2() %>')">회원정보와 동일한 배송지</label>
         <button type="button" style="margin-left: 35%;">나의 배송 주소록</button>
        </td>
       </tr>
        <tr>
          <td style="line-height: 35px;">받으시는 분</td>
          <td><input type="text" name="rname" id="rname" size="15px" value="<%=memberVO.getMname()%>"></td>
        </tr>
        <tr>
          <td style="line-height: 35px;">배송지</td>
          <td><ul><li class="create_form">
        <label class='label' for="zipcode">우편번호</label>
        <input type="text" name="zipcode" id="zipcode" value="<%=memberVO.getZipcode() %>" placeholder="우편번호">
        <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
     </li>   
     <li class="create_form">
        <label class='label' for="address1">주소</label>
        <input type="text" name="address1" id="address1" value="<%=memberVO.getAddress1() %>" size="50" placeholder="주소">
     </li>
     <li class="create_form">
        <label class='label' for="address2">상세 주소</label>
        <input type="text" name="address2" id="address2" value="<%=memberVO.getAddress2() %>" size="30" placeholder="상세 주소" autocomplete="off">   
        <!-- ***** DAUM 우편번호 API 시작 *****  -->
          
          <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 90px;position:relative">
          <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
          </div>
          
          <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
          <script>
              // 우편번호 찾기 찾기 화면을 넣을 element
              var element_wrap = document.getElementById('wrap');
          
              function foldDaumPostcode() {
                  // iframe을 넣은 element를 안보이게 한다.
                  element_wrap.style.display = 'none';
              }
          
              function DaumPostcode() {
                  // 현재 scroll 위치를 저장해놓는다.
                  var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
                  new daum.Postcode({
                      oncomplete: function(data) {
                          // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
          
                          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                          var fullAddr = data.address; // 최종 주소 변수
                          var extraAddr = ''; // 조합형 주소 변수
          
                          // 기본 주소가 도로명 타입일때 조합한다.
                          if(data.addressType === 'R'){
                              //법정동명이 있을 경우 추가한다.
                              if(data.bname !== ''){
                                  extraAddr += data.bname;
                              }
                              // 건물명이 있을 경우 추가한다.
                              if(data.buildingName !== ''){
                                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                              }
                              // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                              fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                          }
          
                          // 우편번호와 주소 정보를 해당 필드에 넣는다.
                          document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                          document.getElementById('address1').value = fullAddr;
          
                          // iframe을 넣은 element를 안보이게 한다.
                          // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                          element_wrap.style.display = 'none';
          
                          // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                          document.body.scrollTop = currentScroll;
                          $("#address2").focus();
                      },
                      // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                      onresize : function(size) {
                          element_wrap.style.height = size.height+'px';
                      },
                      width : '100%',
                      height : '100%'
                  }).embed(element_wrap);
          
                  // iframe을 넣은 element를 보이게 한다.
                  element_wrap.style.display = 'block';
              }
          </script>
        <!-- ***** DAUM 우편번호 API 종료 *****  -->
      </li></ul>
      </td>
      <tr>
      <td style="line-height: 35px;">휴대번호</td>
      <td><ul>
      <li class="create_form">
        <label for="m_agency">휴대전화</label>
        <select name="m_agency" id="m_agency">
          <option value="none">통신사 선택</option>
          <option value="SKT">SKT</option>
          <option value="KT">KT</option>
          <option value="LG U+">LG U+</option>
          <option value="etc">기타</option>
        </select>
        <label for="m_phone"></label>
        <input type="text" name="m_phone" id="m_phone" value="" size="30" required="required" placeholder="하이픈(-) 제외한 숫자만 입력" autocomplete="off"> 
        <span id="phone_content" style="font-size: 10px; color:#999999; margin-left: 2%; display: inline;">하이픈(<span style="font-size: 1em;">-</span>) 을 제외한 숫자만 입력하시기 바랍니다 </span>
      </li></ul>
      </td>
      <tr>
        <td style="line-height: 35px;">배송매시지</td>
        <td><span>상품명 : <%=Tool.textLength(50, paymentVO.getItem()) %></span><br>
        <input type="text" name="delivery_meno" id="delivery_memo" size="50px" placeholder="택배 기사님께 전달할 배송 메시지를 입력해 주세요."><Br>
        <span>· 부재시 연락가능한 전화번호 또는 상품수령이 가능한 장소를 남겨주세요.</span>
    </table>
    <br>
    <!-- 3. 결제정보 -->
     <table style="width:100%; border-collapse: collapse;" border="1">
        <colgroup>
          <col style="width:25%;"/>
          <col style="width:75%;"/>
        </colgroup>
        <tr>
          <th colspan="2">3. 결제정보 입력</th>
        </tr>
        <tr>
          <td style="line-height: 35px;">신용/체크 카드</td>
          <td><label><input type="radio" name="card" id="card1" value="card" checked="checked">신용/체크카드</label></td>
        </tr>
        <tr>
          <td style="line-height: 35px;">온라인이체</td>
          <td><label><input type="radio" name="card" id="card2" value="e_transfer">무통장입금</label>
              <label><input type="radio" name="card" id="card3" value="r_transfer">실시간계좌이체</label>
          <div id="card_select" style="border: 2px solid black; display: block">
                <label>카드 선택</label>
                <select id="s_card">
                  <option value="bc" selected="selected">비씨카드</option>
                  <option value="kbc">KB국민카드</option>
                  <option value="uric">우리카드</option>
                  <option value="sinhanc">신한카드</option>
                  <option value="hyundaec">현대카드</option>
                  <option value="samsungc">삼성카드</option>
                </select><br>
                <label>할부선택</label>
                  <select id="discount" disabled="disabled">
                    <option value="none">할부선택</option>
                    <option value="3">3개월</option>
                    <option value="4">4개월</option>
                    <option value="5">5개월</option>
                  </select><br>
                  <p>할부는 5개월 이상부터 가능합니다</p>
              </div>
           <div id="e_trans_select" style="display: none">
                <label>입금은행</label>
                <select id="e_tr">
                    <option value="none" selected="selected">은행선택</option>
                    <option value="kbb">국민은행</option>
                    <option value="urib">우리은행</option>
                    <option value="sinhanb">신한은행</option>
                    <option value="hanab">하나은행</option>
                    <option value="postb">우체국</option>
                </select>
              </div>
              <div id="r_trans_select" style="display: none">
                <p>&lt;결재하기&gt;버튼을 누르시면 가상 계좌번호가 자동적으로 생성됩니다. </p>
              </div>
          </td>
     </table>
     <br>
     <!-- 결제 총 금액 -->
     <table border="1" style="width: 100%; border-collapse: collapse;">
     <tr>
       <th>4. 결제 총 금액</th>
      </tr>
      <tr>
        <td><div style="width:30%; margin: 0 auto; text-align: center; background-color: #AAAA00"><%=paymentVO.getPaymoney() %> 원</div></td>
      </tr>
     </table>
     <div style="text-align: center;">
     <button type="submit">결제하기</button>
     <button type="reset">취소</button>
     </div>
  </fieldset>
</FORM>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 