/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.application.implementation;

import albert.lozano.poketeambuilder.application.services.GenericCRUDService;
import albert.lozano.poketeambuilder.dto.MoveDTO;
import albert.lozano.poketeambuilder.dto.mappers.MoveMapper;
import albert.lozano.poketeambuilder.domain.Move;
import albert.lozano.poketeambuilder.repository.MoveRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * MoveServiceImpl class. Implements GenericService interface and contains all methods related to Trainer's CRUD.
 */
@Service
public class MoveServiceImpl implements GenericCRUDService<MoveDTO, Long> {
    // Attributes
    @Autowired
    MoveRepository moveRepository;
    @Autowired
    MoveMapper moveMapper;

    // Methods
    @Override
    public MoveDTO getEntityById(Long id) {
        Move move = moveRepository.findById(id).orElseThrow();
        return moveMapper.domainToDTO(move);
    }

    @Override
    public List<MoveDTO> getEntityByIds(List<Long> ids) {
        return null;
    }

    @Override
    public List<MoveDTO> getAllEntities(int pageNumber, int pageSize) {
        List<Move> allMoves = moveRepository.findAll();
        return moveMapper.domainToDTO(allMoves);
    }

    @Override
    public MoveDTO addEntity(MoveDTO entityDTO) {
        Move move = moveMapper.DTOToDomain(entityDTO);
        moveRepository.save(move);
        return moveMapper.domainToDTO(move);
    }

    @Override
    public List<MoveDTO> addEntities(List<MoveDTO> entitiesDTO) {
        return null;
    }

    @Override
    public MoveDTO updateEntity(Long id, MoveDTO entityDTO) {
        Move move = moveRepository.findById(id).orElseThrow();
        Move updatedMove = moveMapper.DTOToDomain(entityDTO);

        move.setName(updatedMove.getName());

        moveRepository.save(move);
        return moveMapper.domainToDTO(move);
    }

    @Override
    public List<MoveDTO> updateEntities(Long ids, List<MoveDTO> entitiesDTO) {
        return null;
    }

    @Override
    public MoveDTO modifyEntity(Long id, MoveDTO entityDTO) {
        return null;
    }

    @Override
    public List<MoveDTO> modifyEntitiesByIds(List<Long> ids, List<MoveDTO> entitiesDTO) {
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
