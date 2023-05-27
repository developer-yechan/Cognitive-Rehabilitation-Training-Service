package trainingservice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import trainingservice.dto.LoginDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    // 로그인 페이지 렌더링 요청
    @GetMapping("/login")
    public String home(Model model){
        LoginDTO loginDTO = new LoginDTO();
        model.addAttribute("loginDto",loginDTO);
        return "loginHome2";
    }

    // 로그아웃 요청
    @PostMapping("/logout")
    public String Logout(HttpServletRequest request)
    {
        HttpSession session = request.getSession(false);
        if(session != null){
            session.invalidate();
        }
        return "redirect:/login";
    }
}
