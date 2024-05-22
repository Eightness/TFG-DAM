/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller.dto.mappers;

import albert.lozano.poketeambuilder.controller.dto.inputDTO.MoveInputDTO;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.MoveOutputDTO;
import albert.lozano.poketeambuilder.domain.Move;
import org.mapstruct.Mapper;

/**
 * MoveMapper interface. It's a mapper from MapStruct. Automatically maps DTOs. Extends from GenericDTOMapper, previously implemented.
 */
@Mapper(componentModel = "spring")
public interface MoveMapper extends GenericDTOMapper<MoveInputDTO, Move, MoveOutputDTO> {
}
