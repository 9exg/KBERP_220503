package com.gdj43.kberp.web.sales.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class clntRprtDao implements IClntRprtDao {
	
	@Autowired
	public SqlSession sqlSession;

	@Override
	public HashMap<String, Object> getData(String string) throws Throwable {
		return sqlSession.selectOne(string);
	}

}
