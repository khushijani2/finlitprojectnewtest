package com.finlit.finlitiso.repositories.userrepos;

import com.finlit.finlitiso.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, String> {

    @Query("select u from User u join u.emailToken e where e.registrationToken = :token")
    User findUserByEmailToken(@Param("token") String token);

    Boolean existsByEmailIgnoreCase(String email);

    Optional<User> findByEmailIgnoreCase(String email);

    Optional<User> findByCustomUsernameIgnoreCase(String email);
}