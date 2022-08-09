package diplom.shop.repository;

import diplom.shop.model.component.Processor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface ProcessorRepository extends JpaRepository<Processor, Long> {
}
