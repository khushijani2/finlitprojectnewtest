package com.finlit.finlitiso.utils;

import org.springframework.stereotype.Component;

@Component
public class ProficiencyCalculatorUtil {

    private final double BEGINNER_THRESHOLD = 1.5;
    private final double INTERMEDIATE_THRESHOLD = 2.5;
    private final int MAX_SCORE_PER_CATEGORY = 5;
    private final double FULL_MEMBERSHIP = 1.0;
    private final double NO_MEMBERSHIP = 0.0;
    private final int MINIMUM_MEDIUM_SCORE = 2;
    private final int MAXIMUM_MEDIUM_SCORE = 4;

    public FinlitConstants.ProficiencyLevel calculateProficiency(int easyScore, int intermediateScore, int advancedScore) {
        double beginnerMembership = calculateBeginnerMembership(easyScore, intermediateScore, advancedScore);
        double intermediateMembership = calculateIntermediateMembership(easyScore, intermediateScore, advancedScore);
        double advancedMembership = calculateAdvancedMembership(easyScore, intermediateScore, advancedScore);

        double proficiencyScore = (beginnerMembership * 1 + intermediateMembership * 2 + advancedMembership * 3) /
                (beginnerMembership + intermediateMembership + advancedMembership);

        if (proficiencyScore <= BEGINNER_THRESHOLD) {
            return FinlitConstants.ProficiencyLevel.BEGINNER;
        } else if (proficiencyScore <= INTERMEDIATE_THRESHOLD) {
            return FinlitConstants.ProficiencyLevel.INTERMEDIATE;
        } else {
            return FinlitConstants.ProficiencyLevel.ADVANCED;
        }
    }


    private double easyLow(int easyScore) {
        return Math.max(NO_MEMBERSHIP, FULL_MEMBERSHIP - easyScore / (double) MAX_SCORE_PER_CATEGORY);
    }

    private double easyMedium(int easyScore) {
        if (easyScore >= MINIMUM_MEDIUM_SCORE && easyScore <= MAXIMUM_MEDIUM_SCORE) {
            return FULL_MEMBERSHIP;
        }
        return NO_MEMBERSHIP;
    }

    private double easyHigh(int easyScore) {
        return Math.min(FULL_MEMBERSHIP, easyScore / (double) MAX_SCORE_PER_CATEGORY);
    }

    private double mediumLow(int mediumScore) {
        return Math.max(NO_MEMBERSHIP, FULL_MEMBERSHIP - mediumScore / (double) MAX_SCORE_PER_CATEGORY);
    }

    private double mediumMedium(int mediumScore) {
        if (mediumScore >= MINIMUM_MEDIUM_SCORE && mediumScore <= MAXIMUM_MEDIUM_SCORE) {
            return FULL_MEMBERSHIP;
        }
        return NO_MEMBERSHIP;
    }

    private double mediumHigh(int mediumScore) {
        return Math.min(FULL_MEMBERSHIP, mediumScore / (double) MAX_SCORE_PER_CATEGORY);
    }

    private double difficultLow(int difficultScore) {
        return Math.max(NO_MEMBERSHIP, FULL_MEMBERSHIP - difficultScore / (double) MAX_SCORE_PER_CATEGORY);
    }

    private double difficultMedium(int difficultScore) {
        if (difficultScore >= MINIMUM_MEDIUM_SCORE && difficultScore <= MAXIMUM_MEDIUM_SCORE) {
            return FULL_MEMBERSHIP;
        }
        return NO_MEMBERSHIP;
    }

    private double difficultHigh(int difficultScore) {
        return Math.min(FULL_MEMBERSHIP, difficultScore / (double) MAX_SCORE_PER_CATEGORY);
    }

    private double calculateBeginnerMembership(int easyScore, int mediumScore, int difficultScore) {
        double easyLowMembership = easyLow(easyScore);
        double mediumLowMembership = mediumLow(mediumScore);
        double difficultLowMembership = difficultLow(difficultScore);

        return (easyLowMembership + mediumLowMembership + difficultLowMembership) / 3.0;
    }

    private double calculateIntermediateMembership(int easyScore, int mediumScore, int difficultScore) {
        double easyMediumMembership = easyMedium(easyScore);
        double mediumMediumMembership = mediumMedium(mediumScore);
        double difficultMediumMembership = difficultMedium(difficultScore);

        return (easyMediumMembership + mediumMediumMembership + difficultMediumMembership) / 3.0;
    }

    private double calculateAdvancedMembership(int easyScore, int mediumScore, int difficultScore) {
        double easyHighMembership = easyHigh(easyScore);
        double mediumHighMembership = mediumHigh(mediumScore);
        double difficultHighMembership = difficultHigh(difficultScore);

        return (easyHighMembership + mediumHighMembership + difficultHighMembership) / 3.0;
    }

}
