package com.finlit.finlitiso.repositories.learningrepos;

import com.finlit.finlitiso.dbmodels.learning.Option;
import com.finlit.finlitiso.dbmodels.learning.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OptionRepository extends JpaRepository<Option, Long> {
    List<Option> findAllByQuestionId(Long questionId);
}

