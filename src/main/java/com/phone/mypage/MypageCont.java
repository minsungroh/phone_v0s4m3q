package com.phone.mypage;

import java.util.ArrayList;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phone.member.*;
import com.phone.payment.*;
import com.phone.trace.TraceDAO;
import com.phone.trace.TraceVO;

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
  
  @Autowired
  @Qualifier("com.phone.trace.TraceDAO")
  private TraceDAO traceDAO;
  
  public MypageCont(){
    System.out.println("--> MypageCont created.");
  }
  
  @RequestMapping(value = "/mypage/create.do", method = RequestMethod.GET)
  public ModelAndView create(MypageVO mypageVO, PaymentVO paymentVO) {
    // System.out.println("--> create() POST called");
    ModelAndView mav = new ModelAndView();
    

    if(mypageVO.getPaycharge().equals("Y")){
      mypageVO.setOrderstate("결제완료");
      
    } else if(mypageVO.getPaycharge().equals("N")){
      mypageVO.setOrderstate("결제대기중");
    }
    mypageVO.setPayno(paymentDAO.mypage_read(paymentVO).getPayno());
    
    mypageDAO.create(mypageVO);
    mav.setViewName("redirect:./read.do?mno=" + mypageVO.getMno());
    return mav;
  }
  
  @RequestMapping(value = "/mypage/read.do", method = RequestMethod.GET)
  public ModelAndView read(MypageVO mypageVO, TraceVO traceVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/list");
    mav.addObject("grade", memberDAO.read(mypageVO.getMno()).getGrade());
    mav.addObject("pay_wait", mypageDAO.count_paywait(mypageVO.getMno()));
    mav.addObject("pay_ok", mypageDAO.count_payok(mypageVO.getMno()));
    mav.addObject("product_ready", mypageDAO.count_pready(mypageVO.getMno()));
    mav.addObject("delivery", mypageDAO.count_delivery(mypageVO.getMno()));
    mav.addObject("complate", mypageDAO.count_complate(mypageVO.getMno()));
    mav.addObject("ok_wait", mypageDAO.count_okwait(mypageVO.getMno()));
    
    ArrayList<MypageVO> list = mypageDAO.list(mypageVO);
    Iterator<MypageVO> iter = list.iterator();
    String state="";
    while(iter.hasNext() == true){
      MypageVO vo = iter.next();
     
      if(vo.getOrderstate().equals("결제대기중")){
        state = "결제대기중";
     } else if(vo.getOrderstate().equals("결제완료") && vo.getTrace_state().equals("")){
        state = "결제완료";
     }else if(vo.getOrderstate().equals("결제완료") && vo.getTrace_state().equals("상품준비중") || vo.getTrace_state().equals("배송중")){
        state = vo.getTrace_state();
     } else if(vo.getTrace_state().equals("배송완료")){
        state = "구매 결정 대기";
     }
      vo.setPayday(vo.getPayday().substring(0, 11));
      
      mypageVO.setMy_state(state);
      mypageDAO.my_state_update(mypageVO);
    }
    
    mav.addObject("list", list);

    return mav;
  }
  
  @RequestMapping(value = "/mypage/detail_read.do", method = RequestMethod.GET)
  public ModelAndView detail_list(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/detail_list");
    
    System.out.println(mypageDAO.detail_read(mypageVO).getMy_state());
    mav.addObject("detail_list", mypageDAO.detail_read(mypageVO));
    mav.addObject("detail_date", mypageDAO.detail_read(mypageVO).getPayday().substring(0, 11));

    return mav;
  }
  
  @RequestMapping(value = "/mypage/take_back.do", method = RequestMethod.GET)
  public ModelAndView take_back(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/take_back");
    
    mav.addObject("take_back", mypageDAO.detail_read(mypageVO));

    return mav;
  }
  
  @RequestMapping(value = "/mypage/update.do", method = RequestMethod.GET)
  public ModelAndView update(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    
    int money = mypageDAO.update_read(mypageVO).getPaymoney();
    
    if(mypageDAO.update_read(mypageVO).getOrdersubmit().equals("N")){
      mypageDAO.update_read(mypageVO).setOrdersubmit("Y");
      mypageDAO.update_read(mypageVO).setPoint((int)(money * 0.001));
    }
    
      mypageDAO.update_os(mypageVO);
      mav.setViewName("redirect:./read.do?mno=" + mypageVO.getMno() + "&paycharge=" + mypageDAO.update_read(mypageVO).getPaycharge());
    
    return mav;
  }
}
