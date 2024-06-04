/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.dto;

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
public class TeamDTO {
    // Attributes
    private String name;

    private Date createdDate;

    private boolean isPublic;

    private int numLikes;

    private int generation;

    private List<PokemonDTO> pokemon;

    private List<CommentDTO> comments;

    private TrainerDTO trainer;

    public boolean getPublic() {
        return this.isPublic;
    }
}
