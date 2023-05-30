package trainingservice.repository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import trainingservice.domain.Patient;
import trainingservice.domain.Score;

import javax.persistence.EntityManager;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ScoreRepository {

    private final EntityManager em;

    public List<Score> findByPatient(Patient patient){
        return em.createQuery("select s From Score s where s.patient=:patient and s.date >= :referenceDate order by s.date desc")
                .setParameter("patient", patient)
                .setParameter("referenceDate",LocalDateTime.now().minusDays(7))
                .getResultList();
    }

    public List<Score> findTodayResultByPatient(Patient patient){
        return em.createQuery("select s From Score s where s.patient=:patient and s.date between :startDate and :endDate")
                .setParameter("patient", patient)
                .setParameter("startDate", LocalDateTime.now().minusDays(1))
                .setParameter("endDate", LocalDateTime.now().now())
                .getResultList();
    }


    @Transactional
    public void save(Score score){
        em.persist(score);
    }
}
