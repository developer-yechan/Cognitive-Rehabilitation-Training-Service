package trainingservice.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter @Setter
public class Score {

    public Score() {
    }

    public Score(int totalPoint, int orientation, int memory, int calculation, int concentration, int problemSolving) {
        this.totalPoint = totalPoint;
        this.orientation = orientation;
        this.memory = memory;
        this.calculation = calculation;
        this.concentration = concentration;
        this.problemSolving = problemSolving;
    }

    @Id @GeneratedValue
    private Long id;

    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "patient_id")
    private Patient patient;

    private LocalDateTime date;

    private int totalPoint;

    private int orientation;

    private int memory;

    private int calculation;

    private int concentration;
    private int problemSolving;

    @Override
    public String toString() {
        return "Score{" +
                "id=" + id +
                ", totalPoint=" + totalPoint +
                '}';
    }
}
