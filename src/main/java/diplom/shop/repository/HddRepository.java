package diplom.shop.repository;

import diplom.shop.model.component.Hdd;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HddRepository extends JpaRepository<Hdd, Long> {
}
