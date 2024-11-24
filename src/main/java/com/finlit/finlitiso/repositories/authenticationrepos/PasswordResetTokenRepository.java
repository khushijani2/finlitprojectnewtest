package com.finlit.finlitiso.repositories.authenticationrepos;

import com.finlit.finlitiso.entity.PasswordResetToken;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PasswordResetTokenRepository extends JpaRepository<PasswordResetToken, Long>{
    Optional<PasswordResetToken> findByResetToken(String token);
    boolean existsByResetToken(String token);
}
