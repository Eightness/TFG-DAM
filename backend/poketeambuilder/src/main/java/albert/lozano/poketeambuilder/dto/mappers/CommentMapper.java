/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.dto.mappers;

import albert.lozano.poketeambuilder.dto.CommentDTO;
import albert.lozano.poketeambuilder.domain.Comment;

import java.util.ArrayList;
import java.util.List;

/**
 * CommentMapper interface. It's a mapper from MapStruct. Automatically maps DTOs. Extends from GenericDTOMapper, previously implemented.
 */
public class CommentMapper implements GenericDTOMapper<CommentDTO, Comment> {
    @Override
    public Comment DTOToDomain(CommentDTO commentDTO) {
        Comment comment = new Comment();

        comment.setCreatedDate(commentDTO.getCreatedDate());
        comment.setBody(commentDTO.getBody());

        return comment;
    }

    @Override
    public List<Comment> DTOToDomain(List<CommentDTO> commentsDTO) {
        List<Comment> comments = new ArrayList<>();

        for (CommentDTO commentDTO : commentsDTO) {
            Comment comment = DTOToDomain(commentDTO);
            comments.add(comment);
        }

        return comments;
    }

    @Override
    public CommentDTO domainToDTO(Comment comment) {
        CommentDTO commentDTO = new CommentDTO();

        commentDTO.setCreatedDate(comment.getCreatedDate());
        commentDTO.setBody(comment.getBody());

        return commentDTO;
    }

    @Override
    public List<CommentDTO> domainToDTO(List<Comment> comments) {
        List<CommentDTO> commentsDTO = new ArrayList<>();

        for (Comment comment : comments) {
            CommentDTO commentDTO = domainToDTO(comment);
            commentsDTO.add(commentDTO);
        }

        return commentsDTO;
    }
}
