package com.finlit.finlitiso.dbmodels.projections.personalizationprojections;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LearningStyleQuestionProjection {
    private Long id;
    private String question;
    private String options;
}
