package com.phone.payment;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.phone.payment.PaymentDAO")
public class PaymentDAO {
    @Autowired
    private SqlSession sqlSession; // MyBATIS 3 연결 객체
    
    public PaymentDAO(){
      System.out.println("--> PaymentDAO created.");
    }
    
    public PaymentMapperInter mapper(){
      PaymentMapperInter mapper = sqlSession.getMapper(PaymentMapperInter.class);    
      
      return mapper;
    }
    
    /** 
     * 상품을 등록합니다
     * @param paymentVO 주문 클릭시 들어오는 상품 목록
     * @return
     */
    public int create(PaymentVO paymentVO){
      return mapper().create(paymentVO);
    }
    
    /**
     * 주문할 상품 조회 
     * @param payno
     * @return
     */
    public PaymentVO read(int payno){
      return mapper().read(payno);
    }
    
    public ArrayList<PaymentVO> list(){
      return mapper().list();
    }
    
    public int update(PaymentVO paymentVO){
      return mapper().update(paymentVO);
    }
    
    public int delete(int payno){
      return mapper().delete(payno);
    }
}
