/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.application.implementation;

import albert.lozano.poketeambuilder.application.services.GenericCRUDService;
import albert.lozano.poketeambuilder.controller.dto.inputDTO.TeamInputDTO;
import albert.lozano.poketeambuilder.controller.dto.mappers.TeamMapper;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.TeamOutputDTO;
import albert.lozano.poketeambuilder.domain.Team;
import albert.lozano.poketeambuilder.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TeamServiceImpl class. Implements GenericService interface and contains all methods related to Team's CRUD.
 */
@Service
public class TeamServiceImpl implements GenericCRUDService<TeamInputDTO, TeamOutputDTO, Long> {
    // Attributes
    @Autowired
    TeamRepository teamRepository;
    @Autowired
    TeamMapper teamMapper;

    // Methods
    @Override
    public TeamOutputDTO getEntityById(Long id) {
        Team team = teamRepository.findById(id).orElseThrow();
        return teamMapper.domainToOutput(team);
    }

    @Override
    public List<TeamOutputDTO> getEntityByIds(List<Long> ids) {
        return null;
    }

    @Override
    public List<TeamOutputDTO> getAllEntities(int pageNumber, int pageSize) {
        List<Team> allTrainers = teamRepository.findAll();
        return teamMapper.domainToOutput(allTrainers);
    }

    @Override
    public TeamOutputDTO addEntity(TeamInputDTO inputEntity) {
        Team team = teamMapper.inputToDomain(inputEntity);
        teamRepository.save(team);
        return teamMapper.domainToOutput(team);
    }

    @Override
    public List<TeamOutputDTO> addEntities(List<TeamInputDTO> inputEntities) {
        return null;
    }

    @Override
    public TeamOutputDTO updateEntity(Long id, TeamInputDTO inputEntity) {
        Team team = teamRepository.findById(id).orElseThrow();
        Team updatedTeam = teamMapper.inputToDomain(inputEntity);

        team.setName(updatedTeam.getName());
        team.setPublic(updatedTeam.getPublic());
        team.setGeneration(updatedTeam.getGeneration());
        team.setPokemon(updatedTeam.getPokemon());

        teamRepository.save(team);
        return teamMapper.domainToOutput(team);
    }

    @Override
    public List<TeamOutputDTO> updateEntities(Long ids, List<TeamInputDTO> inputEntities) {
        return null;
    }

    @Override
    public TeamOutputDTO modifyEntity(Long id, TeamInputDTO inputEntity) {
        return null;
    }

    @Override
    public List<TeamOutputDTO> modifyEntitiesByIds(List<Long> ids, List<TeamInputDTO> inputEntities) {
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
}
