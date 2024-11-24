package com.finlit.finlitiso.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.finlit.finlitiso.dbmodels.personalization.PersonalizationAnswer;
import com.finlit.finlitiso.dbmodels.personalization.PersonalizationQuestion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class AnswerValidationUtil {

    @Autowired
    private ProficiencyCalculatorUtil proficiencyCalculator;

    public FinlitConstants.ProficiencyLevel calculateProficiency(Map<Long, PersonalizationAnswer> idToEasyMap,
                                                                 Map<Long, PersonalizationAnswer> idToIntermediateMap,
                                                                 Map<Long, PersonalizationAnswer> idToAdvancedMap,
                                                                 Map<Long, String> responses) {
            return proficiencyCalculator.calculateProficiency(getCorrectlyAnsweredCount(idToEasyMap, responses),
                    getCorrectlyAnsweredCount(idToIntermediateMap, responses),
                    getCorrectlyAnsweredCount(idToAdvancedMap, responses));
    }

    public int getCorrectlyAnsweredCount(Map<Long, PersonalizationAnswer> idToAnswerMap, Map<Long, String> responses) {
        int correctCount = 0;
        for(Map.Entry<Long, String> entry : responses.entrySet()) {
            Long id = entry.getKey();
            PersonalizationAnswer answer = idToAnswerMap.get(id);
            if (answer == null) {
                continue;
            }
            PersonalizationQuestion question = answer.getPersonalizationQuestion();
            String questionType = FinlitConstants.PERSONALIZATION_QUESTION_TYPE_MAP.get(question.getQuestionType());
            if (questionType.equals("1") || questionType.equals("2") || questionType.equalsIgnoreCase("3")) {
                if (entry.getValue().equalsIgnoreCase(answer.getAnswer())) {
                    correctCount++;
                }
            } else if (questionType.equals("4")) {
                //TODO to update this condition to check for keywords
                if (validatePersonalizationShortAnswer(entry.getValue(), answer.getAnswer())) {
                    correctCount++;
                }
            }
        }
        return correctCount;
    }

    public boolean validatePersonalizationShortAnswer(String userAnswer, String actualAnswerStr) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            List<String> listOfKeywords = objectMapper.readValue(actualAnswerStr, List.class);
            long keywordCount = listOfKeywords.stream()
                    .filter(userAnswer::contains)
                    .count();
            //return (double) keywordCount >= (double) (0.6 * listOfKeywords.size());
            return (keywordCount == listOfKeywords.size());
        } catch (JsonProcessingException e) {
            return false;
        }
    }
}
