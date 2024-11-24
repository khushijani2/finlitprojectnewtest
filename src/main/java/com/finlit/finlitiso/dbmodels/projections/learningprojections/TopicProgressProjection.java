package com.finlit.finlitiso.dbmodels.projections.learningprojections;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TopicProgressProjection {
    private Long topicId;
    private String topicName;
    private Long topicProgress;
}
