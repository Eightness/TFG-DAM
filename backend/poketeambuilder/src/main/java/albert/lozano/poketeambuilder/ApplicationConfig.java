/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder;

import albert.lozano.poketeambuilder.application.implementation.*;
import albert.lozano.poketeambuilder.application.services.GenericCRUDService;
import albert.lozano.poketeambuilder.controller.dto.inputDTO.*;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.*;
import albert.lozano.poketeambuilder.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * ApplicationConfig class. Defines all Beans for the project to run.
 */
@Configuration
@RequiredArgsConstructor
public class ApplicationConfig {
    // Attributes
    private final TrainerRepository trainerRepository;
    private final TeamRepository teamRepository;
    private final PokemonRepository pokemonRepository;
    private final MoveRepository moveRepository;
    private final CommentRepository commentRepository;

    // Beans
    @Bean
    public GenericCRUDService<TrainerInputDTO, TrainerOutputDTO, Long> trainerService() {
        return new TrainerServiceImpl();
    }

    @Bean
    public GenericCRUDService<TeamInputDTO, TeamOutputDTO, Long> teamService() {
        return new TeamServiceImpl();
    }

    @Bean
    public GenericCRUDService<PokemonInputDTO, PokemonOutputDTO, Long> pokemonService() {
        return new PokemonServiceImpl();
    }

    @Bean
    public GenericCRUDService<MoveInputDTO, MoveOutputDTO, Long> moveService() {
        return new MoveServiceImpl();
    }

    @Bean
    public GenericCRUDService<CommentInputDTO, CommentOutputDTO, Long> commentService() {
        return new CommentServiceImpl();
    }

}
