package kr.smhrd.myapp;

import java.util.ArrayList;
import java.util.List;

import kr.smhrd.model.PatientpointVO;

public class Allscoring {

	public List<PatientpointVO> allscore(List<PatientpointVO> allinfo){
	
	List<PatientpointVO>allist = new ArrayList();
	PatientpointVO info = new PatientpointVO();
	
	int totalpoint = 0;
	int zinam = 0;
	int giuk = 0;
	int gesan = 0;
	int zipjoon = 0;
	int moonje = 0;
	
	
	for(int i=0; i<= allinfo.size()-1;i++) {
		
		totalpoint+= allinfo.get(i).getTotalpoint();
		zinam =allinfo.get(i).getZinam();
		giuk = allinfo.get(i).getGiuk();
		gesan= allinfo.get(i).getGesan();
		zipjoon = allinfo.get(i).getZipjoon();
		moonje = allinfo.get(i).getMoonje();
		
	}
	
	info.setTotalpoint(totalpoint);
	info.setZinam(zinam);
	info.setGiuk(giuk);
	info.setGesan(gesan);
	info.setZipjoon(zipjoon);
	info.setMoonje(moonje);
	
	
	allist.add(info);
	
	
	return allist;
	}
}
