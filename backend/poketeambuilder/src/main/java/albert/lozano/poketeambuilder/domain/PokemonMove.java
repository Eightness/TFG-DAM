/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * PokemonMove class. Serves as a junction table between Pokémon and Move.
 */
@Entity
@Table(name = "PokemonMove")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PokemonMove {
    // Attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long pokemonMoveId;

    @ManyToOne
    @JoinColumn(name = "pokemon_id")
    private Pokemon pokemon;

    @ManyToOne
    @JoinColumn(name = "move_id")
    private Move move;
}
