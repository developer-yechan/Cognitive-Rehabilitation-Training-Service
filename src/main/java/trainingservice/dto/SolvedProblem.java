package trainingservice.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class SolvedProblem {

    private int number;

    private int round;
    private String answerLabel;

    private String category;

    @Override
    public String toString() {
        return "SolvedProblem{" +
                "number=" + number +
                ", round=" + round +
                ", answerLabel='" + answerLabel + '\'' +
                ", category='" + category + '\'' +
                '}';
    }

    public SolvedProblem() {
    }
}
