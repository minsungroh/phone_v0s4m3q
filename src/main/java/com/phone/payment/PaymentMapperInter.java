package com.phone.payment;

public interface PaymentMapperInter {
  //   <insert id="create" parameterType="PaymentVO">
  public int create(PaymentVO paymentVO);
  
  // <select id="read" resultType="PaymentVO" parameterType="int">
  public PaymentVO read(int payno);
}
