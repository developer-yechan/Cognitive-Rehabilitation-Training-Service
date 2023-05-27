package trainingservice.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import trainingservice.domain.Patient;
import trainingservice.domain.Problem;
import trainingservice.domain.Score;
import trainingservice.dto.SolvedProblem;
import trainingservice.repository.ScoreRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ScoreService {

    private final ScoreRepository scoreRepository;

    public Score saveScore(List<SolvedProblem> solvedProblems,
                           List<Problem> problems, Patient patient) {
        Score score = calculateScore(solvedProblems, problems, patient);
        scoreRepository.save(score);
        return score;
    }

    public List<Score> scorePerWeek(Patient patient){
        List<Score> scores = scoreRepository.findByPatient(patient);
        if(scores.size() == 0){
            return scores;
        }
        Score sumScore = new Score(0,0,0,0,0,0);
        for (Score score : scores) {
            sumScore.setTotalPoint(sumScore.getTotalPoint()+score.getTotalPoint());
            sumScore.setOrientation(sumScore.getOrientation()+score.getOrientation());
            sumScore.setMemory(sumScore.getMemory()+score.getMemory());
            sumScore.setCalculation(sumScore.getCalculation()+score.getCalculation());
            sumScore.setConcentration(sumScore.getConcentration()+score.getConcentration());
            sumScore.setProblemSolving(sumScore.getProblemSolving()+score.getProblemSolving());
        }
        scores.add(sumScore);
        return scores;
    }

    public Score calculateScore(List<SolvedProblem> solvedProblems,
                                List<Problem> problems, Patient patient) {
        int totalPoint = 0;
        int orientation = 0;
        int memory = 0;
        int calculation = 0;
        int concentration = 0;
        int problemSolving = 0;

        Score score = new Score();

        //반복문으로 맞춘 개수를 계산해보자
        for (int i = 0; i < solvedProblems.size(); i++) {
            if (solvedProblems.get(i).getAnswerLabel().equals(problems.get(i).getAnswerLabel())) {
                totalPoint++;
                //어느 영역 문제에서 정답인지 분기해보자
                if (solvedProblems.get(i).getCategory().equals("문제해결")) {

                    problemSolving++;

                } else if (solvedProblems.get(i).getCategory().equals("지남력")) {

                    orientation++;
                } else if (solvedProblems.get(i).getCategory().equals("계산력")) {

                    calculation++;
                } else if (solvedProblems.get(i).getCategory().equals("집중력")) {

                    concentration++;


                } else if (solvedProblems.get(i).getCategory().equals("기억력")) {

                    memory++;
                }
            } else {
                System.out.println("정답이 아닙니다.");
            }

        }
        score.setTotalPoint(totalPoint);
        score.setProblemSolving(problemSolving);
        score.setOrientation(orientation);
        score.setCalculation(calculation);
        score.setConcentration(concentration);
        score.setMemory(memory);
        score.setPatient(patient);
        String dateString = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
        LocalDateTime date = LocalDateTime.parse(dateString, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
        score.setDate(date);
        return score;
    }
}
