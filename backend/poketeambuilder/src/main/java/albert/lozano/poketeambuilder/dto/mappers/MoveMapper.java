/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.dto.mappers;

import albert.lozano.poketeambuilder.dto.MoveDTO;
import albert.lozano.poketeambuilder.domain.Move;

import java.util.ArrayList;
import java.util.List;

/**
 * MoveMapper interface. It's a mapper from MapStruct. Automatically maps DTOs. Extends from GenericDTOMapper, previously implemented.
 */
public class MoveMapper implements GenericDTOMapper<MoveDTO, Move> {
    @Override
    public Move DTOToDomain(MoveDTO moveDTO) {
        Move move = new Move();

        move.setName(moveDTO.getName());

        return move;
    }

    @Override
    public List<Move> DTOToDomain(List<MoveDTO> movesDTO) {
        List<Move> moves = new ArrayList<>();

        for (MoveDTO moveDTO : movesDTO) {
            Move move = DTOToDomain(moveDTO);
            moves.add(move);
        }

        return moves;
    }

    @Override
    public MoveDTO domainToDTO(Move move) {
        MoveDTO moveDTO = new MoveDTO();

        moveDTO.setName(move.getName());

        return moveDTO;
    }

    @Override
    public List<MoveDTO> domainToDTO(List<Move> moves) {
        List<MoveDTO> movesDTO = new ArrayList<>();

        for (Move move : moves) {
            MoveDTO moveDTO = domainToDTO(move);
            movesDTO.add(moveDTO);
        }

        return movesDTO;
    }
}
