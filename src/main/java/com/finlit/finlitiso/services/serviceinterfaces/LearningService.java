package com.finlit.finlitiso.services.serviceinterfaces;

import com.finlit.finlitiso.dbmodels.learning.LearningTopic;
import com.finlit.finlitiso.dbmodels.learning.Topic;
import com.finlit.finlitiso.dbmodels.projections.learningprojections.TopicProgressProjection;
import com.finlit.finlitiso.dbmodels.projections.learningprojections.TopicProjection;
import com.finlit.finlitiso.entity.User;
import com.finlit.finlitiso.exceptions.CustomException;
import com.finlit.finlitiso.utils.FinlitConstants;
import jakarta.servlet.http.HttpServletRequest;

import java.util.List;

public interface LearningService {
    List<TopicProjection> getAllQuizNames(String quiz_level);
    List<TopicProjection> getTopicsInQuiz(Long quiz_id);
    List<Topic> getTopics(Long quiz_id);

    String canAttemptQuiz(HttpServletRequest request, Long quizId);
    void loseCash(HttpServletRequest request, Long topicId, Integer numOfIncorrectQuestions);
    void updateSolvedQuestions(HttpServletRequest request, List<Long> questionIds);
    List<TopicProgressProjection> getUserTopicProgress(HttpServletRequest request, Long quizId);
}
