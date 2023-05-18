package trainingservice.session;

import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

@Component
public class SessionConst {

    public static final String LOGIN_DOCTOR = "loginDoctor";
    public static final String LOGIN_PATIENT = "loginPatient";

}
