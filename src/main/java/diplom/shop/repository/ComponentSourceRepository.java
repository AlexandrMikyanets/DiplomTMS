package diplom.shop.repository;

import diplom.shop.model.ComponentSource;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ComponentSourceRepository extends JpaRepository<ComponentSource, Long> {
}
