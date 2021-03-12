package springweb.z01_exp;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import jspexp.a03_database.A03_ShopDao;
import jspexp.z01_vo.Product2;

public class Z01_ProductController {
	@Autowired(required=false)
	private A03_ShopDao dao;
	
	@ModelAttribute("shopList")
	public ArrayList<Product2> shopList(Product2 sch){
		return dao.shopList2(sch);
	}
	
	// http://localhost:7080/springweb/prodList.do
	@RequestMapping("/prodList.do")
	public String prodList(@ModelAttribute("sch") Product2 sch, Model d) {
		if(sch.getName()==null) sch.setName("");
		d.addAttribute("prodlist", dao.shopList2(sch));
		return "a01_exp\\03_self\\a06_0311.jsp";
	}
}
