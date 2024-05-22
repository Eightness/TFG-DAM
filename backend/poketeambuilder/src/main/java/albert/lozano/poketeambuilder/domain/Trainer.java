/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * User class. Defines a user.
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

    @Size(min = 3, max = 12)
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

    @OneToMany(mappedBy = "trainer")
    private List<Team> teams;
}