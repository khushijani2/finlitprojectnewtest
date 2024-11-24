package com.finlit.finlitiso.repositories.learningrepos;

import com.finlit.finlitiso.dbmodels.learning.Quiz;
import com.finlit.finlitiso.dbmodels.learning.QuizLevel;
import com.finlit.finlitiso.dbmodels.projections.learningprojections.TopicProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuizRepository extends JpaRepository<Quiz, Long> {
    @Query("SELECT q.id AS id, q.category AS title FROM Quiz q WHERE q.quizLevel = :quiz_level")
    List<TopicProjection> findAllByQuizLevel(@Param("quiz_level") QuizLevel quiz_level);
}
