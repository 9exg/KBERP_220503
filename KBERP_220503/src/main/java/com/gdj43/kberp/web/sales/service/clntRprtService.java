package com.gdj43.kberp.web.sales.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.sales.dao.IClntRprtDao;

@Service
public class clntRprtService implements IClntRprtService {

	@Autowired
	public IClntRprtDao iClntRprtDao;

	@Override
	public HashMap<String, Object> getData(String string) throws Throwable {
		return iClntRprtDao.getData(string);
	}

}
