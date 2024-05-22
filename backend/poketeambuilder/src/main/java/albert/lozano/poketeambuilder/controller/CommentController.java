/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller;

import albert.lozano.poketeambuilder.application.implementation.CommentServiceImpl;
import albert.lozano.poketeambuilder.controller.dto.inputDTO.CommentInputDTO;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.CommentOutputDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * CommentController class. RestController to manage all HTTP methods for a Trainer.
 */
@RestController
@RequestMapping("/comment")
public class CommentController {
    // Attributes
    @Autowired
    private CommentServiceImpl commentService;

    // CRUD Methods
    // Create methods
    @PostMapping("/add")
    public ResponseEntity<CommentOutputDTO> postComment(@RequestBody CommentInputDTO commentInputDTO) {
        CommentOutputDTO newComment = commentService.addEntity(commentInputDTO);
        return new ResponseEntity<>(newComment, HttpStatus.OK);
    }

    // Read methods
    @GetMapping("/get")
    public ResponseEntity<CommentOutputDTO> getCommentById(@RequestParam long id) {
        CommentOutputDTO comment = commentService.getEntityById(id);
        return new ResponseEntity<>(comment, HttpStatus.OK);
    }

    @GetMapping("/get-all")
    public ResponseEntity<List<CommentOutputDTO>> getAllComments() {
        List<CommentOutputDTO> allComments = commentService.getAllEntities(0, 10);
        return new ResponseEntity<>(allComments, HttpStatus.OK);
    }

    // Update methods
    @PutMapping("/update")
    public ResponseEntity<CommentOutputDTO> updateComment(@RequestParam long id, @RequestBody CommentInputDTO commentInputDTO) {
        CommentOutputDTO updatedComment = commentService.updateEntity(id, commentInputDTO);
        return new ResponseEntity<>(updatedComment, HttpStatus.OK);
    }

    // Delete methods
    @DeleteMapping("/delete")
    public ResponseEntity<CommentOutputDTO> deleteCommentById(@RequestParam long id) {
        commentService.deleteEntityById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-all")
    public ResponseEntity<CommentOutputDTO> deleteAllComments() {
        commentService.deleteAllEntities();
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
