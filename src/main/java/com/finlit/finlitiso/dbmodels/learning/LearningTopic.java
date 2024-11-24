package com.finlit.finlitiso.dbmodels.learning;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document(collection = "beginnerModules")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LearningTopic {

    @Id
    private String id;
    private String category;
    private List<Topic> topics;
    private String ageRange;
    private String priorKnowledge;
    private String infoNeeded;
    private String timeNeeded;
}
