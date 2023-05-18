package trainingservice.repository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import trainingservice.domain.Doctor;
import trainingservice.domain.Patient;

import javax.persistence.EntityManager;
import java.util.List;

@Repository
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class PatientRepository {

    private final EntityManager em;

    public Patient findByid(Long id){
        return em.find(Patient.class, id);
    }

    public List<Patient> findByDoctor(Doctor doctor){
        return em.createQuery("select distinct p from Patient p left join fetch p.score where p.doctor=:doctor")
                .setParameter("doctor",doctor).getResultList();
    }

    @Transactional
    public void save(Patient patient){
        em.persist(patient);
    }
}
