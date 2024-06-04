/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.dto.mappers;

import albert.lozano.poketeambuilder.dto.TeamDTO;
import albert.lozano.poketeambuilder.domain.Team;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * TeamMapper interface. It's a mapper from MapStruct. Automatically maps DTOs. Extends from GenericDTOMapper, previously implemented.
 */
public class TeamMapper implements GenericDTOMapper<TeamDTO, Team> {
    @Override
    public Team DTOToDomain(TeamDTO teamDTO) {
        Team team = new Team();

        team.setName(teamDTO.getName());
        team.setCreatedDate(teamDTO.getCreatedDate());
        team.setPublic(teamDTO.getPublic());
        team.setNumLikes(teamDTO.getNumLikes());
        team.setGeneration(teamDTO.getGeneration());

        return team;
    }

    @Override
    public List<Team> DTOToDomain(List<TeamDTO> teamsDTO) {
        List<Team> teams = new ArrayList<>();

        for (TeamDTO teamDTO : teamsDTO) {
            Team team = DTOToDomain(teamDTO);
            teams.add(team);
        }

        return teams;
    }

    @Override
    public TeamDTO domainToDTO(Team team) {
        TeamDTO teamDTO = new TeamDTO();

        teamDTO.setName(team.getName());
        teamDTO.setCreatedDate(team.getCreatedDate());
        teamDTO.setPublic(team.getPublic());
        teamDTO.setNumLikes(team.getNumLikes());
        teamDTO.setGeneration(team.getGeneration());

        return teamDTO;
    }

    @Override
    public List<TeamDTO> domainToDTO(List<Team> teams) {
        List<TeamDTO> teamsDTO = new ArrayList<>();

        for (Team team : teams) {
            TeamDTO teamDTO = domainToDTO(team);
            teamsDTO.add(teamDTO);
        }

        return teamsDTO;
    }
}
