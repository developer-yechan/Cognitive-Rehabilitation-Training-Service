package trainingservice.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter @Setter
public class Doctor {

    @Id
    @GeneratedValue
    private Long id;

    private String name;

    private String phone_number;

    private String organization;

    @Column(unique = true)
    private String email;

    private String password;

    @OneToMany(mappedBy = "doctor")
    private List<Patient> patients = new ArrayList<>();
}
