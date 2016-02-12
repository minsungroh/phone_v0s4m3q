package com.phone.mypage;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phone.member.*;
import com.phone.payment.*;

@Controller
public class MypageCont {
  @Autowired
  @Qualifier("com.phone.mypage.MypageDAO")
  private MypageDAO mypageDAO;
  
  @Autowired
  @Qualifier("com.phone.payment.PaymentDAO")
  private PaymentDAO paymentDAO;
  
  @Autowired
  @Qualifier("com.phone.member.memberDAO")
  private MemberDAO memberDAO;
  
  public MypageCont(){
    System.out.println("--> MypageCont created.");
  }
  
  @RequestMapping(value = "/mypage/read.do", method = RequestMethod.GET)
  public ModelAndView read(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/list");
    mav.addObject("grade", memberDAO.read(mypageVO.getMno()).getGrade());
    mav.addObject("pay_wait", mypageDAO.count_paywait(mypageVO.getMno()));
    mav.addObject("pay_ok", mypageDAO.count_payok(mypageVO.getMno()));
    mav.addObject("product_ready", mypageDAO.count_pready(mypageVO.getMno()));
    mav.addObject("delivery", mypageDAO.count_delivery(mypageVO.getMno()));
    mav.addObject("complate", mypageDAO.count_complate(mypageVO.getMno()));
    mav.addObject("ok_wait", mypageDAO.count_okwait(mypageVO.getMno()));
    
    mav.addObject("list", mypageDAO.list(mypageVO));
    return mav;
  }
  
  @RequestMapping(value = "/mypage/detail_list.do", method = RequestMethod.GET)
  public ModelAndView detail_list(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/detail_list");
    
    mav.addObject("detail_list", mypageDAO.detail_list(mypageVO));

    return mav;
  }
  
  @RequestMapping(value = "/mypage/take_back.do", method = RequestMethod.GET)
  public ModelAndView take_back(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/take_back");
    
    mav.addObject("take_back", mypageDAO.detail_list(mypageVO));

    return mav;
  }
  
  @RequestMapping(value = "/mypage/update.do", method = RequestMethod.GET)
  public ModelAndView update(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    
    int money = mypageDAO.update_read(mypageVO.getMno()).getPaymoney();
    
    System.out.println(mypageDAO.update_read(mypageVO.getMno()).getOrdersubmit());
    if(mypageDAO.update_read(mypageVO.getMno()).getOrdersubmit().equals("N")){
      mypageVO.setOrdersubmit("Y");
      mypageVO.setPoint((int)(money * 0.001));
    }
    
      mypageDAO.update_os(mypageVO);
      mav.setViewName("redirect:./read.do?mno=" + mypageVO.getMno() + "&paycharge=" + mypageDAO.update_read(mypageVO.getMno()).getPaycharge());
    
    return mav;
  }
}
