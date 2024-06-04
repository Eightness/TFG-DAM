/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller.dto.outputDTO;

import albert.lozano.poketeambuilder.domain.Trainer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * CommentOutputDTO class. Contains all Comment's attributes to display.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentOutputDTO {
    // Attributes
    private Date createdDate;

    private String body;

    private TrainerOutputDTO trainer;
}
