/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller.dto.mappers;

import albert.lozano.poketeambuilder.controller.dto.inputDTO.CommentInputDTO;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.CommentOutputDTO;
import albert.lozano.poketeambuilder.domain.Comment;
import org.mapstruct.Mapper;

/**
 * CommentMapper interface. It's a mapper from MapStruct. Automatically maps DTOs. Extends from GenericDTOMapper, previously implemented.
 */
@Mapper(componentModel = "spring")
public interface CommentMapper extends GenericDTOMapper<CommentInputDTO, Comment, CommentOutputDTO> {
}
