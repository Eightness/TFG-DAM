/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.exceptions;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * CustomError class. This class serves to display a custom error via different exceptions.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomError {
    // Attributes
    private Date timestamp;
    private int httpCode;
    private String message;
}
