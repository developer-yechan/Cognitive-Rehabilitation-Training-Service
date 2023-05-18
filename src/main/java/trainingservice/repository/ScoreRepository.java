package trainingservice.repository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import trainingservice.domain.Patient;
import trainingservice.domain.Score;

import javax.persistence.EntityManager;

@Repository
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ScoreRepository {

    private final EntityManager em;

    public Patient findByPatient(Patient patient){
        return (Patient) em.createQuery("select s From score s where s.patient=:patient order by date desc limit 1")
                .setParameter("patient", patient).getSingleResult();
    }
    @Transactional
    public void save(Score score){
        em.persist(score);
    }
}
