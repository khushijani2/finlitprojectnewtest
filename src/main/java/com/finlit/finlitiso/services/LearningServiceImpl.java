package com.finlit.finlitiso.services;

import com.finlit.finlitiso.dbmodels.learning.*;

import com.finlit.finlitiso.dbmodels.projections.learningprojections.TopicProgressProjection;
import com.finlit.finlitiso.dbmodels.projections.learningprojections.TopicProjection;
import com.finlit.finlitiso.dbmodels.projections.learningprojections.TopicQuestionCountProjection;
import com.finlit.finlitiso.dbmodels.projections.learningprojections.TopicSolvedQuestionCountProjection;
import com.finlit.finlitiso.entity.User;
import com.finlit.finlitiso.exceptions.CustomException;
import com.finlit.finlitiso.repositories.learningrepos.*;
import com.finlit.finlitiso.security.services.JWTService;
import com.finlit.finlitiso.services.serviceinterfaces.LearningService;
import com.finlit.finlitiso.utils.CustomSecurityUtil;
import com.finlit.finlitiso.utils.FinlitConstants;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class LearningServiceImpl implements LearningService {

    @Autowired
    private JWTService jwtService;

    @Autowired
    private CustomSecurityUtil customSecurityUtil;

    @Autowired
    private QuizRepository quizRepository;

    @Autowired
    private LearningRepository learningRepository;

    @Autowired
    private TopicRepository topicRepository;

    @Autowired
    private ExampleRepository exampleRepository;

    @Autowired
    private KeyTermRepository keyTermRepository;

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private OptionRepository optionRepository;

    @Autowired
    private UserSolvedQuestionRepository userSolvedQuestionRepository;

    @Autowired
    private UserTopicCashRepository userTopicCashRepository;

    @Autowired
    private UserXPRepository userXPRepository;










    @Override
    public List<TopicProjection> getAllQuizNames(String quiz_level) {
        return getQuizList(quiz_level);
    }

    @Override
    public List<TopicProjection> getTopicsInQuiz(Long quiz_id) {
        return getTopicsList(quiz_id);
    }

    @Override
    public List<Topic> getTopics(Long quizId) {

        try {
            return getTopicsList(quizId).stream()
                    .map(topicProjection -> {
                        Topic topic = new Topic();
                        topic.setId(topicProjection.getId());
                        topic.setTitle(topicProjection.getTitle());

                        topic.setExamples(getExamples(topicProjection.getId()));
                        topic.setKeyTerms(getKeyTerms(topicProjection.getId()));
                        topic.setQuestions(getQuestions(topicProjection.getId()));

                        return topic;
                    })
                    .collect(Collectors.toList());
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
    }

    private List<TopicProjection> getQuizList(String quiz_level) {
        try {
            return quizRepository.findAllByQuizLevel(QuizLevel.valueOf(quiz_level));
        } catch (Exception e) {
            throw new CustomException(FinlitConstants.QUIZZES_NOT_FOUND);
        }
    }

    private List<TopicProjection> getTopicsList(Long quizId) {
        try {
            return topicRepository.findAllByQuizId(quizId);
        } catch (Exception e) {
            throw new CustomException(FinlitConstants.QUIZ_TOPICS_NOT_FOUND);
        }
    }

    private List<Example> getExamples(Long topicId) {
        try {
            return exampleRepository.findAllByTopicId(topicId);
        } catch (Exception e) {
            throw new CustomException(FinlitConstants.QUIZ_TOPIC_EXAMPLES_ERROR);
        }
    }

    private List<KeyTerm> getKeyTerms(Long topicId) {
        try {
            return keyTermRepository.findAllByTopicId(topicId);
        } catch (Exception e) {
            throw new CustomException(FinlitConstants.QUIZ_TOPIC_KEYTERMS_ERROR);
        }
    }

    private List<Question> getQuestions(Long topicId) {
        try {
            List<Question> questions = new ArrayList<>(questionRepository.findAllByTopicId(topicId).stream()
                    .peek(question -> {
                        if (question.getQuestionType().getQuestionType().equals(FinlitConstants.LEARNING_QUESTION_TYPE.MULTIPLE_CHOICE.name())) {
                            question.setOptions(getOptionsForMultipleChoiceQuestions(question.getId()));
                        }
                    })
                    .toList());
            Collections.shuffle(questions);
            return questions.stream().limit(FinlitConstants.MAX_QUESTIONS_PER_TOPIC).toList();
        } catch (Exception e) {
            throw new CustomException(FinlitConstants.QUIZ_TOPIC_KEYTERMS_ERROR);
        }
    }

    private List<Option> getOptionsForMultipleChoiceQuestions(Long questionId) {
        try {
            List<Option> options = optionRepository.findAllByQuestionId(questionId);
            Collections.shuffle(options);
            return options;
        } catch (Exception e) {
            throw new CustomException(FinlitConstants.QUIZ_TOPIC_KEYTERMS_ERROR);
        }
    }















    @Transactional
    public void updateSolvedQuestions(HttpServletRequest request, List<Long> questionIds) {
        try {
            User user = customSecurityUtil.getUserFromRequest(request);

            UserXP userXP = userXPRepository.findById_User(user)
                    .orElse(getNewUserXP(user));

            userXP.setXpPoints(calculateXPPoints(questionIds));

            userXPRepository.save(userXP);

            userSolvedQuestionRepository.insertUserSolvedQuestionsBatch(user.getId(), questionIds);
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
    }

    private Integer calculateXPPoints(List<Long> questionIds) {
        List<Integer> xpPoints = questionRepository.findPointsByQuestionIds(questionIds);
        return xpPoints.stream().mapToInt(Integer::intValue).sum();
    }

    private UserXP getNewUserXP(User user) {
        UserXPKey key = new UserXPKey(user);
        UserXP userXP = new UserXP();
        userXP.setId(key);
        return userXP;
    }



















    @Override
    public String canAttemptQuiz(HttpServletRequest request, Long quizId) {

        try {
            User user = customSecurityUtil.getUserFromRequest(request);
            Optional<Quiz> quiz = quizRepository.findById(quizId);
            if (quiz.isEmpty()) {
                throw new CustomException(FinlitConstants.QUIZ_NOT_FOUND);
            }
            replenishCashIfNeeded(user.getId(), quizId);
            return String.valueOf(FinlitConstants.MAX_WADS_OF_CASH_PER_TOPIC > (int) userTopicCashRepository.countByUserIdAndQuizId(user.getId(), quizId));
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
    }

    @Override
    public void loseCash(HttpServletRequest request, Long quizId, Integer numOfIncorrectQuestions) {
        try {
            User user = customSecurityUtil.getUserFromRequest(request);
            Long userId = user.getId();

            Optional<Quiz> quiz = quizRepository.findById(quizId);

            if (quiz.isEmpty()) {
                throw new CustomException(FinlitConstants.QUIZ_NOT_FOUND);
            }

            replenishCashIfNeeded(userId, quizId);
            long currentCash = userTopicCashRepository.countByUserIdAndQuizId(userId, quizId);

            long cashLeft = FinlitConstants.MAX_WADS_OF_CASH_PER_TOPIC - currentCash;

            if (cashLeft <= 0) {
                throw new CustomException(FinlitConstants.NO_CASH_LEFT_MSG);
            }

            cashLeft = Math.min(cashLeft, numOfIncorrectQuestions);

            while (cashLeft > 0) {
                UserTopicCash coinLoss = new UserTopicCash();
                coinLoss.setUser(user);
                coinLoss.setQuiz(quiz.get());
                coinLoss.setLossTime(LocalDateTime.now());
                userTopicCashRepository.save(coinLoss);
                cashLeft--;
            }
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
    }

    private void replenishCashIfNeeded(Long userId, Long quizId) {
        List<UserTopicCash> lossesToReplenish = userTopicCashRepository
                .findAllByUserIdAndQuizIdAndLossTimeBefore(userId, quizId, LocalDateTime.now().minusMinutes(FinlitConstants.REPLENISH_CASH_INTERVAL_MINUTES));

        if (!lossesToReplenish.isEmpty()) {
            for (UserTopicCash toReplenish : lossesToReplenish) {
                userTopicCashRepository.delete(toReplenish);
            }
        }
    }













    public List<TopicProgressProjection> getUserTopicProgress(HttpServletRequest request, Long quizId) {
       try {
           User user = customSecurityUtil.getUserFromRequest(request);
           List<TopicQuestionCountProjection> topics = topicRepository.findAllWithQuestionCountByQuizId(quizId);
           List<TopicSolvedQuestionCountProjection> solvedPerTopic = topicRepository.findSolvedQuestionCountByUserAndQuiz(user.getId(), quizId);

           Map<Long, Long> solvedMap = solvedPerTopic.stream()
                   .collect(Collectors.toMap(TopicSolvedQuestionCountProjection::getTopicId,
                           TopicSolvedQuestionCountProjection::getSolvedQuestionCount));
           return topics.stream().map(topic -> {
               Long solvedCount = solvedMap.getOrDefault(topic.getId(), 0L);
               Long questionCount = topic.getQuestionCount();
               Long topicProgress = questionCount > 0 ? (solvedCount * 100) / questionCount : 0;

               return new TopicProgressProjection(topic.getId(), topic.getTitle(), topicProgress);
           }).collect(Collectors.toList());
       } catch (Exception e) {
           throw new CustomException(e.getMessage());
       }
    }
}

