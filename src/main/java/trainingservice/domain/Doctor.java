package trainingservice.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter @Setter
public class Doctor {

    @Id
    @GeneratedValue
    private Long id;

    private String name;

    private String phoneNumber;

    private String organization;

    @Column(unique = true)
    @NotEmpty
    private String email;

    @NotEmpty
    private String password;

    @JsonManagedReference
    @OneToMany(mappedBy = "doctor")
    private List<Patient> patients = new ArrayList<>();
}
