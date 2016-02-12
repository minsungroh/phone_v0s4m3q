package com.phone.payment;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.phone.payment.PaymentDAO")
public class PaymentDAO {
    @Autowired
    private SqlSession sqlSession; // MyBATIS 3 ���� ��ü
    
    public PaymentDAO(){
      System.out.println("--> PaymentDAO created.");
    }
    
    public PaymentMapperInter mapper(){
      PaymentMapperInter mapper = sqlSession.getMapper(PaymentMapperInter.class);    
      
      return mapper;
    }
    
    /** 
     * ��ǰ�� ����մϴ�
     * @param paymentVO �ֹ� Ŭ���� ������ ��ǰ ���
     * @return
     */
    public int create(PaymentVO paymentVO){
      return mapper().create(paymentVO);
    }
    
    /**
     * �ֹ��� ��ǰ ��ȸ 
     * @param payno
     * @return
     */
    public PaymentVO read(PaymentVO paymentVO){
      return mapper().read(paymentVO);
    }
    
    public ArrayList<PaymentVO> list(int payno){
      return mapper().list(payno);
    }
    
    public int update(PaymentVO paymentVO){
      return mapper().update(paymentVO);
    }
    
    public int delete(int payno){
      return mapper().delete(payno);
    }
}
