package trainingservice.controller;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import trainingservice.domain.Doctor;
import trainingservice.domain.Patient;
import trainingservice.domain.Problem;
import trainingservice.domain.Score;
import trainingservice.dto.SolvedProblem;
import trainingservice.repository.PatientRepository;
import trainingservice.repository.ProblemRepository;
import trainingservice.repository.ScoreRepository;
import trainingservice.service.ScoreService;
import trainingservice.session.SessionConst;
import trainingservice.web.argumentresolver.Login;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/train")
public class TrainingController {

    private final ProblemRepository problemRepository;

    private final PatientRepository patientRepository;
    private final ScoreRepository scoreRepository;
    private final ScoreService scoreService;
    private final ServletContext application;

    @GetMapping
    public String moveToTrain(@Login Patient patient, Model model) {
        List<Score> todayResult = scoreRepository.findTodayResultByPatient(patient);
        if (todayResult.size() > 0){
            return "redirect:/patient/home";
        }
        List<Problem> problems = problemRepository.findAll();
        List<SolvedProblem> solvedProblems = new ArrayList<>();
        application.setAttribute("problems", problems);
        application.setAttribute("solvedProblems", solvedProblems);
        model.addAttribute("problem", problems.get(0));
        return "study";
    }

    @GetMapping("/nextProblem")
    public String moveToNextProblem(@RequestParam("result") String result, Model model) {
        List<SolvedProblem> solvedProblems = (List<SolvedProblem>) application.getAttribute("solvedProblems");
        List<Problem> problems = (List<Problem>) application.getAttribute("problems");
        SolvedProblem solvedProblem = new SolvedProblem();

        //첫 문제 풀고 다음 버튼 눌렀을 때
        if (solvedProblems.size() == 0) {
            Problem problem = problems.get(0);
            solvedProblem.setNumber(problem.getNumber());
            solvedProblem.setCategory(problem.getCategory());
            solvedProblem.setRound(problem.getRound());
            solvedProblem.setAnswerLabel(result);
            solvedProblems.add(solvedProblem);
            //두번째 문제부터
        } else if (solvedProblems.size() < problems.size()) {
            Problem problem = problems.get(solvedProblems.size());
            solvedProblem.setNumber(problem.getNumber());
            solvedProblem.setCategory(problem.getCategory());
            solvedProblem.setRound(problem.getRound());
            solvedProblem.setAnswerLabel(result);
            solvedProblems.add(solvedProblem);
        }

        Problem nextProblem = problems.get(solvedProblems.size());
        model.addAttribute("problem", nextProblem);
        return "study";
    }

@PostMapping("/score")
public String saveScore(@RequestParam("result") String result, @Login Patient patient,Model model){
    List<SolvedProblem> solvedProblems = (List<SolvedProblem>) application.getAttribute("solvedProblems");
    List<Problem> problems = (List<Problem>) application.getAttribute("problems");
    SolvedProblem solvedProblem = new SolvedProblem();
    Problem problem = problems.get(solvedProblems.size());
    solvedProblem.setNumber(problem.getNumber());
    solvedProblem.setCategory(problem.getCategory());
    solvedProblem.setRound(problem.getRound());
    solvedProblem.setAnswerLabel(result);
    solvedProblems.add(solvedProblem);
    Score score = scoreService.saveScore(solvedProblems, problems, patient);
    return "redirect:/train/score";
}

    @GetMapping("/score")
    public String moveToScore(@Login Patient patient,Model model){
        List<Score> todayScore = scoreRepository.findTodayResultByPatient(patient);
        if(todayScore.size() == 0){
            model.addAttribute("patientName",patient.getName());
            return "test";
        }
        model.addAttribute("score",todayScore.get(0));
        return "score";
    }

    @GetMapping("/score/statistics")
    public String moveToStatistics(@Login Patient patient, Model model) {
            List<Score> scores = scoreService.scorePerWeek(patient);
            if(scores.size() ==0){
                model.addAttribute("patientName",patient.getName());
                return "test";
            }
            model.addAttribute("scores",scores);
            application.setAttribute("scores",scores);

            return "result2";
        }
    @GetMapping("/doctor/confirm")
    public String moveToDoctorConfirm(@RequestParam Long patientId, HttpServletRequest request, Model model){
        Patient patient = patientRepository.findById(patientId);
        List<Score> scores = scoreService.scorePerWeek(patient);
        if(scores.size() ==0){
            model.addAttribute("patientName",patient.getName());
            return "test";
        }
        model.addAttribute("scores",scores);
        model.addAttribute("patientName",patient.getName());
        application.setAttribute("scores",scores);
        return "Detailed_result";
    }
}