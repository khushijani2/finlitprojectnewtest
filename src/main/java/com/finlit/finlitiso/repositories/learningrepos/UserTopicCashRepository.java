package com.finlit.finlitiso.repositories.learningrepos;

import com.finlit.finlitiso.dbmodels.learning.UserTopicCash;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface UserTopicCashRepository extends JpaRepository<UserTopicCash, Long> {

    @Query("SELECT COUNT(c) FROM UserTopicCash c WHERE c.user.id = :userId AND c.quiz.id = :quizId")
    long countByUserIdAndQuizId(@Param("userId") Long userId, @Param("quizId") Long quizId);

    @Query("SELECT c FROM UserTopicCash c WHERE c.user.id = :userId AND c.quiz.id = :quizId AND c.lossTime < :time")
    List<UserTopicCash> findAllByUserIdAndQuizIdAndLossTimeBefore(@Param("userId") Long userId, @Param("quizId") Long quizId, @Param("time") LocalDateTime time);
}
