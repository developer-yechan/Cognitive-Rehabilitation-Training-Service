package trainingservice.repository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import trainingservice.domain.Problem;

import javax.persistence.EntityManager;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class ProblemRepository {

    private final EntityManager em;

    public List<Problem> findAll(){
        return em.createQuery("select p from Problem p", Problem.class).getResultList();
    }
}
