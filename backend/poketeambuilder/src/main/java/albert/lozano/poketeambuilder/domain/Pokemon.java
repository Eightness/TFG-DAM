/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

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

    private boolean isShiny;

    @NotNull
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

    // Methods
    public boolean getShiny() {
        return this.isShiny;
    }
}
