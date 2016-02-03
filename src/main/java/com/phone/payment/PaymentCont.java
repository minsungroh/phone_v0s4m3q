package com.phone.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phone.content.*;
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
    
    paymentDAO.create(paymentVO);
    return mav;
  }
  
  @RequestMapping(value = "/payment/read.do", method = RequestMethod.GET)
  public ModelAndView read(int contentno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/payment/read");
    PaymentVO paymentVO = paymentDAO.read(contentno);
    mav.addObject("PaymentVO", paymentVO);
    //System.out.println(paymentVO.getMno());
   /* int mno = paymentVO.getMno();
    System.out.println(mno);
    MemberVO vo = memberDAO.read(mno);
    System.out.println(vo.getMname());*/
   // System.out.println(vo.getMname());
    mav.addObject("MemberVO", memberDAO.read(paymentVO.getMno()));
    
    
    return mav;
  }
}
