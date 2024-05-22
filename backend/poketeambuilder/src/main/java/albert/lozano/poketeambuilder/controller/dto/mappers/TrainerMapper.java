/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller.dto.mappers;

import albert.lozano.poketeambuilder.controller.dto.inputDTO.TrainerInputDTO;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.TrainerOutputDTO;
import albert.lozano.poketeambuilder.domain.Trainer;
import org.mapstruct.Mapper;

/**
 * TrainerMapper interface. It's a mapper from MapStruct. Automatically maps DTOs. Extends from GenericDTOMapper, previously implemented.
 */
@Mapper(componentModel = "spring")
public interface TrainerMapper extends GenericDTOMapper<TrainerInputDTO, Trainer, TrainerOutputDTO> {
}
