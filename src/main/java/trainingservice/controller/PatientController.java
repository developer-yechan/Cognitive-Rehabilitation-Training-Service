package trainingservice.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import trainingservice.domain.Doctor;
import trainingservice.domain.Patient;
import trainingservice.repository.DoctorRepository;
import trainingservice.repository.PatientRepository;
import trainingservice.web.session.SessionConst;
import trainingservice.web.argumentresolver.Login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/patient")
public class PatientController {

    private final PatientRepository patientRepository;

    private final DoctorRepository doctorRepository;

    //환자 로그인 요청
    @PostMapping("/login")
    public String Login(@RequestParam("pat_id") Long patientId, Model model,
                        HttpServletRequest request)
    {
        Patient patient = patientRepository.findById(patientId);
        HttpSession session = request.getSession();
        session.setAttribute(SessionConst.LOGIN_PATIENT,patient);
        return "redirect:/patient/home";

    }
    
    //환자 메인 페이지 요청
    @GetMapping("/home")
    public String patientHome(@Login Patient patient, Model model){

        if(patient == null){
            return "loginHome2";
        }

        model.addAttribute("pat_name",patient.getName());
        return "studymain";
    }

    // 환자 회원 등록 페이지 렌더링 요청
    @GetMapping("/register")
    public String moveToRegister(Model model) {
        Patient patient = new Patient();
        model.addAttribute(patient);
        return "patRegister";
    }

    // 환자 리소스 저장 요청
    @PostMapping("/register")
    public String patientRegister(@Valid @ModelAttribute Patient patient, BindingResult bindingResult,
                                  @RequestParam("doctorId") String doctorEmail, Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("doctorId",doctorEmail);
            return "patRegister";
        }
        List<Doctor> doctor = doctorRepository.findByEmail(doctorEmail);
        patient.setDoctor(doctor.get(0));
        patientRepository.save(patient);

        return "redirect:/doctor/home";
    }
    // 환자 정보 수정 페이지 렌더링 요청
    @GetMapping("/update")
    public String patientUpdatePage(@RequestParam Long patientId,Model model){
        Patient patient = patientRepository.findById(patientId);
        model.addAttribute("patient",patient);
        return "patinfo_revise";
    }

    // 환자 리소스 수정 요청
    @PostMapping("/update")
    public String patientUpdate(@Valid @ModelAttribute Patient patient, BindingResult bindingResult,Model model){
        patient.setDoctor(patientRepository.findById(patient.getId()).getDoctor());
        model.addAttribute("patient",patient);
        if(bindingResult.hasErrors()){
            return "patinfo_revise";
        }
         patientRepository.update(patient);

        return "redirect:/doctor/home";
    }

    // 환자 리소스 삭제 요청
    @DeleteMapping("/delete")
    public String patientDelete(@RequestParam Long patientId){
        int deletedRows = patientRepository.delete(patientId);
        if(deletedRows == 0){
            throw new IllegalStateException("이미 삭제된 회원입니다.");
        }
        return "redirect:/doctor/home";
    }


}
