package diplom.shop.repository;

import diplom.shop.model.component.MotherBoard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MotherBoardRepository extends JpaRepository<MotherBoard, Long> {
}
