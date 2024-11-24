package com.finlit.finlitiso.dbmodels.learning;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewQuestion {

    private String question;
    private String answer;
    private List<String> options;
    private String questionType = "";
}
