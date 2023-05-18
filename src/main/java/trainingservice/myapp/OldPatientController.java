package trainingservice.myapp;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.google.gson.Gson;
//
//import trainingservice.model.AnswerVO;
//import trainingservice.model.MemberVO;
//import trainingservice.model.PatientpointVO;
//import trainingservice.model.PatientsDAO;
//import trainingservice.model.PatientsVO;
//
@Controller
public class OldPatientController {
//
//	@Autowired(required=false)
//	private PatientsDAO pDao;
//	@Autowired(required=false)
//	ServletContext application;
//
//
//	@RequestMapping("/patLogin.do")
//	@ResponseBody
//	public String patientsLogin(@RequestParam("data")int pat_id ,Model model) {
//		String page="";
//		String result = "";
//		/*application.setAttribute("data", pat_id);*/
//	/* try{	*/
//		/*result =(String)application.getAttribute("finalresult");*/
//
//
//		System.out.println(pat_id);
//
//		System.out.println("객제가 잘 생성 되었나? : "+pDao);
//
//
//		List<PatientsVO> list = pDao.patientLogin(pat_id);
//		System.out.println(list);
//		application.setAttribute("patlog", list);
//		model.addAttribute("list",list);
//
//		System.out.println(result);
//
//	 	System.out.println(list);
//
//
//		return "환영합니다.";
//	}
//
//	@RequestMapping("/result.do")
//	public String result(@RequestParam("predict")String predict,Model model) {
//
//		model.addAttribute("predict", predict);
//
//		return "result";
//	}
//
//	@RequestMapping("/study.do")
//	public String study(Model model) {
//		 List<AnswerVO> studyinfo = pDao.study();

	      //세션에서 받아온 num값

