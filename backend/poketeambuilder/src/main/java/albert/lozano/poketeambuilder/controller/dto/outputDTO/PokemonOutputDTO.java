/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller.dto.outputDTO;

import albert.lozano.poketeambuilder.domain.Team;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * PokemonOutputDTO class. Contains all Pokémon attributes to display.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PokemonOutputDTO {
    // Attributes
    private long pokemonId;

    private String name;

    private String spriteUrl;

    private String nature;

    private String ability;

    private String item;

    private boolean isShiny;

    private Team team;

    private int ivDef;

    private int ivAtk;

    private int ivSpDef;

    private int ivSpAtk;

    private int ivSpeed;

    private int ivHealth;

    private int evDef;

    private int evAtk;

    private int evSpDef;

    private int evSpAtk;

    private int evSpeed;

    private int evHealth;
}
