package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	private DataSource ds;
	
	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); 
			
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); 
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public boolean isExistId(String id){
		boolean exist = false;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistId",id);
		if(memberDTO != null) exist = true;
		sqlSession.close();
		return exist;
	}
	
	public void write(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("memberSQL.write",memberDTO);
		sqlSession.commit();
		sqlSession.close();
		
	}
	
	public MemberDTO login(String id, String pwd){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pwd", pwd); 
		
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.login",map);
		sqlSession.close();
		return memberDTO;
	}
}

