/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.repository;

import albert.lozano.poketeambuilder.domain.Pokemon;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * PokemonRepository interface. Extends from JpaRepository and contains all methods related to User's persistence.
 */
public interface PokemonRepository extends JpaRepository<Pokemon, Long> {
        /*
    Thanks to extending from JpaRepository, we can persist and read data (Access to CRUD methods).
    <Pokemon, Long>
        Pokemon -> Defines entity to persist.
        Long -> Defines entity's primary key type.
     */

    // Custom methods
}
