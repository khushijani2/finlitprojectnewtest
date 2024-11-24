package com.finlit.finlitiso.repositories.learningrepos;

import com.finlit.finlitiso.dbmodels.learning.LearningTopic;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LearningRepository extends MongoRepository<LearningTopic, String> {
}
