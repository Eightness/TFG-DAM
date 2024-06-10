/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * CommentInputDTO class. Contains all Comment's attributes obtainable by user's input.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDTO {
    // Attributes
    private Date createdDate;

    private String body;

    private TrainerDTO trainer;

    private TeamDTO team;
}
