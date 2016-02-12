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
  
  function trace(waybil, traceno) {
      var win_file = window.open("../trace/read.do?waybil=" + waybil +"&traceno=" + traceno, '배송조회', 'width=800px, height=550px',
          'scrollbars=no');

      var x = (screen.width - 800) / 2;
      var y = (screen.height - 550) / 2;

      win_file.moveTo(x, y);
    }
  
  
  function order(){
    $("#order").css("display", "block");
    $("#order_menu").css("display", "block");
  }
</script>

<style>
a {
  text-decoration: none;
  font-size: 12px;
  color: #333;
}

ul, li {
  list-style: none;
  padding: 0;
  margin: 0;
}

ul.nav li ul {
  padding-left: 10px;
}

* {
font-size: 15px;
}
</style>


</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">

  <!-- ----------------------------------------- -->

          <div style="border:none; width:95%; margin: 0 auto" id="order_menu">
            <div style="border: none; margin: 5px; ">
              <span style="font-weight: bold;">주문목록/배송조회</span>
            </div>
           <div id="order" style="margin: 2%;">
            <%
            ArrayList detail_list = (ArrayList)request.getAttribute("detail_list");
  
            for (int i = 0; i < detail_list.size(); i++) {
              MypageVO vo = (MypageVO)detail_list.get(i);
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

                <div style="border: none; margin-bottom: 1%;">
                   <div>
                      <span>주문일 : <%=vo.getPayday().substring(0, 11) %></span>
                      | <span>총 주문 금액 : <%=df.format(vo.getPaymoney())%> 원</span>
                   </div>
                   <br>
                   <table style="width:80%; margin: 0 auto;">
                    <colgroup>
                      <col style="width:70%;">
                      <col style="width:30%;">
                    </colgroup>
                    <tr>
                    <td>
                      <a href="" target="_blank"><img src="./images/festival01_m.jpg" style="float: left; margin-right: 2%;"></img></a>
                      <span><%=vo.getItem() %></span><br>
                      <span><%=df.format(vo.getPaymoney()) %> / <%=vo.getPcnt() %> 개 </span>
                   </td>
                   <td style="text-align: center; border-left: 1px solid #898989;">
                      <span><%=delivery %></span><br>
                      <button type="button" onclick="trace(<%=vo.getWaybil()%>, <%=vo.getTraceno()%>)">배송조회</button><br>
                      <button type="button" onclick="#">반품신청</button><br>
                      <button type="button" onclick="#">교환문의</button>
                   </td>
                </table>
          </div>
          <br>
          <table border="1" style="width:100%; margin: 0 auto; border-collapse: collapse;">
            <colgroup>
              <col style="width:20%;"/>
              <col style="width:80%;"/>
            </colgroup>
            <tr>
              <th colspan="2" style="border-bottom: 2px solid black; text-align: left;">받는사람 정보</th>
            </tr>
            <tr>
              <td>수령인</td>
              <td><%=vo.getResive_name() %></td>
            </tr>
            <tr>
              <td>연락처</td>
              <td><%=vo.getResive_phone() %></td>
            </tr>
            <tr>
              <td>주소</td>
              <td>(<%=vo.getResive_post() %>)<%=vo.getResive_addr1() %> <%=vo.getResive_addr2() %></td>
           </tr>
          </table>
          <br>
          <table border="1" style="width:100%; margin: 0 auto; border-collapse: collapse;">
            <colgroup>
              <col style="width:55%;"/>
              <col style="width:30%;"/>
              <col style="width:15%"/>
            </colgroup>
            <tr>
              <th colspan="3" style="text-align: left; border-bottom: 2px solid black">결제정보</th>
            </tr>
            <tr>
              <td>결제수단</td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <%
              String pay = "";
              String input = "";
              if(vo.getPaymeans().equals("card")){
                pay = "신용카드";
                if(vo.getCard_input().equals("bc")){
                  input = "비씨카드";
                } else if(vo.getCard_input().equals("kbc")){
                  input = "국민카드";
                } else if(vo.getCard_input().equals("uric")){
                  input = "우리카드";
                } else if(vo.getCard_input().equals("hyundaec")){
                  input = "현대카드";
                } else if(vo.getCard_input().equals("samsungc")){
                  input = "삼성카드";
                }
              } else if(vo.getPaymeans().equals("deposit")){
                pay = "무통장입금";
                if(vo.getDeposit_input().equals("kbb")){
                  input = "국민은행";
                } else if(vo.getDeposit_input().equals("urib")){
                  input = "우리은행";
                } else if(vo.getDeposit_input().equals("sinhanb")){
                  input = "신한은행";
                } else if(vo.getDeposit_input().equals("hanab")){
                  input = "하나은행";
                } else if(vo.getDeposit_input().equals("postb")){
                  input = "우체국";
                }
              } else if(vo.getPaymeans().equals("phone")){
                pay = "휴대폰결제";
                if(vo.getCard_input().equals("skt")){
                  input = "SKT";
                } else if (vo.getCard_input().equals("lgu")){
                  input = "LG U+";
                } else if (vo.getCard_input().equals("kt")){
                  input = "KT";
                } else if (vo.getCard_input().equals("kct")){
                  input = "알뜰폰-KCT";
                } else if (vo.getCard_input().equals("hm")){
                  input = "헬로모바일";
                }
              }
              %>
              <td>[<%=pay %>]</td>
              <td>총 상품 가격</td>
              <td><%=df.format(vo.getPaymoney()) %></td>
            </tr>
            <tr>
            <%
            String discount = "";
            if(vo.getDiscount() == 1 || vo.getDiscount() == 0){
              discount = "일시불";
            } else if(vo.getDiscount() == 3){
              discount = "3개월";
            } else if(vo.getDiscount() == 4){
              discount = "4개월";
            } else if(vo.getDiscount() == 5){
              discount = "5개월";
            }
            %>
              <td><%=input %> / <%=discount %></td>
              <td>할인 금액</td>
              <td>0원</td>
            </tr>
            <tr>
              <td></td>
              <td>총 배송비</td>
              <td>0원</td>
            </tr>
            <tr>
              <td style="border-top: 2px solid #898989"></td>
              <td style="border-top: 2px solid #898989"><%=pay %></td>
              <td style="border-top: 2px solid #898989"><%=df.format(vo.getPaymoney()) %></td>
            </tr>
            <tr>
              <td></td>
              <td>총 결제 금액</td>
              <td><%=df.format(vo.getPaymoney()) %></td>
            </tr>
          </table>
          <%} %>
          </div>
     </div>
     <div style="text-align: center;">
        <button type="button" onclick="window.close();">닫기</button>
      </div>
  </DIV>

  <!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html>
