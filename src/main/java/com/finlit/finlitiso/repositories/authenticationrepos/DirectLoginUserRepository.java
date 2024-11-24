package com.finlit.finlitiso.repositories.authenticationrepos;

import com.finlit.finlitiso.entity.DirectLoginUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DirectLoginUserRepository extends JpaRepository<DirectLoginUser, Long> {
    DirectLoginUser findByEmail(String email);
    DirectLoginUser findByOauth2Id(String oauth2Id);
}
