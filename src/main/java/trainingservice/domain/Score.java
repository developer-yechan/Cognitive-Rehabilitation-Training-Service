package trainingservice.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Entity
@Getter @Setter
public class Score {
    @Id @GeneratedValue
    private Long id;

    private LocalDateTime date;

    private int totalPoint;

    private int orientation;

    private int memory;

    private int calculation;

    private int concentration;
    private int problemSolving;

}
