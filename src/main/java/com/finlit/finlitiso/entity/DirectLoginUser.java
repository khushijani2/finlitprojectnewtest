package com.finlit.finlitiso.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class DirectLoginUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String email;
    private String name;
    private String oauth2Id;
}
