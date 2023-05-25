package trainingservice.domain;




import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
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

    protected Patient() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;

    @JsonManagedReference
    @OneToMany(mappedBy = "patient",cascade = CascadeType.ALL)
    private List<Score> score = new ArrayList<>();

    private String name;

    private String sex;

    private int age;

    private String phoneNumber;

    private String address;

//    public void setDoctor(Doctor doctor) {
//        this.doctor = doctor;
//        doctor.getPatients().add(this);
//    }

    @Override
    public String toString() {
        return "Patient{" +
                "id=" + id +
                ", doctor=" + doctor +
                ", score=" + score +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", age=" + age +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
