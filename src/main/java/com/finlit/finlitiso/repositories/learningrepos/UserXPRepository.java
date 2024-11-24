package com.finlit.finlitiso.repositories.learningrepos;

import com.finlit.finlitiso.dbmodels.learning.UserXP;
import com.finlit.finlitiso.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserXPRepository extends JpaRepository<UserXP, Long> {

    Optional<UserXP> findById_User(User user);

}
