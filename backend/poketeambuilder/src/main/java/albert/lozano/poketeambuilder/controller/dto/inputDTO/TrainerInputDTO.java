/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller.dto.inputDTO;

import albert.lozano.poketeambuilder.domain.Team;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * TrainerInputDTO class. Contains all Trainer's attributes obtainable by user's input.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainerInputDTO {
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

    private List<Team> teams;
}
