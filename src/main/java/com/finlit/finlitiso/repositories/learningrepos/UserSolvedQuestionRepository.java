package com.finlit.finlitiso.repositories.learningrepos;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserSolvedQuestionRepository {
    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public void insertUserSolvedQuestionsBatch(Long userId, List<Long> questionIds) {
        StringBuilder sb = new StringBuilder("INSERT INTO user_solved_questions (user_id, question_id, solved_at) VALUES ");
        for (int i = 0; i < questionIds.size(); i++) {
            sb.append("(").append(userId).append(", ").append(questionIds.get(i)).append(", CURRENT_TIMESTAMP)");
            if (i < questionIds.size() - 1) {
                sb.append(", ");
            }
        }
        Query query = entityManager.createNativeQuery(sb.toString());
        query.executeUpdate();
    }
}
