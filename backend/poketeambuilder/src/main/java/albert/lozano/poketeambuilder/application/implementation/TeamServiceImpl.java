/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.application.implementation;

import albert.lozano.poketeambuilder.application.services.GenericCRUDService;
import albert.lozano.poketeambuilder.domain.Pokemon;
import albert.lozano.poketeambuilder.dto.PokemonDTO;
import albert.lozano.poketeambuilder.dto.TeamDTO;
import albert.lozano.poketeambuilder.domain.Team;
import albert.lozano.poketeambuilder.dto.mappers.PokemonMapper;
import albert.lozano.poketeambuilder.dto.mappers.TrainerTeamMapper;
import albert.lozano.poketeambuilder.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TeamServiceImpl class. Implements GenericService interface and contains all methods related to Team's CRUD.
 */
@Service
public class TeamServiceImpl implements GenericCRUDService<TeamDTO, Long> {
    // Attributes
    @Autowired
    TeamRepository teamRepository;
    @Autowired
    TrainerTeamMapper trainerTeamMapper;
    @Autowired
    PokemonServiceImpl pokemonService;
    @Autowired
    PokemonMapper pokemonMapper;

    // Methods
    @Override
    public TeamDTO getEntityById(Long id) {
        Team team = teamRepository.findById(id).orElseThrow();
        return trainerTeamMapper.teamToTeamDTO(team);
    }

    @Override
    public List<TeamDTO> getEntityByIds(List<Long> ids) {
        return null;
    }

    @Override
    public List<TeamDTO> getAllEntities(int pageNumber, int pageSize) {
        List<Team> allTrainers = teamRepository.findAll();
        return trainerTeamMapper.teamsToTeamsDTO(allTrainers);
    }

    public List<TeamDTO> getAllPublicTeams() {
        List<Team> allPublicTeams = teamRepository.findByIsPublicTrue();
        return trainerTeamMapper.teamsToTeamsDTO(allPublicTeams);
    }

    @Override
    public TeamDTO addEntity(TeamDTO EntityDTO) {
        Team team = trainerTeamMapper.teamDTOToTeam(EntityDTO);

        List<PokemonDTO> pokemonDTOFromTeam = EntityDTO.getPokemon();

        teamRepository.save(team);

        for (PokemonDTO pokemonDTO : pokemonDTOFromTeam) {
            pokemonService.addEntity(pokemonDTO, team);
        }
        return trainerTeamMapper.teamToTeamDTO(team);
    }

    @Override
    public List<TeamDTO> addEntities(List<TeamDTO> EntitiesDTO) {
        return null;
    }

    @Override
    public TeamDTO updateEntity(Long id, TeamDTO EntityDTO) {
        Team team = teamRepository.findById(id).orElseThrow();
        Team updatedTeam = trainerTeamMapper.teamDTOToTeam(EntityDTO);

        team.setName(updatedTeam.getName());
        team.setPublic(updatedTeam.isPublic());
        team.setGeneration(updatedTeam.getGeneration());
        team.setPokemon(updatedTeam.getPokemon());

        teamRepository.save(team);
        return trainerTeamMapper.teamToTeamDTO(team);
    }

    @Override
    public List<TeamDTO> updateEntities(Long ids, List<TeamDTO> EntitiesDTO) {
        return null;
    }

    @Override
    public TeamDTO modifyEntity(Long id, TeamDTO EntityDTO) {
        return null;
    }

    @Override
    public List<TeamDTO> modifyEntitiesByIds(List<Long> ids, List<TeamDTO> EntitiesDTO) {
        return null;
    }

    @Override
    public void deleteEntityById(Long id) {
        teamRepository.deleteById(id);
    }

    @Override
    public void deleteEntitiesByIds(List<Long> ids) {

    }

    @Override
    public void deleteAllEntities() {
        teamRepository.deleteAll();
    }

    public List<TeamDTO> getTeamsByTrainerUsername(String username) {
        return trainerTeamMapper.teamsToTeamsDTO(teamRepository.findByTrainerUsername(username));
    }
}
