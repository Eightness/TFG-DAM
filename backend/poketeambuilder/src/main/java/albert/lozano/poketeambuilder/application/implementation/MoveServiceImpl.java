/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.application.implementation;

import albert.lozano.poketeambuilder.application.services.GenericCRUDService;
import albert.lozano.poketeambuilder.controller.dto.inputDTO.MoveInputDTO;
import albert.lozano.poketeambuilder.controller.dto.mappers.MoveMapper;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.MoveOutputDTO;
import albert.lozano.poketeambuilder.domain.Move;
import albert.lozano.poketeambuilder.repository.MoveRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * MoveServiceImpl class. Implements GenericService interface and contains all methods related to Trainer's CRUD.
 */
@Service
public class MoveServiceImpl implements GenericCRUDService<MoveInputDTO, MoveOutputDTO, Long> {
    // Attributes
    @Autowired
    MoveRepository moveRepository;
    @Autowired
    MoveMapper moveMapper;

    // Methods
    @Override
    public MoveOutputDTO getEntityById(Long id) {
        Move move = moveRepository.findById(id).orElseThrow();
        return moveMapper.domainToOutput(move);
    }

    @Override
    public List<MoveOutputDTO> getEntityByIds(List<Long> ids) {
        return null;
    }

    @Override
    public List<MoveOutputDTO> getAllEntities(int pageNumber, int pageSize) {
        List<Move> allMoves = moveRepository.findAll();
        return moveMapper.domainToOutput(allMoves);
    }

    @Override
    public MoveOutputDTO addEntity(MoveInputDTO inputEntity) {
        Move move = moveMapper.inputToDomain(inputEntity);
        moveRepository.save(move);
        return moveMapper.domainToOutput(move);
    }

    @Override
    public List<MoveOutputDTO> addEntities(List<MoveInputDTO> inputEntities) {
        return null;
    }

    @Override
    public MoveOutputDTO updateEntity(Long id, MoveInputDTO inputEntity) {
        Move move = moveRepository.findById(id).orElseThrow();
        Move updatedMove = moveMapper.inputToDomain(inputEntity);

        move.setName(updatedMove.getName());

        moveRepository.save(move);
        return moveMapper.domainToOutput(move);
    }

    @Override
    public List<MoveOutputDTO> updateEntities(Long ids, List<MoveInputDTO> inputEntities) {
        return null;
    }

    @Override
    public MoveOutputDTO modifyEntity(Long id, MoveInputDTO inputEntity) {
        return null;
    }

    @Override
    public List<MoveOutputDTO> modifyEntitiesByIds(List<Long> ids, List<MoveInputDTO> inputEntities) {
        return null;
    }

    @Override
    public void deleteEntityById(Long id) {
        moveRepository.deleteById(id);
    }

    @Override
    public void deleteEntitiesByIds(List<Long> ids) {

    }

    @Override
    public void deleteAllEntities() {
        moveRepository.deleteAll();
    }
}
