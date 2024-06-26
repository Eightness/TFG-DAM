/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.util.Date;
import java.util.List;

/**
 * Trainer class. Defines a trainer.
 */
@Entity
@Table(name = "Trainer")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Trainer {
    // Attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long trainerId;

    @NotNull
    @Column
    private String username;

    @NotNull
    @Column
    private String password;

    @NotNull
    @Column
    private String name;

    @NotNull
    @Column
    private String firstSurname;

    @Column
    private String secondSurname;

    @NotNull
    @Column
    private String email;

    @NotNull
    @Column
    private String phone;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @Column
    private Date createdDate;

    @Column
    private boolean theme;

    @OneToMany(mappedBy = "trainer", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Team> teams;

    @OneToMany(mappedBy = "trainer", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Comment> comments;

    @Column
    private String bio;

    public boolean getTheme() {
        return this.theme;
    }
}
