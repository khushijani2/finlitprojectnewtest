package com.finlit.finlitiso.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Entity
@NoArgsConstructor
@Table(name = "password_reset_tokens")
public class PasswordResetToken {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reset_token_id;

    @Column(name = "reset_token")
    private String resetToken;

    @OneToOne(targetEntity = User.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(nullable = false, name = "user_id")
    private User user;

    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime expirationDate;

    public PasswordResetToken(String resetToken, LocalDateTime now) {
        this.resetToken = resetToken;
        this.expirationDate = now.plusMinutes(20);
    }

    public boolean isExpired() {
        return (expirationDate != null && LocalDateTime.now().isAfter(expirationDate));
    }
}
