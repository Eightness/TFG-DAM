/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.domain;

import jakarta.persistence.*;
import lombok.*;

/**
 * CommentTeam class. Serves as a junction table between Comment and Team.
 */
@Entity
@Table(name = "CommentTeam")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentTeam {
    // Attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long commentTeamId;

    @ManyToOne
    @JoinColumn(name = "comment_id")
    private Comment comment;

    @ManyToOne
    @JoinColumn(name = "team_id")
    private Team team;
}
