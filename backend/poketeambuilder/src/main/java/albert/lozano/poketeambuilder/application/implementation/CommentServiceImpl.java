/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.application.implementation;

import albert.lozano.poketeambuilder.application.services.GenericCRUDService;
import albert.lozano.poketeambuilder.dto.CommentDTO;
import albert.lozano.poketeambuilder.dto.mappers.CommentMapper;
import albert.lozano.poketeambuilder.domain.Comment;
import albert.lozano.poketeambuilder.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * CommentServiceImpl class. Implements GenericService interface and contains all methods related to Trainer's CRUD.
 */
@Service
public class CommentServiceImpl implements GenericCRUDService<CommentDTO, Long> {
    // Attributes
    @Autowired
    CommentRepository commentRepository;
    @Autowired
    CommentMapper commentMapper;

    // Methods
    @Override
    public CommentDTO getEntityById(Long id) {
        Comment comment = commentRepository.findById(id).orElseThrow();
        return commentMapper.domainToDTO(comment);
    }

    @Override
    public List<CommentDTO> getEntityByIds(List<Long> ids) {
        return null;
    }

    @Override
    public List<CommentDTO> getAllEntities(int pageNumber, int pageSize) {
        List<Comment> allComments = commentRepository.findAll();
        return commentMapper.domainToDTO(allComments);
    }

    @Override
    public CommentDTO addEntity(CommentDTO entityDTO) {
        Comment comment = commentMapper.DTOToDomain(entityDTO);
        commentRepository.save(comment);
        return commentMapper.domainToDTO(comment);
    }

    @Override
    public List<CommentDTO> addEntities(List<CommentDTO> entitiesDTO) {
        return null;
    }

    @Override
    public CommentDTO updateEntity(Long id, CommentDTO entityDTO) {
        Comment comment = commentRepository.findById(id).orElseThrow();
        Comment updatedComment = commentMapper.DTOToDomain(entityDTO);

        comment.setBody(updatedComment.getBody());
        comment.setCreatedDate(updatedComment.getCreatedDate());

        commentRepository.save(comment);
        return commentMapper.domainToDTO(comment);
    }

    @Override
    public List<CommentDTO> updateEntities(Long ids, List<CommentDTO> entitiesDTO) {
        return null;
    }

    @Override
    public CommentDTO modifyEntity(Long id, CommentDTO entityDTO) {
        return null;
    }

    @Override
    public List<CommentDTO> modifyEntitiesByIds(List<Long> ids, List<CommentDTO> entitiesDTO) {
        return null;
    }

    @Override
    public void deleteEntityById(Long id) {
        commentRepository.deleteById(id);
    }

    @Override
    public void deleteEntitiesByIds(List<Long> ids) {

    }

    @Override
    public void deleteAllEntities() {
        commentRepository.deleteAll();
    }
}
