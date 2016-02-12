package com.phone.trace;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phone.member.*;
import com.phone.payment.*;

@Controller
public class TraceCont {
  @Autowired
  @Qualifier("com.phone.trace.TraceDAO")
  private TraceDAO traceDAO;
  
  @Autowired
  @Qualifier("com.phone.payment.PaymentDAO")
  private PaymentDAO paymentDAO;
  
  @Autowired
  @Qualifier("com.phone.member.memberDAO")
  private MemberDAO memberDAO;
  
  public TraceCont(){
    System.out.println("--> TraceCont created.");
  }
  
  @RequestMapping(value = "/trace/read.do", method = RequestMethod.GET)
  public ModelAndView read(TraceVO traceVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/trace/read");
  
    mav.addObject("read", traceDAO.read(traceVO));
    
    mav.addObject("list", traceDAO.list(traceVO.getWaybil()));
    return mav;
  }
  
  @RequestMapping(value = "/trace/agent.do", method = RequestMethod.GET)
  public ModelAndView agent(TraceVO traceVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/trace/agent");
 
    mav.addObject("agent", traceDAO.read(traceVO));

    return mav;
  }
}
