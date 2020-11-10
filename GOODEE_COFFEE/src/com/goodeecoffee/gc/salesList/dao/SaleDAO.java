package com.goodeecoffee.gc.salesList.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("saleDAO")
public class SaleDAO implements ISaleDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
