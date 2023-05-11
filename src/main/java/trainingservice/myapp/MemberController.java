//package trainingservice.myapp;
//
//
//import java.util.List;
//
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.google.gson.Gson;
//
//import trainingservice.model.MemberDAO;
//import trainingservice.model.MemberVO;
//import trainingservice.model.PatientpointVO;
//import trainingservice.model.PatientsDAO;
//import trainingservice.model.PatientsVO;
//
//
//@Controller // 스프링 컨테이너가 여기를 관리한다. 이것을 servelet.xml의 component-span 이 관리해준다.
//public class MemberController {
//
//	@Autowired // 스프링 컨테이너에서 연결 시켜라 memberDAO를
//	private MemberDAO dao;
//	@Autowired(required=false)
//	private PatientsDAO pDao;
//	@Autowired(required=false)
//	ServletContext application;
//
//
//	// 치료사 컨트롤러
//
//	@RequestMapping("/loginHome.do")
//	public String loginHome() {
//		// 로그인 페이지
//		return "loginHome2";
//	};
//
//
//
//	@RequestMapping("/docRegisterpage.do")
//	public String docRegisterpage() {
//
//		return "docRegister2";
//	};
//
//	// docRegister.do
//	@RequestMapping("/docRegister.do")
//	public String docRegister(MemberVO vo) {
//		System.out.println("회원가입 시작");
//		System.out.println(vo.getDoc_id());
//		System.out.println(vo.getDoc_pass());
//		System.out.println(vo.getDoc_name());
//		System.out.println(vo.getDoc_phone());
//		System.out.println(vo.getDoc_organization());
//		System.out.println(vo.getDoc_email());
//
//		int cnt = dao.docRegister(vo);
//
//		return "redirect:/loginHome.do";
//	}
//
//	@RequestMapping("/docLogin.do")
//	public String docLogin(MemberVO vo, Model model, HttpServletRequest request) {
//		// 치료사 로그인 기능
//
//		String page= "";
//
//		if(vo.getDoc_id().equals(" ")) {
//			page="redirect:/loginHome.do";
//		}else {
//			page="home";
//		}
//
//		System.out.println(vo.getDoc_id());
//		System.out.println("로그인 시작");
//		List<MemberVO> info = dao.docLogin(vo);
//
//		HttpSession session = request.getSession();
//		session.removeAttribute("vo");
//
//		session.setAttribute("logvo", vo);
//
//		model.addAttribute("info", new Gson().toJson(info));
//
//		return page;
//
//	}
//
//	@RequestMapping(value="/patientDelete.do", produces="text/plain;charset=UTF-8")
//	@ResponseBody
//	public String patientDelete(@RequestParam("pat_id")int pat_id, Model model, HttpServletRequest request, HttpServletResponse response) {
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json");
//
//		System.out.println("삭제 시작");
//		System.out.println(pat_id);
//		int cnt = dao.patientDelete(pat_id);
//
//		HttpSession session = request.getSession();
//		MemberVO logvo = (MemberVO)session.getAttribute("logvo");
//		List<MemberVO> info = dao.docLogin(logvo);
//
//		System.out.print(new Gson().toJson(info));
//
//		//@ResponseBody: 직접 콘텐츠 반환
//		//참고사이트 https://araikuma.tistory.com/14
//		return  new Gson().toJson(info);
//	}
//
//	@RequestMapping("/reloadHome.do") //수정필요 데이터 검색 안됨
//	public String reloadHome(Model model, HttpServletRequest request) {
//
//		HttpSession session = request.getSession();
//		MemberVO vo=(MemberVO)session.getAttribute("logvo");
//			System.out.println(vo.getDoc_id());
//		List<MemberVO>info = dao.reloadHome(vo);
//
//		model.addAttribute("info", new Gson().toJson(info));
//		return "home";
//	}
//
//	@RequestMapping("/view.do")
//	public String view() {
//
//		return "Detailed_result";
//	}
//
//
//	/*HttpServletRequest request;
//
//	@RequestMapping("/patient_info.do")
//public String patient_info(Model model) {
//		MemberVO info = (MemberVO)request.getAttribute("info");
//
//		List<MemberVO> patlist = dao.patlist(info);
//		model.addAttribute("patlist", patlist);
//
//		return "home";
//	}*/
//
//	@RequestMapping("/detail_result.do")
//	public String  detail_result(int pat_id, Model model) {
//
//		List<PatientpointVO> info =(List<PatientpointVO>)dao.detail_result(pat_id);
//		List<PatientsVO>nameinfo= (List<PatientsVO>)pDao.name_result(pat_id);
//		String name=nameinfo.get(0).getPat_name();
//		application.setAttribute("resultinfo", info);
//		model.addAttribute("name", name);
//
//		return "Detailed_result";
//	}
//
//	@RequestMapping("/logout.do")
//	public String logout() {
//		application.removeAttribute("finalresult");
//		application.removeAttribute("patlog");
//		application.removeAttribute("logvo");
//
//		return "redirect:/loginHome.do";
//	}
//
////환자 프론트 컨트롤러
//
//
//
//}
