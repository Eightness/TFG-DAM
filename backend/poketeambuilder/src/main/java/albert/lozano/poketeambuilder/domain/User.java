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
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * User class. Defines a user.
 */
@Entity
@Table(name = "User")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User implements UserDetails{
    // Attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long userId;

    @Size(min = 3, max = 12)
    @NotNull
    private String username;

    @NotNull
    private String password;

    @NotNull
    private String name;

    @NotNull
    private String firstSurname;

    private String secondSurname;

    @NotNull
    private String email;

    @NotNull
    private String phone;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;

    private boolean theme;

    private List<Team> teams;

    // Authentication

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority(this.username));
    }

    @Override
    public @NotNull String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
