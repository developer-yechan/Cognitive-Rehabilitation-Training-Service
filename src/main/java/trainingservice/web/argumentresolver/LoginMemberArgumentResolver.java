package trainingservice.web.argumentresolver;

import lombok.extern.slf4j.Slf4j;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import trainingservice.domain.Doctor;
import trainingservice.domain.Patient;
import trainingservice.web.session.SessionConst;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
public class LoginMemberArgumentResolver implements HandlerMethodArgumentResolver {

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        boolean hasLoginAnnotation = parameter.hasParameterAnnotation(Login.class);
        boolean hasMemberType = false;
        if(Patient.class.isAssignableFrom(parameter.getParameterType()) || Doctor.class.isAssignableFrom(parameter.getParameterType())){
            hasMemberType = true;
        }
        return hasLoginAnnotation && hasMemberType;
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
                                  NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
        HttpSession session = request.getSession(false);
        Object member = null;
        if(session.getAttribute(SessionConst.LOGIN_PATIENT) != null){
            member = session.getAttribute(SessionConst.LOGIN_PATIENT);
        }else if(session.getAttribute(SessionConst.LOGIN_DOCTOR) != null){
            member = session.getAttribute(SessionConst.LOGIN_DOCTOR);
        }
        return member;
    }
}
