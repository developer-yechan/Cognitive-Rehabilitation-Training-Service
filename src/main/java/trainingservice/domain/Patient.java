package trainingservice.domain;




import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter @Setter
public class Patient {
    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;

    @OneToMany
    @JoinColumn(name = "patient_id")
    private List<Score> score = new ArrayList<>();

    private String name;

    private Sex sex;

    private int age;

    private String phoneNumber;

    private String address;

}
