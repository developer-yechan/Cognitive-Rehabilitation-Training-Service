package trainingservice.repository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import trainingservice.domain.Doctor;
import trainingservice.domain.Patient;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.util.List;

@Repository
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class PatientRepository {

    private final EntityManager em;

    public List<Patient> findByDoctor(Doctor doctor){
        return em.createQuery("select distinct p from Patient p left join fetch p.score where p.doctor=:doctor")
                .setParameter("doctor",doctor).getResultList();
    }

    public Patient findById(Long patientId){
        return em.find(Patient.class,patientId);

    }

    @Transactional
    public void save(Patient patient){
        em.persist(patient);
    }

    @Transactional
    public void update(Patient patient){
        Patient findPatient = em.find(Patient.class, patient.getId());
        System.out.println("findPatient = " + findPatient);

        if(findPatient == null){
            throw new IllegalStateException("존재하지 않는 회원입니다.");
        }
        findPatient.setAge(patient.getAge());
        findPatient.setSex(patient.getSex());
        findPatient.setName(patient.getName());
        findPatient.setPhoneNumber(patient.getPhoneNumber());
        findPatient.setAddress(patient.getAddress());
    }

    @Transactional
    public int delete(Long patientId){
       Query query = em.createQuery("delete from Patient p where p.id = :patientId")
                .setParameter("patientId", patientId);
        int rows = query.executeUpdate();
        return rows;
    }
}
