/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller.dto.outputDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * TeamOutputDTO class. Contains all Team's attributes to display.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TeamOutputDTO {
    // Attributes
    private String name;

    private Date createdDate;

    private boolean isPublic;

    private int numLikes;

    private int generation;

    private List<PokemonOutputDTO> pokemon;

    private List<CommentOutputDTO> comments;

    private TrainerOutputDTO trainer;
}
