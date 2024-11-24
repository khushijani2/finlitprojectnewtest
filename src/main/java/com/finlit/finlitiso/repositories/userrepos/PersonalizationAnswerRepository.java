package com.finlit.finlitiso.repositories.userrepos;

import com.finlit.finlitiso.dbmodels.personalization.PersonalizationAnswer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonalizationAnswerRepository extends JpaRepository<PersonalizationAnswer, Long> {
}

