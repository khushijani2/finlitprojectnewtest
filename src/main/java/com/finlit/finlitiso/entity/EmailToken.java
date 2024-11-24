package com.finlit.finlitiso.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Entity
@NoArgsConstructor
@Table(name = "tokens")
public class EmailToken {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="token_id")
    private Long tokenId;

    @Column(name="registration_token")
    private String registrationToken;

    @Column(name="login_code")
    private String loginCode;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime expirationDate;

    public EmailToken(String randomToken, LocalDateTime now) {
        this.registrationToken = randomToken;
        this.expirationDate = now.plusMinutes(20);
    }

    public boolean isExpired() {
        return (expirationDate != null && LocalDateTime.now().isAfter(expirationDate));
    }
}
