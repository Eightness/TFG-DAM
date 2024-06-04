/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller;

import albert.lozano.poketeambuilder.application.implementation.CommentServiceImpl;
import albert.lozano.poketeambuilder.dto.CommentDTO;
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
    public ResponseEntity<CommentDTO> postComment(@RequestBody CommentDTO commentDTO) {
        CommentDTO newComment = commentService.addEntity(commentDTO);
        return new ResponseEntity<>(newComment, HttpStatus.OK);
    }

    // Read methods
    @GetMapping("/get")
    public ResponseEntity<CommentDTO> getCommentById(@RequestParam long id) {
        CommentDTO comment = commentService.getEntityById(id);
        return new ResponseEntity<>(comment, HttpStatus.OK);
    }

    @GetMapping("/get-all")
    public ResponseEntity<List<CommentDTO>> getAllComments() {
        List<CommentDTO> allComments = commentService.getAllEntities(0, 10);
        return new ResponseEntity<>(allComments, HttpStatus.OK);
    }

    // Update methods
    @PutMapping("/update")
    public ResponseEntity<CommentDTO> updateComment(@RequestParam long id, @RequestBody CommentDTO commentDTO) {
        CommentDTO updatedComment = commentService.updateEntity(id, commentDTO);
        return new ResponseEntity<>(updatedComment, HttpStatus.OK);
    }

    // Delete methods
    @DeleteMapping("/delete")
    public ResponseEntity<CommentDTO> deleteCommentById(@RequestParam long id) {
        commentService.deleteEntityById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-all")
    public ResponseEntity<CommentDTO> deleteAllComments() {
        commentService.deleteAllEntities();
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
