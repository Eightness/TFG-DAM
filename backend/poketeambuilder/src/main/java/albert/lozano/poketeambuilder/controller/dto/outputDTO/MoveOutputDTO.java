/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller.dto.outputDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * MoveOutputDTO class. Contains all Move's attributes to display.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MoveOutputDTO {
    // Attributes
    private long moveId;

    private String name;
}
