package com.finlit.finlitiso.dbmodels.personalization;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Data
@AllArgsConstructor
@Table(name = "personalization_question_bank")
public class PersonalizationQuestion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String question;
    private String options;
    private String difficultyLevel = "";
    private String questionType = "";

    @OneToOne(mappedBy = "personalizationQuestion", cascade = CascadeType.ALL, orphanRemoval = true)
    private PersonalizationAnswer answer;
}
