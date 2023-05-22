package trainingservice.controller;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import trainingservice.domain.Doctor;
import trainingservice.domain.Patient;
import trainingservice.domain.Score;
import trainingservice.dto.LoginDTO;
import trainingservice.dto.PatientSearch;
import trainingservice.repository.DoctorRepository;
import trainingservice.repository.PatientRepository;
import trainingservice.repository.ScoreRepository;
import trainingservice.service.LoginService;
import trainingservice.session.SessionConst;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/doctor")
public class DoctorController {

    private final LoginService loginService;
    private final DoctorRepository doctorRepository;
    
    private final PatientRepository patientRepository;

    private final ScoreRepository scoreRepository;

    @GetMapping("/signup")
    public String MoveToSignUp(){
        return "docRegister2";
    }


    @GetMapping("/home")
    public String LoginHome(@ModelAttribute PatientSearch patientSearch, HttpServletRequest request, Model model) throws JsonProcessingException {
        HttpSession session = request.getSession(false);
        if( session == null){
            return "loginHome2";
        }
        Doctor doctor = (Doctor) session.getAttribute(SessionConst.LOGIN_DOCTOR);

        if(doctor == null){
            return "loginHome";
        }

        List<Patient> patients = patientRepository.findByDoctor(doctor,patientSearch);

        patients.stream().forEach(patient ->{
            if(patient.getScore() != null){
                patient.getScore().sort(Comparator.comparing(Score::getDate).reversed());
            }
        });

        ObjectMapper jsonMapper = new ObjectMapper();
        jsonMapper.setSerializationInclusion(JsonInclude.Include.ALWAYS);
        String patientsJson = jsonMapper.writeValueAsString(patients);
        model.addAttribute("doctorEmail",doctor.getEmail());
        model.addAttribute("patients", patientsJson);

        return "home";
    }

    @PostMapping("/signup")
    public String signUp(@Valid @ModelAttribute Doctor doctor, BindingResult bindingResult){
        log.info("회원가입 컨트롤러");
        if(bindingResult.hasErrors()){
            log.info("바인딩 에러");
            return "docRegister2";
        }

        List<Doctor> isDoctor = doctorRepository.findByEmail(doctor.getEmail());
        if(isDoctor.size() > 0){
            throw new IllegalStateException("이미 사용중인 이메일입니다.");
        }
        doctorRepository.save(doctor);

        return "redirect:/doctor/login";
    }

    @PostMapping("/login")
    public String Login(@Valid @ModelAttribute("loginDto") LoginDTO loginDto, BindingResult bindingResult,
                        Model model, HttpServletRequest request){

        if(bindingResult.hasErrors()){
            return "loginHome2";
        }

        Doctor doctor = loginService.login(loginDto.getEmail(), loginDto.getPassword());
        HttpSession session = request.getSession();
        session.setAttribute(SessionConst.LOGIN_DOCTOR,doctor);

        return "redirect:/doctor/home";

    }

    @PostMapping("/logout")
    public String Logout(HttpServletRequest request)
    {
        HttpSession session = request.getSession(false);
        if(session != null){
            session.invalidate();
        }
        return "redirect:/doctor/home";
    }

    @GetMapping("/patientRegister")
    public String moveToRegister() {

        return"patRegister";
    }


}
