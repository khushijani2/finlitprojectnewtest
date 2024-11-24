package com.finlit.finlitiso.dbmodels.learning;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@Entity
@Table(name = "quizzes")
public class Quiz {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    private QuizLevel quizLevel;

    private String category;
    private String ageRange;
    private String priorKnowledge;
    private String infoNeeded;
    private String timeNeeded;

    @OneToMany(mappedBy = "quiz", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Topic> topics;

}
