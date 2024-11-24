package com.finlit.finlitiso.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DirectLoginRequest {
    private String firstName;
    private String lastName;
    private String email;
}
