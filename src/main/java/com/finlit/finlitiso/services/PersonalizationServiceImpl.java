package com.finlit.finlitiso.services;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.finlit.finlitiso.dbmodels.personalization.OptionDTO;
import com.finlit.finlitiso.dbmodels.personalization.PersonalizationAnswer;
import com.finlit.finlitiso.dbmodels.personalization.PersonalizationQuestion;
import com.finlit.finlitiso.dbmodels.personalization.PersonalizationQuestionDTO;
import com.finlit.finlitiso.dbmodels.projections.personalizationprojections.LearningStyleQuestionProjection;
import com.finlit.finlitiso.exceptions.CustomException;
import com.finlit.finlitiso.repositories.learningrepos.LearningStyleRepository;
import com.finlit.finlitiso.repositories.userrepos.PersonalizationAnswerRepository;
import com.finlit.finlitiso.repositories.userrepos.PersonalizationQuestionRepository;
import com.finlit.finlitiso.services.serviceinterfaces.PersonalizationService;
import com.finlit.finlitiso.utils.AnswerValidationUtil;
import com.finlit.finlitiso.utils.FinlitConstants;
import com.finlit.finlitiso.utils.FinlitConstants.ProficiencyLevel;
import com.finlit.finlitiso.utils.FinlitConstants.LearningStyle;
import com.finlit.finlitiso.utils.CustomSecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class PersonalizationServiceImpl implements PersonalizationService {

    @Autowired
    private PersonalizationQuestionRepository questionRepository;

    @Autowired
    private PersonalizationAnswerRepository answerRepository;

    @Autowired
    private LearningStyleRepository learningStyleRepository;

    @Autowired
    private AnswerValidationUtil answerValidationUtil;

    @Autowired
    private CustomSecurityUtil customSecurityUtil;

    @Override
    public List<PersonalizationQuestionDTO> getRandomQuestions() {
        try {
            List<PersonalizationQuestion> questions = questionRepository.findRandomQuestions();
            Collections.shuffle(questions);
            questions = getQuestionFieldIds(questions);

            return questions.stream()
                    .map(question -> new PersonalizationQuestionDTO(
                            question.getId(),
                            question.getQuestion(),
                            getOptionsList(question.getQuestionType(), question.getOptions()),
                            question.getDifficultyLevel(),
                            question.getQuestionType())).toList();
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
    }

    @Override
    public ProficiencyLevel getProficiencyLevel(Map<Long, String> responses) {
        try {
            List<PersonalizationAnswer> answers = answerRepository.findAll();
            Map<Long, PersonalizationAnswer> idToEasyMap = answers.stream().filter(answer -> answer.getPersonalizationQuestion().getDifficultyLevel().equalsIgnoreCase(FinlitConstants.DifficultyLevel.EASY.name()))
                    .collect(Collectors.toMap(answer -> answer.getPersonalizationQuestion().getId(), answer -> answer));
            Map<Long, PersonalizationAnswer> idToIntermediateMap = answers.stream().filter(answer -> answer.getPersonalizationQuestion().getDifficultyLevel().equalsIgnoreCase(FinlitConstants.DifficultyLevel.INTERMEDIATE.name()))
                    .collect(Collectors.toMap(answer -> answer.getPersonalizationQuestion().getId(), answer -> answer));
            Map<Long, PersonalizationAnswer> idToAdvancedMap = answers.stream().filter(answer -> answer.getPersonalizationQuestion().getDifficultyLevel().equalsIgnoreCase(FinlitConstants.DifficultyLevel.ADVANCED.name()))
                    .collect(Collectors.toMap(answer -> answer.getPersonalizationQuestion().getId(), answer -> answer));

            return answerValidationUtil.calculateProficiency(idToEasyMap,idToIntermediateMap, idToAdvancedMap, responses);
        } catch (Exception e) {
            return ProficiencyLevel.ERROR;
        }
    }


    @Override
    public List<LearningStyleQuestionProjection> getLearningStyleQuestions() {
        try {
            return learningStyleRepository.findAllQuestions();
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
    }

    @Override
    public LearningStyle getLearningStyle(Map<Long, String> responses) {
        try {
            List<Object[]> results = learningStyleRepository.findAllIdAndAnswers();
            Map<Long, String> answer_key = new HashMap<>();
            for (Object[] result : results) {
                Long id = ((Number) result[0]).longValue();
                String question = (String) result[1];
                answer_key.put(id, question);
            }
            return checkFromAnswerKey(responses, answer_key);
        } catch (Exception e) {
            return LearningStyle.ERROR;
        }
    }

    private List<PersonalizationQuestion> getQuestionFieldIds(List<PersonalizationQuestion> questions) {
        if (questions == null || questions.isEmpty()) {
            return Collections.emptyList();
        }
        questions.forEach(question -> {
            question.setQuestionType(FinlitConstants.PERSONALIZATION_QUESTION_TYPE_MAP.getOrDefault(question.getQuestionType(), "-1"));
            question.setDifficultyLevel(FinlitConstants.PERSONALIZATION_DIFFICULTY_LEVEL_MAP.getOrDefault(question.getDifficultyLevel(), "-1"));
        });
        return questions;
    }

    private List<OptionDTO> getOptionsList(String questionType, String options) {
        if (questionType == null || !questionType.equalsIgnoreCase("1")) {
            return Collections.emptyList();
        }
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            List<OptionDTO> optionsList = objectMapper.readValue(options, new TypeReference<List<OptionDTO>>() {});
            Collections.shuffle(optionsList);
            return optionsList;
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }



    private LearningStyle checkFromAnswerKey(Map<Long, String> responses, Map<Long, String> answer_key) {
        if (answer_key == null || answer_key.isEmpty()) {
            return LearningStyle.ERROR;
        }
        int auditory_count = 0;
        int visual_count = 0;
        int kinesthetic_count = 0;
        ObjectMapper objectMapper = new ObjectMapper();
        for(Map.Entry<Long, String> entry : responses.entrySet()) {
            String answers = answer_key.get(entry.getKey());
            try {
                Map<String, String> map = objectMapper.readValue(answers, Map.class);
                if (map.get(entry.getValue()) == null) {
                    continue;
                }
                if (map.get(entry.getValue()).toLowerCase().contains(LearningStyle.AUDITORY.name().toLowerCase())) {
                    auditory_count++;
                } else if (map.get(entry.getValue()).toLowerCase().contains(LearningStyle.VISUAL.name().toLowerCase())) {
                    visual_count++;
                } else if (map.get(entry.getValue()).toLowerCase().contains(LearningStyle.KINESTHETIC.name().toLowerCase())) {
                    kinesthetic_count++;
                }
            } catch (Exception e) {
                return LearningStyle.ERROR;
            }
        }
        return getLearningStyleFromCounts(auditory_count, visual_count, kinesthetic_count);
    }

    private LearningStyle getLearningStyleFromCounts(int auditory_count, int visual_count, int kinesthetic_count) {
        if (visual_count >= auditory_count && visual_count >= kinesthetic_count) {
            return LearningStyle.VISUAL;
        } // First Preference to Visual
        if (auditory_count >= visual_count && auditory_count >= kinesthetic_count) {
            return LearningStyle.AUDITORY;
        }
        return LearningStyle.KINESTHETIC;
    }
}
