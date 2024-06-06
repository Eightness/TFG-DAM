/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.util.Date;
import java.util.List;

/**
 * Team class. Defines a team.
 */
@Entity
@Table(name = "Team")
@Data
@Setter
@Getter
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

    @JsonProperty("isPublic")
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
}
