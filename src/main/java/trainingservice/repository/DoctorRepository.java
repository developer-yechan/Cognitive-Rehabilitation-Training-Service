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
public class DoctorRepository {

    private final EntityManager em;

    @Transactional
    public void save(Doctor doctor){
        em.persist(doctor);
    }

    public List<Doctor> findByEmail(String email){
        return em.createQuery("select d from Doctor d where d.email = :email")
                .setParameter("email",email).getResultList();
    }
}
