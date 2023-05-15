package trainingservice.repository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import trainingservice.domain.Patient;

import javax.persistence.EntityManager;

@Repository
@RequiredArgsConstructor
public class PatientRepository {

    private final EntityManager em;

    public Patient findByid(Long id){
        return em.find(Patient.class, id);
    }
}
