/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller.dto.mappers;

import albert.lozano.poketeambuilder.controller.dto.inputDTO.PokemonInputDTO;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.PokemonOutputDTO;
import albert.lozano.poketeambuilder.domain.Pokemon;
import org.mapstruct.Mapper;

/**
 * PokemonMapper interface. It's a mapper from MapStruct. Automatically maps DTOs. Extends from GenericDTOMapper, previously implemented.
 */
@Mapper(componentModel = "spring")
public interface PokemonMapper extends GenericDTOMapper<PokemonInputDTO, Pokemon, PokemonOutputDTO> {
}
