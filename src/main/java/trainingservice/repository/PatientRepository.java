package trainingservice.repository;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.core.types.dsl.SimpleTemplate;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import trainingservice.domain.Doctor;
import trainingservice.domain.Patient;
import trainingservice.domain.QPatient;
import trainingservice.dto.PatientSearch;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.util.List;

import static trainingservice.domain.QPatient.*;

@Repository
@Transactional(readOnly = true)
public class PatientRepository {

    private final EntityManager em;
    private final JPAQueryFactory query;

    public PatientRepository(EntityManager em){
        this.em = em;
        this.query = new JPAQueryFactory(em);
    }

    public List<Patient> findByDoctor(Doctor doctor, PatientSearch patientSearch){

        Long id = patientSearch.getId();
        String name = patientSearch.getName();
        String sex = patientSearch.getSex();

        List<Patient> result = query
                                .selectFrom(patient).distinct()
                                .leftJoin(patient.score).fetchJoin()
                                .where(patient.doctor.eq(doctor), equalId(id), likeName(name), equalSex(sex))
                                .fetch();

        return result;
    }

    private BooleanExpression equalId(Long id) {
        if(id != null){
            return patient.id.eq(id);
        }
        return null;
    }

    private BooleanExpression equalSex(String sex) {
        if(StringUtils.hasText(sex)){
            return patient.sex.eq(sex);
        }
        return null;
    }

    private BooleanExpression likeName(String name) {
        if(StringUtils.hasText(name)){
            return patient.name.like("%" + name + "%");
        }
        return null;
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
