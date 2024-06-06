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
 * TrainerInputDTO class. Contains all Trainer's attributes obtainable by user's input.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainerDTO {
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

    private String bio;

    public boolean getTheme() {
        return this.theme;
    }
}
