package trainingservice.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import trainingservice.domain.Doctor;
import trainingservice.repository.DoctorRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class LoginService {
    private final DoctorRepository doctorRepository;

    public Doctor login(String email, String password){
        List<Doctor> doctor = doctorRepository.findByEmail(email);
        if(doctor.size() == 0){
            throw new IllegalStateException("등록되지 않은 사용자 입니다.");
        }
        if(!password.equals(doctor.get(0).getPassword())){
            throw new IllegalArgumentException("잘못된 비밀번호를 입력했습니다.");
        }
        return doctor.get(0);
    }
}
