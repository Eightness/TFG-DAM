/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.repository;

import albert.lozano.poketeambuilder.domain.Team;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * TeamRepository interface. Extends from JpaRepository and contains all methods related to User's persistence.
 */
public interface TeamRepository extends JpaRepository<Team, Long> {
        /*
    Thanks to extending from JpaRepository, we can persist and read data (Access to CRUD methods).
    <Team, Long>
        Team -> Defines entity to persist.
        Long -> Defines entity's primary key type.
     */

    // Custom methods
    List<Team> findByTrainerUsername(String username);
}
