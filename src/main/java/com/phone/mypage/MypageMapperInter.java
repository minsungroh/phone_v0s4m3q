package com.phone.mypage;

import java.util.ArrayList;

public interface MypageMapperInter {
  //<select id="read" resultType="MypageVO" parameterType="int">
  public MypageVO read(MypageVO mypageVO);
  
  // <select id="count_paywait" resultType="int" parameterType="int">
  public int count_paywait(int mno);
  
  // <select id="count_payok" resultType="int" parameterType="int">
  public int count_payok(int mno);
  
  // <select id="count_pready" resultType="int" parameterType="int">
  public int count_pready(int mno);
  
  // <select id="count_delivery" resultType="int" parameterType="int">
  public int count_delivery(int mno);
  
  // <select id="count_complate" resultType="int" parameterType="int">
  public int count_complate(int mno);
  
  // <select id="count_okwait" resultType="int" parameterType="int">
  public int count_okwait(int mno);
  
  // <select id="list" resultType="MypageVO" parameterType="MypageVO">
  public ArrayList<MypageVO> list(MypageVO mypageVO);
  
  // <select id="detail_read" resultType="MypageVO" parameterType="MypageVO">
  public MypageVO detail_read(MypageVO mypageVO);
  
  // <update id="update_os" parameterType="MypageVO">
  public int update_os(MypageVO mypageVO);
  
  // <select id="update_read" resultType="MypageVO" parameterType="int">
  public MypageVO update_read(MypageVO mypageVO);
  
  // <insert id="create" parameterType="MypageVO">
  public int create(MypageVO mypageVO);
  
  // <update id="my_state_update" parameterType="MypageVO">
  public int my_state_update(MypageVO mypageVO);
  
  // <select id="read_mypageno" resultType="MypageVO" parameterType="MypageVO">
  public MypageVO read_mypageno(MypageVO mypageVO);
}
