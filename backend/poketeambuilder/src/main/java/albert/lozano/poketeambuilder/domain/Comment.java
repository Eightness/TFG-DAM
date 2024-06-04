/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.util.Date;

/**
 * Comment class. Defines a comment.
 */
@Entity
@Table(name = "Comment")
@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    // Attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long commentId;

    @NotNull
    @Temporal(TemporalType.DATE)
    private Date createdDate;

    @NotNull
    private String body;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "trainer_id")
    private Trainer trainer;
}
