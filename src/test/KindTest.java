package test;

import dao.GoodsDAO;
import org.junit.Test;

public class KindTest {


	/*
	*获取kind==1的good列表
	* */
	@Test
	public void getKind(){
		GoodsDAO goodsDAO = new GoodsDAO();
		System.out.println(goodsDAO.getGoodByKind(1));
	}

}
