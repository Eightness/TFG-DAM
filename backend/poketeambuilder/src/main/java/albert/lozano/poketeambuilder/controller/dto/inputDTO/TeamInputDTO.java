/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller.dto.inputDTO;

import albert.lozano.poketeambuilder.domain.Pokemon;
import albert.lozano.poketeambuilder.domain.Trainer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * TeamInputDTO class. Contains all Team's attributes obtainable by user's input.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TeamInputDTO {
    // Attributes
    private String name;

    private Date createdDate;

    private boolean isPublic;

    private int generation;

    private List<Pokemon> pokemon;

    private Trainer trainer;
}
