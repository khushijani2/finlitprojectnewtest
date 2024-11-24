package com.finlit.finlitiso.repositories.userrepos;

import com.finlit.finlitiso.dbmodels.personalization.PersonalizationQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PersonalizationQuestionRepository extends JpaRepository<PersonalizationQuestion, Long> {
    @Query(value = "(SELECT * FROM personalization_question_bank WHERE difficulty_level = 'easy' ORDER BY RAND() LIMIT 5) " +
            "UNION " +
            "(SELECT * FROM personalization_question_bank WHERE difficulty_level = 'intermediate' ORDER BY RAND() LIMIT 5) " +
            "UNION " +
            "(SELECT * FROM personalization_question_bank WHERE difficulty_level = 'advanced' ORDER BY RAND() LIMIT 5)",
            nativeQuery = true)
    List<PersonalizationQuestion> findRandomQuestions();
}
