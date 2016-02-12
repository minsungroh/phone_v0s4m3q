package com.phone.trace;

import java.util.ArrayList;

public interface TraceMapperInter {
  // <insert id="create" parameterType="TraceVO">
  public int create(TraceVO traceVO);
  
  // <select id="list" resultType="TraceVO" parameterType="int">
  public ArrayList<TraceVO> list(int waybil);
  
  // <select id="read" resultType="TraceVO" parameterType="TraceVO">
  public TraceVO read(TraceVO traceVO);
  
  // <update id="update" parameterType="TraceVO">
  public int update(TraceVO traceVO);
  
  // <delete id="delete" parameterType="int">
  public int delete(int deleveryno);
}
