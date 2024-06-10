/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

/**
 * Pokémon class. Defines a Pokémon.
 */
@Entity
@Table(name = "Pokemon")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pokemon {
    // Attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long pokemonId;

    @NotNull
    private String name;

    @NotNull
    private String spriteUrl;

    private String nature;

    private String ability;

    private String item;

    @JsonProperty("isShiny")
    private boolean shiny;

    @ManyToOne
    @JoinColumn(name = "team_id")
    private Team team;

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
