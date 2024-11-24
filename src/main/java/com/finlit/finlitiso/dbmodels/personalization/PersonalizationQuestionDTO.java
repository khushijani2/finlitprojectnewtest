package com.finlit.finlitiso.dbmodels.personalization;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class PersonalizationQuestionDTO {
    private Long id;
    private String question;
    private List<OptionDTO> options;
    private String difficultyLevel = "";
    private String questionType = "";
}
