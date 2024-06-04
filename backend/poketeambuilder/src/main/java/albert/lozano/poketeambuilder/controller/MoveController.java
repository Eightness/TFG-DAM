/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller;

import albert.lozano.poketeambuilder.application.implementation.MoveServiceImpl;
import albert.lozano.poketeambuilder.dto.MoveDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * MoveController class. RestController to manage all HTTP methods for a Trainer.
 */
@RestController
@RequestMapping("/move")
public class MoveController {
    // Attributes
    @Autowired
    private MoveServiceImpl moveService;

    // CRUD Methods
    // Create methods
    @PostMapping("/add")
    public ResponseEntity<MoveDTO> postMove(@RequestBody MoveDTO moveDTO) {
        MoveDTO newMove = moveService.addEntity(moveDTO);
        return new ResponseEntity<>(newMove, HttpStatus.OK);
    }

    // Read methods
    @GetMapping("/get")
    public ResponseEntity<MoveDTO> getMoveById(@RequestParam long id) {
        MoveDTO move = moveService.getEntityById(id);
        return new ResponseEntity<>(move, HttpStatus.OK);
    }

    @GetMapping("/get-all")
    public ResponseEntity<List<MoveDTO>> getAllMoves() {
        List<MoveDTO> allMoves = moveService.getAllEntities(0, 10);
        return new ResponseEntity<>(allMoves, HttpStatus.OK);
    }

    // Update methods
    @PutMapping("/update")
    public ResponseEntity<MoveDTO> updateMove(@RequestParam long id, @RequestBody MoveDTO moveDTO) {
        MoveDTO updatedMove = moveService.updateEntity(id, moveDTO);
        return new ResponseEntity<>(updatedMove, HttpStatus.OK);
    }

    // Delete methods
    @DeleteMapping("/delete")
    public ResponseEntity<MoveDTO> deleteMoveById(@RequestParam long id) {
        moveService.deleteEntityById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-all")
    public ResponseEntity<MoveDTO> deleteAllMoves() {
        moveService.deleteAllEntities();
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
