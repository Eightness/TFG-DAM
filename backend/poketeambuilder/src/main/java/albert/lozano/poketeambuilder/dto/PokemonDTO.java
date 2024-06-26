/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * PokemonInputDTO class. Contains all Pokémon attributes obtainable by user's input.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PokemonDTO {
    // Attributes
    private String name;

    private String spriteUrl;

    private String item;

    private String ability;

    private String nature;

    @JsonProperty("isShiny")
    private boolean shiny;

    private List<MoveDTO> moves;

    // Statistics
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
