package com.finlit.finlitiso.dbmodels.learning;

import com.finlit.finlitiso.entity.User;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "user_xp_points")
public class UserXP {
    @EmbeddedId
    private UserXPKey id;

    private int xpPoints;
}
