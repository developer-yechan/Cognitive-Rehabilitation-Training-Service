//package trainingservice.model;
//
//import java.util.List;
//
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//@Repository
//public class PatientsDAO {
//
//	@Autowired
//	private SqlSessionFactory sqlSessionFactory;
//
//
//	public List<PatientsVO> patientLogin(int pat_id) {
//		// TODO Auto-generated method stub
//
//
//		SqlSession session = sqlSessionFactory.openSession();
//
//		List<PatientsVO> list = session.selectList("patientsLogin", pat_id);
//		System.out.println("list 객체값 확인");
//		System.out.println(list.get(0).getPat_name());
//		session.close();
//
//		return list;
//	}
//
//
//	public List<AnswerVO> getAnswer(int ans_round){
//
//		SqlSession session = sqlSessionFactory.openSession();
//
//		List<AnswerVO> list = session.selectList("getAnswer",ans_round);
//
//		session.close();
//
//		return list;
//	}
//
//	public List<PatientsVO> selectPatient(PatientsVO vo){
//		SqlSession session = sqlSessionFactory.openSession();
//
//		List<PatientsVO> info = session.selectList("selectPt", vo);
//
//
//		session.close();
//		return info;
//	}
//
//	public List<AnswerVO> study(){
//		SqlSession session = sqlSessionFactory.openSession();
//		List<AnswerVO> studyinfo = session.selectList("study");
//		session.close();
//		return studyinfo;
//	}
//
//	public int patRegister(PatientsVO vo){
//
//		SqlSession session = sqlSessionFactory.openSession();
//		int cnt = session.insert("patRegister", vo);
//
//
//		return cnt;
//	}
//
//	public List<PatientsVO>revise_info(int pat_id){
//		System.out.println(pat_id);
//		SqlSession session = sqlSessionFactory.openSession();
//		List<PatientsVO> info = session.selectList("revise_info", pat_id);
//		System.out.println(info.get(0).getPat_name());
//		return info;
//	}
//
//
//	public int revise_pat(PatientsVO vo) {
//		SqlSession session = sqlSessionFactory.openSession();
//
//		System.out.println(vo.getPat_name());
//		System.out.println("환자 고유번호"+vo.getPat_id());
//		System.out.println("환자 주소변경 "+vo.getPat_address());
//		System.out.println("환자 나이"+vo.getPat_age());
//		System.out.println("환자성별: "+vo.getPat_gender());
//		System.out.println("환자 이름"+ vo.getPat_name());
//		System.out.println("환자 전화번호"+ vo.getPat_phone());
//
//		int cnt=session.update("revise_pat", vo);
//
//		session.commit();
//		session.close();
//
//		return cnt;
//	}
//
//
//	public int scoreDB(List<PatientpointVO> info) {
//		// 사용자 인지재활 테스트 점수 저장
//		SqlSession session = sqlSessionFactory.openSession();
//		PatientpointVO vo= new PatientpointVO();
//
//		vo.setGesan(info.get(0).getGesan());
//		vo.setGiuk(info.get(0).getGiuk());
//		vo.setMoonje(info.get(0).getMoonje());
//		vo.setPat_id(info.get(0).getPat_id());
//		vo.setTotalpoint(info.get(0).getTotalpoint());
//		vo.setZinam(info.get(0).getZinam());
//		vo.setZipjoon(info.get(0).getZipjoon());
//		int cnt=session.insert("scoreDB", vo);
//
//		session.commit();
//		session.close();
//
//
//		return cnt;
//	}
//
//	public List<PatientpointVO> allGraph(int pat_id) {
//		// TODO Auto-generated method stub
//		SqlSession session = sqlSessionFactory.openSession();
//
//		List<PatientpointVO> allinfo=session.selectList("allGraph", pat_id);
//		session.commit();
//		session.close();
//
//		return  allinfo;
//	}
//
//	public List<PatientsVO> name_result(int pat_id) {
//		// 치료사 페이지의 그래프에 출력할 이름가져오기
//		SqlSession session = sqlSessionFactory.openSession();
//		List<PatientsVO> nameinfo = session.selectList("name_result", pat_id);
//
//		return nameinfo;
//	}
//}
