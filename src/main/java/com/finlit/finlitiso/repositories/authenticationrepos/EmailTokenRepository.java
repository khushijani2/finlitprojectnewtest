package com.finlit.finlitiso.repositories.authenticationrepos;

import com.finlit.finlitiso.entity.EmailToken;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmailTokenRepository extends JpaRepository<EmailToken, Long> {
    EmailToken findByRegistrationToken(String registrationToken);
}
