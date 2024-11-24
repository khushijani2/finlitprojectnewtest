package com.finlit.finlitiso.repositories.learningrepos;

import com.finlit.finlitiso.dbmodels.learning.KeyTerm;
import com.finlit.finlitiso.dbmodels.learning.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionRepository extends JpaRepository<Question, Long> {
    List<Question> findAllByTopicId(Long topicId);

    @Query("SELECT q.questionType.points FROM Question q WHERE q.id IN :questionIds")
    List<Integer> findPointsByQuestionIds(@Param("questionIds") List<Long> questionIds);
}

