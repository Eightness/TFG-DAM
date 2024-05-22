/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.application.implementation;

import albert.lozano.poketeambuilder.application.services.GenericCRUDService;
import albert.lozano.poketeambuilder.controller.dto.inputDTO.CommentInputDTO;
import albert.lozano.poketeambuilder.controller.dto.mappers.CommentMapper;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.CommentOutputDTO;
import albert.lozano.poketeambuilder.domain.Comment;
import albert.lozano.poketeambuilder.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * CommentServiceImpl class. Implements GenericService interface and contains all methods related to Trainer's CRUD.
 */
@Service
public class CommentServiceImpl implements GenericCRUDService<CommentInputDTO, CommentOutputDTO, Long> {
    // Attributes
    @Autowired
    CommentRepository commentRepository;
    @Autowired
    CommentMapper commentMapper;


    @Override
    public CommentOutputDTO getEntityById(Long id) {
        Comment comment = commentRepository.findById(id).orElseThrow();
        return commentMapper.domainToOutput(comment);
    }

    @Override
    public List<CommentOutputDTO> getEntityByIds(List<Long> ids) {
        return null;
    }

    @Override
    public List<CommentOutputDTO> getAllEntities(int pageNumber, int pageSize) {
        List<Comment> allComments = commentRepository.findAll();
        return commentMapper.domainToOutput(allComments);
    }

    @Override
    public CommentOutputDTO addEntity(CommentInputDTO inputEntity) {
        Comment comment = commentMapper.inputToDomain(inputEntity);
        commentRepository.save(comment);
        return commentMapper.domainToOutput(comment);
    }

    @Override
    public List<CommentOutputDTO> addEntities(List<CommentInputDTO> inputEntities) {
        return null;
    }

    @Override
    public CommentOutputDTO updateEntity(Long id, CommentInputDTO inputEntity) {
        Comment comment = commentRepository.findById(id).orElseThrow();
        Comment updatedComment = commentMapper.inputToDomain(inputEntity);

        comment.setBody(updatedComment.getBody());
        comment.setCreatedDate(updatedComment.getCreatedDate());

        commentRepository.save(comment);
        return commentMapper.domainToOutput(comment);
    }

    @Override
    public List<CommentOutputDTO> updateEntities(Long ids, List<CommentInputDTO> inputEntities) {
        return null;
    }

    @Override
    public CommentOutputDTO modifyEntity(Long id, CommentInputDTO inputEntity) {
        return null;
    }

    @Override
    public List<CommentOutputDTO> modifyEntitiesByIds(List<Long> ids, List<CommentInputDTO> inputEntities) {
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
