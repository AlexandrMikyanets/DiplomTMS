package diplom.shop.repository;

import diplom.shop.model.component.Ssd;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SsdRepository extends JpaRepository<Ssd, Long> {
}
