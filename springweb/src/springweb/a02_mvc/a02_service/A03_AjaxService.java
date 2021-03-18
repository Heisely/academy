package springweb.a02_mvc.a02_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.A03_AjaxDao;

@Service
public class A03_AjaxService {
	@Autowired(required = false)
	private A03_AjaxDao dao;
	
	public int schMember(String id) {
		return dao.schMember(id);
	}
}
