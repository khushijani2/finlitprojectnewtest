package com.finlit.finlitiso.security.dto.request;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RegisterRequest {

    @NotEmpty
    @Size(min = 2, message = "First name should have at least 2 characters")
    private String firstName;

    @NotEmpty
    @Size(min = 2, message = "Last name should have at least 2 characters")
    private String lastName;

    @NotEmpty
    @Email
    private String email;

    @NotEmpty
    @Size(min = 8, message = "password should have at least 8 characters")
    private String password;

}
