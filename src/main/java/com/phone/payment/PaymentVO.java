package com.phone.payment;

public class PaymentVO {

  private int payno;
  private String item;
  private String payfile1;
  private int pcnt;
  private int paymoney;
  private int contentno;
  private int mno;

  public int getPayno() {
    return payno;
  }

  public void setPayno(int payno) {
    this.payno = payno;
  }

  public String getItem() {
    return item;
  }

  public void setItem(String item) {
    this.item = item;
  }

  public String getPayfile1() {
    return payfile1;
  }

  public void setPayfile1(String payfile1) {
    this.payfile1 = payfile1;
  }

  public int getPcnt() {
    return pcnt;
  }

  public void setPcnt(int pcnt) {
    this.pcnt = pcnt;
  }

  public int getPaymoney() {
    return paymoney;
  }

  public void setPaymoney(int paymoney) {
    this.paymoney = paymoney;
  }

  public int getContentno() {
    return contentno;
  }

  public void setContentno(int contentno) {
    this.contentno = contentno;
  }

  public int getMno() {
    return mno;
  }

  public void setMno(int mno) {
    this.mno = mno;
  }

}
