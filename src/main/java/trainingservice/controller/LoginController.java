package trainingservice.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import trainingservice.domain.Patient;
import trainingservice.repository.PatientRepository;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/home")
public class LoginController {

    private final PatientRepository patientRepository;

    @GetMapping
    public String home(){
        log.info("환자 로그인 페이지");
        return "loginHome2";
    }

    @GetMapping("/patient")
    public String patientHome(@RequestParam("pat_id") Long patientId, Model model){
        Patient patient = patientRepository.findByid(patientId);
        log.info("patient = {}",patient);
        log.info("patient name = {}",patient.getName());
        model.addAttribute("pat_name",patient.getName());
        return "studymain";
    }
}
