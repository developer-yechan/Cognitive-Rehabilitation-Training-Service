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
import trainingservice.web.session.SessionConst;
import trainingservice.web.argumentresolver.Login;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
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

    // 회원가입 페이지 렌더링 요청
    @GetMapping("/signup")
    public String MoveToSignUp(Model model){
        Doctor doctor = new Doctor();
        model.addAttribute("doctor",doctor);
        return "docRegister2";
    }


    //작업치료사 메인페이지 렌더링 요청
    @GetMapping("/home")
    public String LoginHome(@ModelAttribute PatientSearch patientSearch, BindingResult bindingResult,
                            @Login Doctor doctor, Model model) throws JsonProcessingException {

        if(bindingResult.hasErrors()){
            return "home";
        }
        if(doctor == null){
            return "loginHome2";
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

    // 작업치료사 회원가입 리소스 저장 요청
    @PostMapping("/signup")
    public String signUp(@Valid @ModelAttribute Doctor doctor, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "docRegister2";
        }

        List<Doctor> isDoctor = doctorRepository.findByEmail(doctor.getEmail());
        if(isDoctor.size() > 0){
            throw new IllegalStateException("이미 사용중인 이메일입니다.");
        }
        doctorRepository.save(doctor);

        return "redirect:/login";
    }
    // 작업치료사 로그인 요청
    @PostMapping("/login")
    public String Login(@Valid @ModelAttribute("loginDto") LoginDTO loginDto, BindingResult bindingResult,
                        Model model, HttpServletRequest request){
        if(bindingResult.hasErrors()){
            return "loginHome2";
        }
        Doctor doctor = loginService.login(loginDto.getEmail(), loginDto.getPassword());

        if(doctor == null){
            bindingResult.reject("loginFail","아이디 또는 비밀번호가 맞지 않습니다.");
            return "loginHome2";
        }
        HttpSession session = request.getSession();
        session.setAttribute(SessionConst.LOGIN_DOCTOR,doctor);

        return "redirect:/doctor/home";

    }



}
