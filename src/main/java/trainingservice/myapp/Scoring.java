package trainingservice.myapp;

import java.util.ArrayList;
import java.util.List;

import trainingservice.model.AnswerVO;
import trainingservice.model.PatientpointVO;
import trainingservice.model.PatientsVO;

public class Scoring {
	
	public List<PatientpointVO> calScoring(List<AnswerVO> test, List<AnswerVO> answer, List<PatientsVO>patlog) {
		System.out.println("계산시작");
	
		
		
		
		int total = 0; //총점
		int ginam = 0; //지남
		int remember = 0; //기억
		int calculate = 0; //계산
		int zipzoom = 0; //집중
		int solve = 0; //문제해결
		
		
		List<PatientpointVO>list = new ArrayList();
		PatientpointVO vo = new PatientpointVO();
		
		
		
		
		
		for(int i=0 ; i <=9;i++) {
		System.out.println("테스트 정답: "+test.get(i).getAns_correct());
		System.out.println("정답: "+answer.get(i).getAns_label());
		
		}
		
		//반복문으로 맞춘 개수를 계산해보자
		for (int i = 0; i < test.size(); i++) {
			if(test.get(i).getAns_correct().equals(answer.get(i).getAns_label())) {
				total++;
				System.out.println(test.get(i).getAns_category());
				//어느 영역 문제에서 정답인지 분기해보자
			if(test.get(i).getAns_category().equals("문제해결")){
				
				solve++;
				
			}
			else if(test.get(i).getAns_category().equals("지남력")){
				
				ginam++;
			}
			else if(test.get(i).getAns_category().equals("계산력")) {
				
				calculate++;
			}
			else if(test.get(i).getAns_category().equals("집중력")) {
				
				zipzoom++;
				
				
			}
			else if(test.get(i).getAns_category().equals("기억력")) {
				
				remember++;
			}
			
			}
			else {
				System.out.println("정답이 아닙니다.");
			}
			vo.setTotalpoint(total);
			vo.setMoonje(solve);
			vo.setZinam(ginam);
			vo.setGesan(calculate);
			vo.setZipjoon(zipzoom);
			vo.setGiuk(remember);
			vo.setPat_id(patlog.get(0).getPat_id());
			list.add(vo);
		}
		
		
		
		
		
		return list;
	}
}
