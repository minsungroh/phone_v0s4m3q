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
    
    int mypageno = mypageDAO.read_mypageno(mypageVO).getMypageno();
    mav.setViewName("redirect:../trace/create_mypageno.do?mypageno=" + mypageno + "&mno=" + mypageVO.getMno());
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
    while(iter.hasNext() == true){
      MypageVO vo = iter.next();
     
      if(vo.getOrderstate().equals("결제대기중")){
        vo.setMy_state("결제대기중");
     } else if(vo.getOrderstate().equals("결제완료") && vo.getTrace_state().equals("")){
        vo.setMy_state("결제완료");
     } else if((vo.getTrace_state().equals("상품준비중") || vo.getTrace_state().equals("배송중")) && vo.getOrderstate().equals("결제완료")){
        vo.setMy_state(vo.getTrace_state());
     } else if(vo.getTrace_state().equals("배송완료")){
        vo.setMy_state("구매 결정 대기");
     }
      
      vo.setPayday(vo.getPayday().substring(0, 11));
      mypageVO.setMy_state(vo.getMy_state());
      System.out.println(mypageVO.getMy_state());
      mypageDAO.my_state_update(mypageVO);
    }
    
    mav.addObject("list", list);

    return mav;
  }
  
  @RequestMapping(value = "/mypage/detail_read.do", method = RequestMethod.GET)
  public ModelAndView detail_list(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/detail_list");
    

    mav.addObject("detail_date", mypageDAO.detail_read(mypageVO).getPayday().substring(0, 11));
    mav.addObject("detail_list", mypageDAO.detail_read(mypageVO));
    
    MypageVO vo = mypageDAO.detail_read(mypageVO);
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
    
    vo.setPay_detail(pay);
    vo.setInput_detail(input);
    mav.addObject("pay_detail", vo.getPay_detail());
    mav.addObject("input_detail", vo.getInput_detail());
    
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
    System.out.println(money);
    if(mypageDAO.update_read(mypageVO).getOrdersubmit().equals("N")){
      mypageDAO.update_read(mypageVO).setOrdersubmit("Y");
      mypageDAO.update_read(mypageVO).setPoint((int)(money * 0.001));
    }
    
      mypageDAO.update_os(mypageVO);
      mav.setViewName("redirect:./read.do?mno=" + mypageVO.getMno() + "&paycharge=" + mypageDAO.update_read(mypageVO).getPaycharge());
    
    return mav;
  }
}
