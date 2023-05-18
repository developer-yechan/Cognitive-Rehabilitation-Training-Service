package trainingservice.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;

@Getter @Setter
public class LoginDTO {
    @NotEmpty
    private String email;
    @NotEmpty
    private String password;
}
