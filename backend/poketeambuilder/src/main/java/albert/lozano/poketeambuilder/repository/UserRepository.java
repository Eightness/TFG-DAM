/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.repository;

import albert.lozano.poketeambuilder.controller.dto.outputDTO.UserOutputDTO;
import albert.lozano.poketeambuilder.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * UserRepository interface. Extends from JpaRepository and contains all methods related to User's persistence.
 */
public interface UserRepository extends JpaRepository<User, Long> {
    /*
    Thanks to extending from JpaRepository, we can persist and read data (Access to CRUD methods).
    <User, Long>
        User -> Defines entity to persist.
        Long -> Defines entity's primary key type.
     */

    // Custom methods
    public Optional<UserOutputDTO> findByUsername(String username);
}
