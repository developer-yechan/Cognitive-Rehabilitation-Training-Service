package trainingservice.domain;

import lombok.Getter;
import lombok.Setter;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Getter @Setter
public class Problem {

    @Id @GeneratedValue
    private Long id;

    private String answer;

    private String answerLabel;

    private int round;

    private int number;

    private String content;

    private String imagePath;

    private String soundPath;

    private String category;

}