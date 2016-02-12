package com.phone.trace;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.phone.trace.TraceDAO")
public class TraceDAO {
    @Autowired
    private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
    
    public TraceDAO(){
      System.out.println("--> PaymentDAO created.");
    }
    
    public TraceMapperInter mapper(){
      TraceMapperInter mapper = sqlSession.getMapper(TraceMapperInter.class);    
      
      return mapper;
    }
    
    public int create(TraceVO traceVO){
      return mapper().create(traceVO);
    }
    
    public ArrayList<TraceVO> list(int waybil){
      return mapper().list(waybil);
    }
    
    public TraceVO read(TraceVO traceVO){
      return mapper().read(traceVO);
    }
    
    public int update(TraceVO traceVO){
      return mapper().update(traceVO);
    }
    
    public int delete(int deleveryno){
      return mapper().delete(deleveryno);
    }
}