	      	/*if(num>=10) {
	      		return "result2";
	      	}else if(num<=0) {
	      		num=0;
	      	}*/
	      // 세션에 저장

//		 application.setAttribute("sinfo", studyinfo);
//
//
//	      List<AnswerVO> aList = new ArrayList<AnswerVO>();
//
//	      application.setAttribute("aList", aList);
//	      //문제 정보 저장
//	      application.setAttribute("studyINFO", studyinfo);// 문제 정보 전달
//	      model.addAttribute("stuyinfo", studyinfo);
//	      model.addAttribute("studyContent", studyinfo.get(0).getAns_content());
//	      model.addAttribute("studyCategory", studyinfo.get(0).getAns_category());
//	      model.addAttribute("studyImage", studyinfo.get(0).getAns_image());
//	      model.addAttribute("studySound", studyinfo.get(0).getAns_sound());
//
//		return "study";
//	}
//
//@RequestMapping("/next.do")
//public String next(@RequestParam("result") String result,Model model) {
//
//		//1번 문제 번호 가지고 있는 리스트 가져와서
//		//리스트의 값을 수정
//		//1번 문제에 답을 저장해주는 것
//		System.out.println("넘겨받기 시작하자 ㅋㅋㅋㅋ");
//
//		List<AnswerVO> aList = (List<AnswerVO>)application.getAttribute("aList");
//		List<AnswerVO>studyinfo=(List<AnswerVO>)application.getAttribute("studyINFO");
//		System.out.println("aList"+aList);
//
//		//변수 선언 부분
//		int ans_num = 0;
//		int ans_round = 0;
//		int cate_num=0;
//		String ans_category="";
//		String studyContent="";
//		String studyCategory="";
//		String studyImage="";
//		String studySound="";
//		AnswerVO vo = new AnswerVO();;
//
//		System.out.println("배열 크기는?"+aList.size());
//
//		//문제 한 문제도 안 풀었을 때
//		if(aList.size() == 0) {
//		cate_num=0;
//		//문제 번호랑 회차 환자 로그인 정보 저장하는 리스트에서 가져오기
//		List<PatientsVO> pList = (List<PatientsVO>)application.getAttribute("patlog");
//		ans_num = pList.get(0).getPat_num();
//		ans_round= pList.get(0).getPat_round();
//
//		//vo에 값 세팅
//		vo.setAns_num(ans_num);
//		vo.setAns_round(ans_round);
//		vo.setAns_correct(result);
//		studyContent=studyinfo.get(ans_num).getAns_content();
//		studyCategory=studyinfo.get(ans_num).getAns_category();
//		studyImage=studyinfo.get(ans_num).getAns_image();
//		studySound=studyinfo.get(ans_num).getAns_sound();
//		// 해당 문제가 어떤 유형의 문제인지 세팅
//		ans_category= studyinfo.get(cate_num).getAns_category();
//		System.out.println();
//		vo.setAns_category(ans_category);
//		}else {
//		//문제 번호랑 정답 가지고 오기
//		// 현재 저장된 번호 가져오기
//		ans_num = aList.get(aList.size()-1).getAns_num();
//
//		// 현재 문제유형 넣기
//
//		ans_category= studyinfo.get(ans_num).getAns_category();
//		System.out.println();
//		System.out.println("아이디값 변경"+ans_num);
//		ans_round = 1;
//		//vo에 값 넣기
//		vo.setAns_num(ans_num+1);
//		vo.setAns_round(ans_round);
//		vo.setAns_correct(result);
//		vo.setAns_category(ans_category);
//		System.out.println("vo값 잘 나오는지 확인 문제 번호 :"+vo.getAns_num()+"회차 :"+vo.getAns_round()+"정답 : "+vo.getAns_correct()+"현재 유형: "+vo.getAns_category());
//		/*vo.getAns_num();*/
//		if(ans_num<9) {
//		studyContent=studyinfo.get(ans_num+1).getAns_content();
//		studyCategory=studyinfo.get(ans_num+1).getAns_category();
//		studyImage=studyinfo.get(ans_num+1).getAns_image();
//		studySound=studyinfo.get(ans_num+1).getAns_sound();
//		}
//		}
//
//		//aList에 세팅한 vo값 넣어주기
//		aList.add(vo);
//		System.out.println("리스트 확인 완료");
//		for (int i = 0; i < aList.size(); i++) {
//		System.out.println(aList.get(i).getAns_num()+"번 문제 정답 : "+aList.get(i).getAns_correct()+"문제 유형: "+aList.get(i).getAns_category());
//		}
//		System.out.println(aList.size());
//		application.setAttribute("aList", aList);
//		// 사용자가 푼 문제 application 객체에  저장
//		application.setAttribute("testList", aList);
//		model.addAttribute("studyContent", studyContent);
//		model.addAttribute("studyCategory",studyCategory );
//		model.addAttribute("studyImage", studyImage);
//		model.addAttribute("studySound",studySound );
//
//		String page="study";
//		if(aList.get(aList.size()-1).getAns_num()>=10) {
//		page="redirect:/graph.do";
//		/*	model.addAttributes();*/
//		}
//		else {
//		model.addAttribute("pat_num",aList.get(aList.size()-1).getAns_num()+1 );
//		}
//
//		return page;
//		}
//
//	@RequestMapping("/graph.do")
//	public String graphpoint(Model model) {
//		System.out.println("페이지 생성중");
//		List<PatientsVO> patlog=(List<PatientsVO>)application.getAttribute("patlog");
//		/*List<PatientsVO> graphinfo= pDao.patgraph(patlog);*/
//
//		// 그래프 결과 생성창
//
//
//		return "score";
//	}
//
//
//
//	@RequestMapping("/selectPt.do")
//	public String selectPt(PatientsVO vo, Model model, HttpServletResponse response) {
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json");
//
//
//		List<PatientsVO> info = pDao.selectPatient(vo);
//
//		//System.out.println(info.get(0).);
//		model.addAttribute("info",new Gson().toJson(info));
//		System.out.print(new Gson().toJson(info));
//
//		return "home";
//
//	}
//
//	@RequestMapping("/patRegisterpage.do")
//	public String patRgisterpage() {
//
//		return"patRegister";
//	}
//
//	@RequestMapping("/patRegister.do")
//	public String patRogister(PatientsVO vo) {
//
//
//		MemberVO loginfo =(MemberVO)application.getAttribute("loginfo");
//
//		/*vo.setDoc_id(loginfo.getDoc_id());*/
//
//		int cnt = pDao.patRegister(vo);
//
//
//		return"redirect:/reloadHome.do";
//	}
//	@RequestMapping("/revise_info.do")
//	public String revise_info(@RequestParam("pat_id") int pat_id) {
//		System.out.println(pat_id);
//		List<PatientsVO> info = pDao.revise_info(pat_id);
//		System.out.println("수정정보전 정보");
//		application.setAttribute("re_info", info);
//
//		return"patinfo_revise";
//	}
//
//	@RequestMapping("/revise_pat.do")
//	public String revise_pat(PatientsVO vo) {
//
//		List<PatientsVO> info=(List<PatientsVO>)application.getAttribute("re_info");
//		System.out.println("아이디 넣기전에"+vo.getPat_address());
//		int pat_id=info.get(0).getPat_id();
//		System.out.println("환자아이디 가져오기");
//		vo.setPat_id(pat_id);
//		System.out.println(vo.getPat_id());
//		System.out.println(vo.getPat_id());
//		System.out.println("아이디 넣은 후에"+vo.getPat_address());
//		System.out.println("수정시작ㅋㅋㅋㅋㅋㅋㅋ");
//		int cnt = pDao.revise_pat(vo);
//
//
//		return "redirect:/reloadHome.do";
//
//	}
//
//
//
//

//	@RequestMapping("/scoreDB.do")
//	public String scoreDb(Model model) {
//		List<PatientsVO>list=(List<PatientsVO>)application.getAttribute("patlog");
//		List<PatientpointVO> info =(List<PatientpointVO>)application.getAttribute("ScoreDB");
//		System.out.println(info.get(0).getPat_id());
//		System.out.println(info.get(0).getGesan());
//		System.out.println(info.get(0).getGiuk());
//		System.out.println(info.get(0).getZinam());
//		System.out.println(info.get(0).getMoonje());
//		System.out.println(info.get(0).getZipjoon());
//		System.out.println(info.get(0).getTotalpoint());
//
//
//		int cnt = pDao.scoreDB(info);
//
//		model.addAttribute("list", list);
//		return "studymain";
//	}
//
//
//	@RequestMapping("/allGraph.do")
//	public String allGraph(Model model){
//		String page=  "result2";
//
//		List<PatientsVO> patinfo=(List<PatientsVO>)application.getAttribute("patlog");
//
//		int pat_id= patinfo.get(0).getPat_id();
//
//		List<PatientpointVO> allinfo = pDao.allGraph(pat_id);
//
//		if(allinfo.size()==0) {
//			return "test";
//		}
//
//		/*model.addAttribute("allinfo",allinfo);	*/
//		application.setAttribute("allinfo", allinfo);
//		application.setAttribute("patinfo",patinfo);
//
//
//
//		return page;
//	}
//
//	@RequestMapping("/restudymain.do")
//	public String resutudymain(Model model) {
//
//		List<PatientsVO> list=(List<PatientsVO>)application.getAttribute("patlog");
//
//		/*String pat_name=list.get(0).getPat_name();*/
//		System.out.println("스터디메인두 :ㅋㅋㅋㅋㅋㅋ"+list.get(0).getPat_name());
//		model.addAttribute("list", list);
//
//		return "studymain";
//
//	}
//	@RequestMapping("/faceRegister.do")
//	public String faceRegisterpage() {
//
//		return "faceRegister";
//	}
//
////	@RequestMapping("/face_recognition.do")
//	public String face_recognition(@RequestParam("result")String result) {
//
//		System.out.println("얼굴 인식결과: "+ result);
//
//		application.setAttribute("result", result);
//	/*	application.setAttribute("data", pat_id);*/
//
//		return "face_recognition";
//	}
//
///*	@RequestMapping("origin_num.do")
//	public String face_recognition(@RequestParam("data")int pat_id) {
//
//		System.out.println("얼굴 인식결과: "+ result);
//
//		application.setAttribute("result", result);
//		application.setAttribute("data", pat_id);
//
//		return "origin_num";
//	}*/
//
//
}
