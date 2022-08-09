package diplom.shop.service;

import diplom.shop.model.User;
import diplom.shop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    @Transactional
    public void changeStatusById(Long id) {
        User userToUpdate = userRepository.getById(id);
        userToUpdate.setActive(!userToUpdate.isActive());
        userRepository.save(userToUpdate);
    }
}
