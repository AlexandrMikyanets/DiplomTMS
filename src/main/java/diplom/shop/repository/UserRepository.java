package diplom.shop.repository;

import diplom.shop.enumm.UserRole;
import diplom.shop.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findUserByEmail(String email);

    List<User> findUsersByRole(UserRole role);
}
