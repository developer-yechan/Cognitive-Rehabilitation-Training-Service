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

    // 로그인 비즈니스 로직(등록된 사용자 인지?, 입력한 비밀번호가 db에 저장된 비밀번호와 일치하는 지 확인)
    public Doctor login(String email, String password){
        List<Doctor> doctor = doctorRepository.findByEmail(email);

        if(doctor.size() == 0 || !password.equals(doctor.get(0).getPassword())){
            return null;
        }
        return doctor.get(0);
    }
}
