<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.phone.payment.*" %>
<%@ page import="web.tool.*" %>
<% String root = application.getContextPath(); %>
<% PaymentVO paymentVO = (PaymentVO)request.getAttribute("PaymentVO"); %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<!-- <link href="../css/style.css" rel="Stylesheet" type="text/css"> -->
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script> <!-- 이 부분은 jquery 선언 후 사용해야 된다. -->

<script type="text/javascript"> 
window.onload = function(){
 
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
          <TH class='th'>수량</TH>
          <TH class='th'>할인금액</TH>
          <TH class='th'>결재금액</TH>
      </TR>
      <tr>
        <td style="padding-left: 1%;">
          <img src="./images/festival01_m.jpg" style="float: left">&nbsp;
          <span style="line-height:80px; vertical-align: middle;">[ <%=paymentVO.getOrderno() %> ] <%=Tool.textLength(50, paymentVO.getItem()) %></span></td>
        <td><%=paymentVO.getPcnt() %></td>
        <td>0</td>
        <td><%=paymentVO.getPaymoney()%></td>
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
        <th>상품금액<br><br><%=paymentVO.getPaymoney() %></th>
        <th><img src="./images/ico_plus.gif"></th>
        <th>배송비<br><br>0</th>
        <th><img src="./images/ico_minus.gif"></th>
        <th>할인금액<br><br>0</th>
        <th><img src="./images/ico_total.gif"></th>
        <th>총 결제금액<br><br><%=paymentVO.getPaymoney() %></th>
    </table>
    <br><br>
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
         <label><input type="radio" name="delivery" id="delivery" checked="checked" value="new">새로운배송지</label>
         <label><input type="radio" name="delivery" id="delivery" value="default">회원정보와 동일한 배송지</label>
         <button type="button" style="margin-left: 45%;">나의 배송 주소록</button>
        </td>
       </tr>
        <tr>
          <td style="line-height: 35px;">받으시는 분</td>
        </tr>
    </table>
    <%-- <ul>
      <li>
        <label for="id">아이디</label>
        <%=memberVO.getId() %><span id="panel_id">( ID는 변경할 수 없습니다. )</span>
      </li>
      <li class="create_form">
        <label for="mname"><span class="inputb">* </span>사용자 이름</label>
        <input type="text" name="mname" id="mname" value="<%=memberVO.getMname() %>" required="required" size="25px" placeholder="이름 입력"  autocomplete="off">
      </li>
       <li class="create_form">
        <label for="email"><span class="inputb">* </span>사용자 이메일</label>
        <input type="email" name="email" id="email" value="<%=memberVO.getEmail() %>" required="required" size="25px" placeholder="이메일 입력"  autocomplete="off"> @
        <select name="email_domain" id="email_domain">
          <option value="">도메인 선택</option>
          <option value="gmail.com">gmail.net</option>
          <option value="naver.com">naver.com</option>
          <option value="daum.com">daum.net</option>
          <option value="nate.com">nate.com</option>
          <option value="none">직접 입력</option>          
        </select>
      </li>
      <li class="create_form">
        <label for="job">직업</label>
        <select name="job" id="job">
        <%if(memberVO.getJob().equals("무직")){ %>
          <option value="none">직업선택</option>
          <option value="무직" selected="selected">무직</option>
          <option value="학생">학생</option>
          <option value="직장인">직장인</option>
          <option value="etc">기타</option>
        <%} else if(memberVO.getJob().equals("학생")){ %>
        <option value="none">직업선택</option>
          <option value="무직">무직</option>
          <option value="학생" selected="selected">학생</option>
          <option value="직장인">직장인</option>
          <option value="etc">기타</option>
        <%} else if(memberVO.getJob().equals("직장인")){ %>
        <option value="none">직업선택</option>
          <option value="무직">무직</option>
          <option value="학생">학생</option>
          <option value="직장인" selected="selected">직장인</option>
          <option value="etc">기타</option>
         <%} else if(memberVO.getJob().equals("기타")){ %>
         <option value="none">직업선택</option>
          <option value="무직">무직</option>
          <option value="학생">학생</option>
          <option value="직장인">직장인</option>
          <option value="etc" selected="selected">기타</option>
          <%} else { %>
          <option value="none" selected="selected">직업선택</option>
          <option value="무직">무직</option>
          <option value="학생">학생</option>
          <option value="직장인">직장인</option>
          <option value="etc">기타</option>
          <%} %>
        </select>
      </li>
      <li class="create_form">
        <label for="birth">생년월일</label>
        <input type="date" name="birth" id="birth" size="10" value="<%=memberVO.getBirth()%>">
      </li>
      <li class="create_form">
        <label for="m_agency"><span class="inputb">* </span>휴대전화</label>
        <select name="m_agency" id="m_agency">
        <%if(memberVO.getM_agency().equals("SKT")){ %>
          <option value="none">통신사 선택</option>
          <option value="SKT" selected="selected">SKT</option>
          <option value="KT">KT</option>
          <option value="LG U+">LG U+</option>
          <option value="etc">기타</option>
          
          <%} else if(memberVO.getM_agency().equals("KT")){ %>
          <option value="none">통신사 선택</option>
          <option value="SKT">SKT</option>
          <option value="KT" selected="selected">KT</option>
          <option value="LG U+">LG U+</option>
          <option value="etc">기타</option>
          
          <%} else if(memberVO.getM_agency().equals("LG U+")){ %>
          <option value="none">통신사 선택</option>
          <option value="SKT">SKT</option>
          <option value="KT">KT</option>
          <option value="LG U+" selected="selected">LG U+</option>
          <option value="etc">기타</option>
          
          <%} else if(memberVO.getM_agency().equals("etc")){ %>
          <option value="none">통신사 선택</option>
          <option value="SKT">SKT</option>
          <option value="KT">KT</option>
          <option value="LG U+" selected="selected">LG U+</option>
          <option value="etc">기타</option>
          
          <%} else { %>
          <option value="none" selected="selected">통신사 선택</option>
          <option value="SKT">SKT</option>
          <option value="KT">KT</option>
          <option value="LG U+" >LG U+</option>
          <option value="etc">기타</option>
          <%} %>
        </select>
        <label for="m_phone"></label>
        <input type="text" name="m_phone" id="m_phone" value="<%=memberVO.getM_phone() %>" size="30" required="required" placeholder="하이픈(-) 제외한 숫자만 입력" autocomplete="off"> 
        <span id="phone_content" style="font-size: 10px; color:#999999; margin-left: 2%; display: inline;">하이픈(<span style="font-size: 1em;">-</span>) 을 제외한 숫자만 입력하시기 바랍니다 </span>
      </li>
      <li class="create_form">
        <label class='label' for="zipcode"><span class="inputb">* </span>우편번호</label>
        <input type="text" name="zipcode" id="zipcode" value="<%=memberVO.getZipcode() %>" placeholder="우편번호">
        <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
     </li>   
     <li class="create_form">
        <label class='label' for="address1"><span class="inputb">* </span>주소</label>
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
      </li>
      <li class="create_form">
      <label for="introduce">자기소개</label>
        <textarea row="5" col="100" name="introduce" id="introduce" style="resize:none; width:300px; height:80px;" placeholder="간단한 자기소개 입력"><%=memberVO.getIntroduce() %></textarea>
      </li>
      <li class="create_li">
        <label class="create_label"><span class="inputb">* </span>메일 서비스 수신 여부</label>
        <%
        if(memberVO.getMail_service().equals("Y")){
        %>
        <label><input type="radio" name="mail_service" checked="checked" value='Y'>Yes</label>
        <label><input type="radio" name="mail_service" value='N'>No</label>
        <%} else if(memberVO.getMail_service().equals("N")){ %>
        <label><input type="radio" name="mail_service" value='Y'>Yes</label>
        <label><input type="radio" name="mail_service" checked="checked" value='N'>No</label>
        <%} %>
        <span style="font-size: 10px; color:#999999; margin-left: 3%;">중요 공지사항은 설정에 관계없이 발송되며 해당 부분에 대한 수정은 내정보에서 수정가능합니다.</span>
      </li>
      <li class="create_li">
        <label class="create_label"><span class="inputb">* </span>정보 공개 여부</label>
        <%
        if(memberVO.getInfo_service().equals("Y")){
        %>
        <label><input type="radio" name="info_service" checked="checked" value='Y'>Yes</label>
        <label><input type="radio" name="info_service" value='N'>No</label><br>
        <%} else if(memberVO.getInfo_service().equals("N")){ %>
        <label><input type="radio" name="info_service" value='Y'>Yes</label>
        <label><input type="radio" name="info_service" checked="checked"  value='N'>No</label><br>
        <%} %>
      </li>
      <li class='right'>
        <button type="submit" style="margin-top: 3%; margin-right: 0.5%;">회원 수정</button>
        <button type="button" onclick="location.href='/index.jsp'" style="margin-top: 3%;">취소</button>
      </li> --%>
    </ul>
  </fieldset>
</FORM>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 