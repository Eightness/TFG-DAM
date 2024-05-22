/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller.dto.mappers;

import albert.lozano.poketeambuilder.controller.dto.inputDTO.TeamInputDTO;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.TeamOutputDTO;
import albert.lozano.poketeambuilder.domain.Team;
import org.mapstruct.Mapper;

/**
 * TeamMapper interface. It's a mapper from MapStruct. Automatically maps DTOs. Extends from GenericDTOMapper, previously implemented.
 */
@Mapper(componentModel = "spring")
public interface TeamMapper extends GenericDTOMapper<TeamInputDTO, Team, TeamOutputDTO> {
}
