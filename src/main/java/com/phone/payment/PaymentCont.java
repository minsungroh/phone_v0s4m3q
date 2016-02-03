package com.phone.payment;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phone.content.ContentDAO;
import com.phone.content.ContentVO;


@Controller
public class PaymentCont {
  @Autowired
  @Qualifier("com.phone.payment.PaymentDAO")
  private PaymentDAO paymentDAO;
  
  @Qualifier("com.phone.content.ContentDAO")
  private ContentDAO contentDAO;
  
  public PaymentCont(){
    System.out.println("--> MypageCont created.");
  }
  
  @RequestMapping(value = "/payment/create.do", method = RequestMethod.GET)
  public ModelAndView create(PaymentVO paymentVO, ContentVO contentVO) {
    // System.out.println("--> create() POST called");
    ModelAndView mav = new ModelAndView();
    
    // System.out.println(contentVO.getContentno());
    paymentVO.setOrderno(contentVO.getItemnum());
    paymentVO.setItem(contentVO.getTitle() + " / " + contentVO.getContent());
    paymentVO.setPayfile1(contentVO.getFile());
    paymentVO.setPaymoney(contentVO.getMoney());
    paymentVO.setPcnt(contentVO.getProductcnt());
    
    paymentDAO.create(paymentVO);
    return mav;
  }
  
  @RequestMapping(value = "/payment/read.do", method = RequestMethod.GET)
  public ModelAndView read(int payno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/payment/read");
    mav.addObject("PaymentVO", paymentDAO.read(payno));

    return mav;
  }
}
