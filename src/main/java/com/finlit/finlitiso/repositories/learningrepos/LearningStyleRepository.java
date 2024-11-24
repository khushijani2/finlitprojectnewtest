package com.finlit.finlitiso.repositories.learningrepos;

import com.finlit.finlitiso.dbmodels.personalization.LearningStyleQuestion;
import com.finlit.finlitiso.dbmodels.projections.personalizationprojections.LearningStyleQuestionProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LearningStyleRepository extends JpaRepository<LearningStyleQuestion, Long> {
    @Query("SELECT new com.finlit.finlitiso.dbmodels.projections.personalizationprojections.LearningStyleQuestionProjection(lq.id, lq.question, lq.options) FROM LearningStyleQuestion lq")
    List<LearningStyleQuestionProjection> findAllQuestions();

    @Query(value = "SELECT id AS id, answers AS answers FROM learning_style_questionnaire", nativeQuery = true)
    List<Object[]> findAllIdAndAnswers();
}
