package trainingservice.repository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import trainingservice.domain.Doctor;
import trainingservice.domain.Patient;
import trainingservice.dto.PatientSearch;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.util.List;

@Repository
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class PatientRepository {

    private final EntityManager em;

    public List<Patient> findByDoctor(Doctor doctor, PatientSearch patientSearch){
        String jpql = "select distinct p from Patient p left join fetch p.score where p.doctor=:doctor";
        //주문 상태 검색
        if (patientSearch.getId() != null) {
            jpql += " and p.id = :id";
        }
        //회원 이름 검색
        if (StringUtils.hasText(patientSearch.getName())) {
            jpql += " and p.name like :name";
        }

        if (StringUtils.hasText(patientSearch.getSex())) {
            jpql += " and p.sex = :sex";
        }

        TypedQuery<Patient> query = em.createQuery(jpql, Patient.class);
        query.setParameter("doctor",doctor);
        if (patientSearch.getId() != null) {
            query = query.setParameter("id", patientSearch.getId());
        }
        if (StringUtils.hasText(patientSearch.getName())) {
            query = query.setParameter("name", patientSearch.getName());
        }
        if (StringUtils.hasText(patientSearch.getSex())) {
            query = query.setParameter("sex", patientSearch.getSex());
        }
        return query.getResultList();
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
