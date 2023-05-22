package trainingservice.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import trainingservice.domain.Doctor;
import trainingservice.domain.Patient;
import trainingservice.dto.LoginDTO;
import trainingservice.repository.DoctorRepository;
import trainingservice.repository.PatientRepository;
import trainingservice.session.SessionConst;

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

//    @GetMapping("/login")
//    public String home(){
//        log.info("환자 로그인 페이지");
//        return "loginHome2";
//    }

    @PostMapping("/login")
    public String Login(@RequestParam("pat_id") Long patientId, Model model,
                        HttpServletRequest request)
    {
        Patient patient = patientRepository.findById(patientId);
        HttpSession session = request.getSession();
        session.setAttribute(SessionConst.LOGIN_PATIENT,patient);
        return "redirect:/patient/home";

    }

    @PostMapping("/logout")
    public String Logout(HttpServletRequest request)
    {
        HttpSession session = request.getSession(false);
        if(session != null){
            session.invalidate();
        }
        return "redirect:/patient/home";
    }



    @GetMapping("/home")
    public String patientHome(HttpServletRequest request, Model model){
        HttpSession session = request.getSession(false);
        if(session == null){
            return "loginHome2";
        }
        Patient patient = (Patient) session.getAttribute(SessionConst.LOGIN_PATIENT);
        if(patient == null){
            return "loginHome2";
        }

        model.addAttribute("pat_name",patient.getName());
        return "studymain";
    }

    @PostMapping("/register")
    public String patientRegister(@Valid @ModelAttribute Patient patient, BindingResult bindingResult,
                                  @RequestParam("doctorId") String doctorEmail, Model model){
        if(bindingResult.hasErrors()){
            return "redirect:/doctor/patientRegister?doctorId=" + doctorEmail;
        }
        List<Doctor> doctor = doctorRepository.findByEmail(doctorEmail);
        patient.setDoctor(doctor.get(0));
        patientRepository.save(patient);

        return "redirect:/doctor/home";
    }

    @GetMapping("/update")
    public String patientUpdatePage(@RequestParam Long patientId,Model model){
        Patient patient = patientRepository.findById(patientId);
        model.addAttribute("patient",patient);
        System.out.println("patient = " + patient);
        return "patinfo_revise";
    }

    @PostMapping("/update")
    public String patientUpdate(@ModelAttribute Patient patient, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "patinfo_revise";
        }
         patientRepository.update(patient);

        return "redirect:/doctor/home";
    }

    @DeleteMapping("/delete")
    public String patientDelete(@RequestParam Long patientId){
        int deletedRows = patientRepository.delete(patientId);
        if(deletedRows == 0){
            throw new IllegalStateException("이미 삭제된 회원입니다.");
        }
        return "redirect:/doctor/home";
    }


}
