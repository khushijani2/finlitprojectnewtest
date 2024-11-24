package com.finlit.finlitiso.services;

import com.finlit.finlitiso.dbmodels.creds.UserDetails;
import com.finlit.finlitiso.entity.User;
import com.finlit.finlitiso.exceptions.CustomException;
import com.finlit.finlitiso.exceptions.UnauthorizedException;
import com.finlit.finlitiso.repositories.userrepos.UserRepository;
import com.finlit.finlitiso.services.serviceinterfaces.UserService;
import com.finlit.finlitiso.utils.FinlitConstants;
import com.finlit.finlitiso.utils.CustomSecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import java.util.Optional;

import static com.finlit.finlitiso.utils.FinlitConstants.EMAIL_DOESNOT_EXIST_MSG;
import static com.finlit.finlitiso.utils.FinlitConstants.USR_NOT_VERIFIED;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CustomSecurityUtil customSecurityUtil;

    @Override
    public void updateUserDetails(UserDetails userDetails) {

        try {
            User user = userRepository.findByEmailIgnoreCase(userDetails.getEmail()).orElseThrow(() -> new CustomException(EMAIL_DOESNOT_EXIST_MSG, "4XX"));

            if (!user.isVerified()) {
                throw new CustomException(USR_NOT_VERIFIED, "4XX");
            }

            String username = userDetails.getUsername();
            if (username != null && !username.isEmpty()) {
                Optional<User> userWithUsername = userRepository.findByCustomUsernameIgnoreCase(userDetails.getUsername());
                if (userWithUsername.isPresent() && !userWithUsername.get().getEmail().equalsIgnoreCase(userDetails.getEmail())) {
                    throw new CustomException(FinlitConstants.USR_NAME_EXISTS, "4XX");
                }
            }

            user.setFirstName(userDetails.getFirstname());
            user.setLastName(userDetails.getLastname());
            user.setCustomUsername(userDetails.getUsername());
            user.setPhonenumber(userDetails.getPhonenumber());

            userRepository.save(user);
        } catch (Exception e) {
            throw new CustomException(e.getMessage(), "4XX");
        }
    }
}
