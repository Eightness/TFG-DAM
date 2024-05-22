/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * Comment class. Defines a comment.
 */
@Entity
@Table(name = "Comment")
@Data
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
