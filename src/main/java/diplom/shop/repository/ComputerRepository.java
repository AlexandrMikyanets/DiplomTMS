package diplom.shop.repository;

import diplom.shop.model.Computer;
import diplom.shop.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComputerRepository extends JpaRepository<Computer, Long> {

    List<Computer> findAllByUser(User user);
}
