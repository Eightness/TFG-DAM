/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller.dto.inputDTO;

import albert.lozano.poketeambuilder.domain.Trainer;
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
public class CommentInputDTO {
    // Attributes
    private Date createdDate;

    private String body;

    private Trainer trainer;
}
