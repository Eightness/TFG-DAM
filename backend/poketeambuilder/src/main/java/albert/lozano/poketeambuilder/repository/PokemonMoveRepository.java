/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.repository;

import albert.lozano.poketeambuilder.domain.PokemonMove;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * PokemonMoveRepository interface. Extends from JpaRepository and contains all methods related to User's persistence.
 */
public interface PokemonMoveRepository extends JpaRepository<PokemonMove, Long> {
        /*
    Thanks to extending from JpaRepository, we can persist and read data (Access to CRUD methods).
    <PokemonMove, Long>
        PokemonMove -> Defines entity to persist.
        Long -> Defines entity's primary key type.
     */

    // Custom methods
}
