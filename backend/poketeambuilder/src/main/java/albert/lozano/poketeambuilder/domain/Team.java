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
import java.util.List;

/**
 * Team class. Defines a team.
 */
@Entity
@Table(name = "Team")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Team {
    // Attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long teamId;

    @NotNull
    private String name;

    @NotNull
    @Temporal(TemporalType.DATE)
    private Date createdDate;

    private boolean isPublic;

    private int numLikes;

    private int generation;

    @NotNull
    @OneToMany(mappedBy = "team")
    private List<Pokemon> pokemon;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "trainer_id")
    private Trainer trainer;

    public boolean getPublic() {
        return this.isPublic;
    }
}
