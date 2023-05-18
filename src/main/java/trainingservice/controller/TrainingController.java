package trainingservice.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import trainingservice.domain.Patient;
import trainingservice.domain.Problem;
import trainingservice.domain.Score;
import trainingservice.dto.SolvedProblem;
import trainingservice.repository.ProblemRepository;
import trainingservice.service.ScoreService;
import trainingservice.session.SessionConst;

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
    private final ScoreService scoreService;
    private final ServletContext application;

    @GetMapping
    public String moveToTrain(Model model) {
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
            System.out.println("solvedProblems.size() = " + solvedProblems.size());
            System.out.println("problem = " + problem);
            solvedProblem.setNumber(problem.getNumber());
            solvedProblem.setCategory(problem.getCategory());
            solvedProblem.setRound(problem.getRound());
            solvedProblem.setAnswerLabel(result);
            solvedProblems.add(solvedProblem);
        }

        // 이미 푼 문제가 제공된 문제 개수 이상인 경우 return
        if(solvedProblems.size() >= problems.size()){
            return "redirect:/train/score";
        }
        application.setAttribute("solvedProblems", solvedProblems);
        Problem nextProblem = problems.get(solvedProblems.size());
        model.addAttribute("problem", nextProblem);
        return "study";
    }


    @GetMapping("/score")
    public String moveToScore(HttpServletRequest request,Model model){
        HttpSession session = request.getSession(false);
        Patient patient = (Patient) session.getAttribute(SessionConst.LOGIN_PATIENT);
        List<SolvedProblem> solvedProblems = (List<SolvedProblem>) application.getAttribute("solvedProblems");
        List<Problem> problems = (List<Problem>) application.getAttribute("problems");
        Score score = scoreService.saveScore(solvedProblems, problems, patient);
        model.addAttribute("score",score);
        return "score";
    }

}