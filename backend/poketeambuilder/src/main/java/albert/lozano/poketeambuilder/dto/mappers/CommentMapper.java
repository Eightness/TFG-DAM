package albert.lozano.poketeambuilder.dto.mappers;

import albert.lozano.poketeambuilder.domain.Comment;
import albert.lozano.poketeambuilder.domain.Trainer;
import albert.lozano.poketeambuilder.dto.CommentDTO;
import albert.lozano.poketeambuilder.repository.TrainerRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * CommentMapper class. Implements the mapping between CommentDTO and Comment.
 */
public class CommentMapper implements GenericDTOMapper<CommentDTO, Comment> {
    // Attributes
    @Autowired
    private TrainerTeamMapper trainerTeamMapper;
    @Autowired
    private TrainerRepository trainerRepository;

    @Override
    public Comment DTOToDomain(CommentDTO commentDTO) {
        Comment comment = new Comment();

        comment.setCreatedDate(commentDTO.getCreatedDate());
        comment.setBody(commentDTO.getBody());

        if (commentDTO.getTrainer() != null) {
            Trainer trainer = trainerRepository.findByUsername(commentDTO.getTrainer().getUsername());
            comment.setTrainer(trainer);
        }

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

        if (comment.getTrainer() != null) {
            commentDTO.setTrainer(trainerTeamMapper.trainerToTrainerDTO(comment.getTrainer()));
        }

        // Assuming Comment is associated with a single team for simplicity
        if (comment.getTeams() != null && !comment.getTeams().isEmpty()) {
            commentDTO.setTeam(trainerTeamMapper.teamToTeamDTO(comment.getTeams().get(0).getTeam()));
        }

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
