package com.finlit.finlitiso.services.serviceinterfaces;

import com.finlit.finlitiso.dbmodels.personalization.PersonalizationQuestionDTO;
import com.finlit.finlitiso.dbmodels.projections.personalizationprojections.LearningStyleQuestionProjection;
import com.finlit.finlitiso.utils.FinlitConstants.ProficiencyLevel;
import com.finlit.finlitiso.utils.FinlitConstants.LearningStyle;
import jakarta.servlet.http.HttpServletRequest;

import java.util.List;
import java.util.Map;

public interface PersonalizationService {
    List<PersonalizationQuestionDTO> getRandomQuestions();
    ProficiencyLevel getProficiencyLevel(Map<Long, String> responses);
    List<LearningStyleQuestionProjection> getLearningStyleQuestions();
    LearningStyle getLearningStyle(Map<Long, String> responses);
}
