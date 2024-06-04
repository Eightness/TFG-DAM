/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder;

import albert.lozano.poketeambuilder.application.implementation.*;
import albert.lozano.poketeambuilder.application.services.GenericCRUDService;
import albert.lozano.poketeambuilder.dto.*;
import albert.lozano.poketeambuilder.dto.mappers.*;
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

    // Services
    @Bean
    public GenericCRUDService<TrainerDTO, Long> trainerService() {
        return new TrainerServiceImpl();
    }

    @Bean
    public GenericCRUDService<TeamDTO, Long> teamService() {
        return new TeamServiceImpl();
    }

    @Bean
    public GenericCRUDService<PokemonDTO, Long> pokemonService() {
        return new PokemonServiceImpl();
    }

    @Bean
    public GenericCRUDService<MoveDTO, Long> moveService() {
        return new MoveServiceImpl();
    }

    @Bean
    public GenericCRUDService<CommentDTO, Long> commentService() {
        return new CommentServiceImpl();
    }

    // Mappers
    @Bean
    public CommentMapper commentMapper() {
        return new CommentMapper();
    }

    @Bean
    public MoveMapper moveMapper() {
        return new MoveMapper();
    }

    @Bean
    public PokemonMapper pokemonMapper() {
        return new PokemonMapper();
    }

    @Bean
    public TeamMapper teamMapper() {
        return new TeamMapper();
    }

    @Bean
    public TrainerMapper trainerMapper() {
        return new TrainerMapper();
    }

}
