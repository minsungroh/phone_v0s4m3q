package com.phone.payment;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phone.content.*;
import com.phone.deliveryaddr.DeliveryAddrVO;
import com.phone.member.*;



@Controller
public class PaymentCont {
  @Autowired
  @Qualifier("com.phone.payment.PaymentDAO")
  private PaymentDAO paymentDAO;
  
  @Autowired
  @Qualifier("com.phone.content.ContentDAO")
  private ContentDAO contentDAO;
  
  @Autowired
  @Qualifier("com.phone.member.memberDAO")
  private MemberDAO memberDAO;
  
  public PaymentCont(){
    System.out.println("--> MypageCont created.");
  }
  
  @RequestMapping(value = "/payment/create.do", method = RequestMethod.GET)
  public ModelAndView create(PaymentVO paymentVO, ContentVO contentVO) {
    // System.out.println("--> create() POST called");
    ModelAndView mav = new ModelAndView();
    
    // System.out.println(contentVO.getContentno());
    paymentVO.setContentno(contentVO.getContentno());
    paymentVO.setItem(contentVO.getTitle() + " / " + contentVO.getContent());
    paymentVO.setPayfile1(contentVO.getFile());
    paymentVO.setPaymoney(contentVO.getMoney());
    paymentVO.setPcnt(contentVO.getProductcnt());
    paymentVO.setOrderno(contentVO.getContentno() + contentVO.getContent());
    
    paymentDAO.create(paymentVO);
    return mav;
  }
  
  @RequestMapping(value = "/payment/read.do", method = RequestMethod.GET)
  public ModelAndView read(PaymentVO paymentVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/payment/read");
    mav.addObject("PaymentVO", paymentDAO.read(paymentVO));
    /*System.out.println(paymentVO.getMno());*/
   /* int mno = paymentVO.getMno();
    System.out.println(mno);
    MemberVO vo = memberDAO.read(mno);
    System.out.println(vo.getMname());*/
   // System.out.println(vo.getMname());
    mav.addObject("MemberVO", memberDAO.read(paymentDAO.read(paymentVO).getMno()));
    
    
    return mav;
  }
  
  @RequestMapping(value = "/payment/update.do", method = RequestMethod.POST)
  public ModelAndView update(PaymentVO paymentVO) {
    ModelAndView mav = new ModelAndView();
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    mav.setViewName("/payment/message");

    if (paymentDAO.update(paymentVO) == 1) {
      msgs.add("해당 상품을 구매해 주셔서 감사합니다");
        if(!paymentVO.getDeposit_input().equals("none")){
          msgs.add("결재하신 금액은 아래 통장번호로 일주일내로 입금부탁드립니다.");
          msgs.add("해당 기간동안 입금하지 않을 경우 해당 상품의 구매는 자동 취소됩니다.");
          if(paymentVO.getDeposit_input().equals("kbb")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>국민은행 : 123456-12-123456 (예금주 : 스마트케이스)</span>");
          } else if(paymentVO.getDeposit_input().equals("urib")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>우리은행 : 1234-12-12-12456 (예금주 : 스마트케이스)</span>");
          } else if(paymentVO.getDeposit_input().equals("sinhanb")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>신한은행 : 123456-12-123456 (예금주 : 스마트케이스)</span>");
          } else if(paymentVO.getDeposit_input().equals("hanab")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>하나은행 : 1234-12-12-12456 (예금주 : 스마트케이스)</span>");
          } else if(paymentVO.getDeposit_input().equals("postb")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>우체국 : 123456-12-123456 (예금주 : 스마트케이스)</span>");
          }
        } else if(!paymentVO.getPhone_input().equals("none")){
          msgs.add("등록된 핸드폰 번호로 결제가 완료되었습니다.");
        }
    } else {
      msgs.add("결제에 실패했습니다.");
      msgs.add("다시 한번 시도해 주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
    }
    links.add("<button type='button' onclick=\"location.href='../index.do'\">메인</button>");
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  @RequestMapping(value = "/payment/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int payno) {
    ModelAndView mav = new ModelAndView();
   

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (paymentDAO.delete(payno) == 1) {
      mav.setViewName("redirect:/index.do");
    } else {
      mav.setViewName("/payment/message");
      msgs.add("상품 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"window.close()\">닫기</button>");
    }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
}
