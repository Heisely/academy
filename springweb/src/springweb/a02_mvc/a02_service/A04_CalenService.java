package springweb.a02_mvc.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.A04_CalenDao;
import springweb.z02_vo.Calendar;

@Service
public class A04_CalenService {
	@Autowired(required = false)
	private A04_CalenDao dao;
	
	public ArrayList<Calendar> calenList(){
		return dao.calenList();
	}
}
