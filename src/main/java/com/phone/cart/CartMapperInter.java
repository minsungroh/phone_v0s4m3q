package com.phone.cart;

import java.util.ArrayList;

public interface CartMapperInter {
	//<insert id="create" parameterType="CartVO">
	public int create(CartVO cartVO);
	
	//<select id="list" resultType="CartVO">
	public ArrayList<CartVO> list();
	
	public int update(CartVO cartVO);
	
	//<delete id="delete" parameterType="int">
	public int delete(int cartno);
}
