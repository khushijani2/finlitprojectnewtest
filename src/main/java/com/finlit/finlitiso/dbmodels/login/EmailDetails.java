package com.finlit.finlitiso.dbmodels.login;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class EmailDetails {
    private String email;
    private String password;
}
