/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller.dto.inputDTO;

import albert.lozano.poketeambuilder.domain.Team;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * PokemonInputDTO class. Contains all Pokémon attributes obtainable by user's input.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PokemonInputDTO {
    // Attributes
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
