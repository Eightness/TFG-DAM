/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

/**
 * Move class. Defines a move.
 */
@Entity
@Table(name = "Move")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Move {
    // Attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long moveId;

    @NotNull
    private String name;
}
