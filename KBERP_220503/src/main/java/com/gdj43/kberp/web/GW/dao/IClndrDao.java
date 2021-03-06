package com.gdj43.kberp.web.GW.dao;

import java.util.HashMap;
import java.util.List;

public interface IClndrDao {

	public void clndrAdd(HashMap<String, String> params) throws Throwable;

	public void clndrUpdate(HashMap<String, String> params) throws Throwable;

	public void clndrDelete(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSchdl(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> dtlSchdl(HashMap<String, String> params)throws Throwable;


}
