package trainingservice.model;

import java.util.List;

public interface MemberDAO {
	/*public List<MemberVO> memberList();
	public int memberIsert(MemberVO vo);
	public int memberDelete(int num);
	public MemberVO memberContent(int num);
	public int memberUpdate(MemberVO vo);*/
	
	public int docRegister(MemberVO vo);
	public List<MemberVO> docLogin(MemberVO vo);
	public List<MemberVO> patlist(MemberVO info);
	public int patientDelete(int pat_id);
	public List<MemberVO> reloadHome(MemberVO vo);
	public List<PatientpointVO> detail_result(int pat_id);

	
	
}
