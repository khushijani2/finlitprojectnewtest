package com.finlit.finlitiso.repositories.learningrepos;

import com.finlit.finlitiso.dbmodels.learning.Topic;
import com.finlit.finlitiso.dbmodels.projections.learningprojections.TopicProjection;
import com.finlit.finlitiso.dbmodels.projections.learningprojections.TopicQuestionCountProjection;
import com.finlit.finlitiso.dbmodels.projections.learningprojections.TopicSolvedQuestionCountProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TopicRepository extends JpaRepository<Topic, Long> {
    @Query("SELECT t.id AS id, t.title AS title FROM Topic t WHERE t.quiz.id = :quiz_id")
    List<TopicProjection> findAllByQuizId(@Param("quiz_id") Long quiz_id);

    @Query("SELECT t.id AS id, t.title AS title, COUNT(q.id) AS questionCount " +
            "FROM Topic t LEFT JOIN t.questions q " +
            "WHERE t.quiz.id = :quiz_id GROUP BY t.id")
    List<TopicQuestionCountProjection> findAllWithQuestionCountByQuizId(@Param("quiz_id") Long quiz_id);

    @Query("SELECT t.id AS topicId, COUNT(usq.id) AS solvedQuestionCount " +
            "FROM Topic t JOIN t.questions q LEFT JOIN UserSolvedQuestion usq " +
            "ON usq.question.id = q.id AND usq.user.id = :userId WHERE t.quiz.id = :quizId GROUP BY t.id")
    List<TopicSolvedQuestionCountProjection> findSolvedQuestionCountByUserAndQuiz(@Param("userId") Long userId, @Param("quizId") Long quizId);

}

