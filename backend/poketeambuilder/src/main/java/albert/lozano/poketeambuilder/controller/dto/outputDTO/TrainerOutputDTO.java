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
 * TrainerOutputDTO class. Contains all Trainer's attributes to display.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainerOutputDTO {
    // Attributes
    private String username;

    private String password;

    private String name;

    private String firstSurname;

    private String secondSurname;

    private String email;

    private String phone;

    private Date createdDate;

    private boolean theme;

    private List<TeamOutputDTO> teams;

    private String bio;
}
