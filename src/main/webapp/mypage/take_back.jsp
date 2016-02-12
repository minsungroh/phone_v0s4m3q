<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.phone.mypage.*" %>
<%@ page import="com.phone.payment.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.text.DecimalFormat"%>
<%MypageVO mypageVO = (MypageVO)request.getAttribute("MypageVO");%>
<%PaymentVO paymentVO = (PaymentVO)request.getAttribute("PaymentVO");%>
<%DecimalFormat df = new DecimalFormat("#,###,### 원"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">
  $(function() {
    // 사이트 메뉴 액션
    /* $("ul.nav li ul").hide();
    $("ul.nav li a").click(function(event) {
      $(this).siblings("ul").toggle("normal", "swing");
    }); */
  });
  
  function reason(paymoney, money, tot){
	  $("#default").html(paymoney);
	  $("#take").html(tot);
	  $("#item_won").html(paymoney);
	  $("#add_trace").html(money);
	  $("#resive").html(money);
	  $("#total").html(tot);
  }
</script>



</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">

  <!-- ----------------------------------------- -->
          <div style="border:none; width:95%; margin: 0 auto" id="order_menu">
            <div style="border: none; margin: 5px; ">
              <span style="font-weight: bold;">반품신청&nbsp;<span style="border-left: 1px solid #898989; font-size: 13px; color: #BBBBBB;">&nbsp;반품하실 상품의 사유를 선택하세요.</span></span>
            </div>
           <div id="order" style="margin: 2%;">
            <%
            ArrayList take_back = (ArrayList)request.getAttribute("take_back");
  
            for (int i = 0; i < take_back.size(); i++) {
              MypageVO vo = (MypageVO)take_back.get(i);
              String delivery = "";
              if(vo.getOrderstate().equals("delivery_wait")){
                delivery = "배송준비중";
              } else if(vo.getOrderstate().equals("pay_wait")){
                delivery = "결제 대기중";
              } else if(vo.getOrderstate().equals("pay_ok")){
                delivery = "결재 완료";
              } else if(vo.getOrderstate().equals("delivery")){
                delivery = "배송중";
              } else if(vo.getOrderstate().equals("complate")){
                delivery = "배송완료";
              } else if(vo.getOrderstate().equals("ok_wait")){
                delivery = "구매 결정 대기";
              }
             %>
             <table border="1" style="width: 100%; border-collapse: collapse; text-align: center;">
                <colgroup>
                  <col style="width:40%"/>
                  <col style="width:15%;"/>
                  <col style="width:15%;"/>
                  <col style="width:15%;"/>
                  <col style="width:15%;"/>
                </colgroup>
                <tr>
                  <th>상품명</th>
                  <th>상품금액</th>
                  <th>수량</th>
                  <th>배송비</th>
                  <th>주문상태</th>
                </tr>
                <tr>
                  <td style="text-align: left;"><a href="" target="_blank"><img src="./images/festival01_m.jpg" style="float: left; margin-right: 2%;"></img></a>
                      <br><span><%=vo.getItem() %></span></td>
                  <td><%=vo.getPaymoney() %></td>
                  <td><%=vo.getPcnt() %></td>
                  <td>0원</td>
                  <td><%=delivery %></td>
                </tr>
                <tr>
                  <td colspan="5" style="height:30px;">
                    <%String money = df.format(5000); 
                    String tot = df.format(vo.getPaymoney() - 5000);
                    %>
                    <select name="reason" id="reason" onchange="reason('<%=df.format(vo.getPaymoney())%>', '<%=money %>', '<%=tot%>')">
                      <option value="1" selected="selected">상품에 이상 없으나, 구매 의사 없어짐</option>
                      <option value="2">색상을 잘 못 선택함</option>
                      <option value="3">상품이 상품상세 정보와 틀림</option>
                      <option value="4">배송된 상품의 파손/불량 불량</option>
                      <option value="5">상품이 배송되지 않고 있음</option>
                      <option value="6">다른 상품이 잘못 배송됨</option>
                      <option value="7">기타</option>
                    </select>
                    <input type="text" name="reason_content" id="reason_content" size="60px" placeholder="상세 사유를 입력해 주세요.">
             </table>
             <br>
             <table border="1" style="width: 100%; border-collapse: collapse;">
                 <colgroup>
                  <col style="width: 29%"/>
                  <col style="width: 5%;"/>
                  <col style="width: 28%"/>
                  <col style="width: 5%;"/>
                  <col style="width: 28%"/>
                  <col style="width: 5%;"/>
                   
                 </colgroup>
                 <tr>
                  <th colspan="6">환불예상금액 확인&nbsp;<span style="border-left: 1px solid #898989; font-size: 13px; color: #BBBBBB;">&nbsp;환불예상금액은 아래 예상금액과 다를 수 있습니다.</span></th>
                 </tr>
                 <tr>
                  <td>원 결재 금액</td>
                  <td><span id="default"><%=df.format(0) %></span></td>
                  <td>차감 금액 : </td>
                  <td><span id="minus"><%=df.format(0) %></span></td>
                  <td style="color: red; font-weight: bold;">환불 예상 금액</td>
                  <td><span id="take" style="color: red; font-weight: bold;"><%=df.format(0) %></span></td>
                </tr>
                <ul>
                <tr>
                  <td><li>상품금액</li></td>
                  <td><span id="item_won"><%=df.format(0) %></span></td>
                  <td><li>추가배송비</li></td>
                  <td><span id="add_trace"><%=df.format(0) %></span></td>
                  <td></td>
                  <td></tr>
                </tr>
                <tr>  
                  <td><li>할인금액</li></td>
                  <td><span id="discount"><%=df.format(0) %></span></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
              </ul>
             </table>
             <br>
             <table border="1" style="width: 100%; border-collapse: collapse;">
                <tr>
                  <th>반송배송비<span style="border-left: 1px solid #898989; font-size: 13px; color: #BBBBBB;">&nbsp;반송배송비를 결제하셔야만 반품신청이 가능합니다.</span></th>
                 </tr>
                 <tr>
                 <ul>
                  <td><li><span style="font-weight: bold; color: red">구매자 책임사유</span>에 의한 반품이므로<span style="font-weight: bold; color: red"> 반품배송비</span>
                  <span style="font-weight: bold; color: red" id="resive"><%=df.format(0) %></span> 을 구매자가 부담합니다.</li>
                  </td>
                  </ul>
                </tr>
                <tr>
                <td><input type="radio" name="resive_money" id="resive_money1" value="box">박스에 동봉(반품 배송시 상품과 함께 반품배송비를 동봉하겠습니다.)</td>
                 </tr>
                 <tr>
                <td><input type="radio" name="resive_money" id="resive_money1" value="box">판매자에게 직접송금(판매자에게 연락 후 반품배송비를 입금처리하겠습니다.)</td>
                 </tr>
             </table>
            <%}%>
              <br><br>

     <div style="text-align: center;">
        <button type="button" onclick="window.close();">닫기</button>
        <button type="submit">반품신청</button>
      </div>
  </DIV>

  <!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html>
