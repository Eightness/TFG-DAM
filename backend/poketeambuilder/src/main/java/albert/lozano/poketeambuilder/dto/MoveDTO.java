/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * MoveInputDTO class. Contains all Move's attributes obtainable by user's input.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MoveDTO {
    // Attributes
    private String name;
}
