package springweb.a02_mvc.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import springweb.z02_vo.Calendar;

@Repository
public interface A04_CalenDao {
//	springweb.a02_mvc.a03_dao.A04_CalenDao
	public ArrayList<Calendar> calenList();
	public void insertCalendar(Calendar ins);
	public void updateCalen(Calendar upt);
	public void deleteCalen(int id);
}