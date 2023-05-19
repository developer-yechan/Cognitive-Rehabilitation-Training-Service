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
                "date=" + date +
                '}';
    }
}
