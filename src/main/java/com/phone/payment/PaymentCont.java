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
      msgs.add("�ش� ��ǰ�� ������ �ּż� �����մϴ�");
        if(!paymentVO.getDeposit_input().equals("none")){
          msgs.add("�����Ͻ� �ݾ��� �Ʒ� �����ȣ�� �����ϳ��� �Աݺ�Ź�帳�ϴ�.");
          msgs.add("�ش� �Ⱓ���� �Ա����� ���� ��� �ش� ��ǰ�� ���Ŵ� �ڵ� ��ҵ˴ϴ�.");
          if(paymentVO.getDeposit_input().equals("kbb")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>�������� : 123456-12-123456 (������ : ����Ʈ���̽�)</span>");
          } else if(paymentVO.getDeposit_input().equals("urib")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>�츮���� : 1234-12-12-12456 (������ : ����Ʈ���̽�)</span>");
          } else if(paymentVO.getDeposit_input().equals("sinhanb")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>�������� : 123456-12-123456 (������ : ����Ʈ���̽�)</span>");
          } else if(paymentVO.getDeposit_input().equals("hanab")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>�ϳ����� : 1234-12-12-12456 (������ : ����Ʈ���̽�)</span>");
          } else if(paymentVO.getDeposit_input().equals("postb")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>��ü�� : 123456-12-123456 (������ : ����Ʈ���̽�)</span>");
          }
        } else if(!paymentVO.getPhone_input().equals("none")){
          msgs.add("��ϵ� �ڵ��� ��ȣ�� ������ �Ϸ�Ǿ����ϴ�.");
        }
    } else {
      msgs.add("������ �����߽��ϴ�.");
      msgs.add("�ٽ� �ѹ� �õ��� �ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
    }
    links.add("<button type='button' onclick=\"location.href='../index.do'\">����</button>");
    
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
      msgs.add("��ǰ ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"window.close()\">�ݱ�</button>");
    }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
}
