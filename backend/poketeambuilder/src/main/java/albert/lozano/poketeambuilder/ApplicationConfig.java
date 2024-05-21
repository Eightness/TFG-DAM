/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder;

import albert.lozano.poketeambuilder.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;

/**
 * ApplicationConfig class. Defines all Beans for the project to run.
 */
@Configuration
@RequiredArgsConstructor
public class ApplicationConfig {
    // Attributes
    private final UserRepository userRepository;

    // Beans


}
