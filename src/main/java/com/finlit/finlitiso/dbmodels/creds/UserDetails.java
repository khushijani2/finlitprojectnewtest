package com.finlit.finlitiso.dbmodels.creds;

import lombok.Data;

@Data
public class UserDetails {
    private String firstname;
    private String lastname;
    private String email;
    private String username;
    private String phonenumber;
}
