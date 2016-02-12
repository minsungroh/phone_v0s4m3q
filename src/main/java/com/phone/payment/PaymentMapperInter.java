package com.phone.payment;

import java.util.ArrayList;

public interface PaymentMapperInter {
  //   <insert id="create" parameterType="PaymentVO">
  public int create(PaymentVO paymentVO);
  
  // <select id="read" resultType="PaymentVO" parameterType="int">
  public PaymentVO read(PaymentVO paymentVO);
  
  // <select id="list" resultType="PaymentVO">
  public ArrayList<PaymentVO> list(int payno);
  
  // <update id="update" parameterType="PaymentVO">
  public int update(PaymentVO paymentVO);
  
  // <delete id="delete" parameterType="int">
  public int delete(int payno);
}
