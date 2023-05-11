//package trainingservice.model;
//
//import java.util.List;
//
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import com.mysql.cj.Session;
//
//@Repository
//public class MemberDAOImpl implements MemberDAO {
//
//	@Autowired
//	private SqlSessionFactory sqlSessionFactory;
//
//	@Override
//	public int docRegister(MemberVO vo) {
//		System.out.println(vo.getDoc_id());
//		System.out.println(vo.getDoc_pass());
//		System.out.println(vo.getDoc_name());
//		System.out.println(vo.getDoc_phone());
//		System.out.println(vo.getDoc_organization());
//		System.out.println(vo.getDoc_email());
//		SqlSession session = sqlSessionFactory.openSession();
//		System.out.println("sql문 오픈");
//
//		int cnt = session.insert("docRegister", vo);
//		System.out.println("저장 완료");
//		session.commit();
//		session.close();
//
//		return cnt;
//	}
//
//	@Override
//	public List<MemberVO> docLogin(MemberVO vo) {
//		System.out.println("로그인 포조 진행중");
//		SqlSession session = sqlSessionFactory.openSession();
//
//		List<MemberVO> info = session.selectList("docLogin", vo);
//
//		session.close();
//		System.out.println("포조 실행 완료");
//		return info;
//	}
//
//	@Override
//	public List<MemberVO> patlist(MemberVO info) {
//
//		// 환자 출력 서비스
//				SqlSession session = sqlSessionFactory.openSession();
//
//				List<MemberVO> patlist = session.selectList("patlist",info);
//				session.close();
//
//
//		return null;
//	}
//
//	@Override
//	public int patientDelete(int pat_id) {
//		// 환자 삭제
//		SqlSession session = sqlSessionFactory.openSession();
//		int cnt = session.delete("patientDelete", pat_id);
//		System.out.println("삭제 완료 ");
//		session.commit();
//		session.close();
//		return cnt;
//	}
//
//	@Override
//	public List<MemberVO> reloadHome(MemberVO vo) {
//		// TODO Auto-generated method stub
//
//		SqlSession session = sqlSessionFactory.openSession();
//		List<MemberVO> info = session.selectList("reloadHome", vo);
//		session.close();
//
//
//		return info;
//	}
//
//	@Override
//	public List<PatientpointVO> detail_result(int pat_id) {
//		// 치료사 페이지용 환자 결과페이지 데이터 가져오기
//		SqlSession session = sqlSessionFactory.openSession();
//
//
//		List<PatientpointVO>info = session.selectList("allGraph", pat_id);
//
//
//		return info;
//	}
//
//
//
//	//문제리스트
//
//
//
//
// }
