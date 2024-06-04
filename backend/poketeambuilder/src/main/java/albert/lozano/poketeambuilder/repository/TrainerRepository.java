/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.repository;

import albert.lozano.poketeambuilder.dto.TrainerDTO;
import albert.lozano.poketeambuilder.domain.Trainer;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * TrainerRepository interface. Extends from JpaRepository and contains all methods related to User's persistence.
 */
public interface TrainerRepository extends JpaRepository<Trainer, Long> {
    /*
    Thanks to extending from JpaRepository, we can persist and read data (Access to CRUD methods).
    <Trainer, Long>
        Trainer -> Defines entity to persist.
        Long -> Defines entity's primary key type.
     */

    // Custom methods
    boolean existsByUsername(String username);
    boolean existsByEmail(String email);
    boolean existsByUsernameAndPassword(String username, String password);
    Trainer findByUsername(String username);
    void deleteByUsername(String username);
}
