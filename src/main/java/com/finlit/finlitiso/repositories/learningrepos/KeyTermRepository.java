package com.finlit.finlitiso.repositories.learningrepos;

import com.finlit.finlitiso.dbmodels.learning.KeyTerm;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KeyTermRepository extends JpaRepository<KeyTerm, Long> {
    List<KeyTerm> findAllByTopicId(Long topicId);
}

