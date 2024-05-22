/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller;

import albert.lozano.poketeambuilder.application.implementation.MoveServiceImpl;
import albert.lozano.poketeambuilder.controller.dto.inputDTO.MoveInputDTO;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.MoveOutputDTO;
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
    public ResponseEntity<MoveOutputDTO> postMove(@RequestBody MoveInputDTO moveInputDTO) {
        MoveOutputDTO newMove = moveService.addEntity(moveInputDTO);
        return new ResponseEntity<>(newMove, HttpStatus.OK);
    }

    // Read methods
    @GetMapping("/get")
    public ResponseEntity<MoveOutputDTO> getMoveById(@RequestParam long id) {
        MoveOutputDTO move = moveService.getEntityById(id);
        return new ResponseEntity<>(move, HttpStatus.OK);
    }

    @GetMapping("/get-all")
    public ResponseEntity<List<MoveOutputDTO>> getAllMoves() {
        List<MoveOutputDTO> allMoves = moveService.getAllEntities(0, 10);
        return new ResponseEntity<>(allMoves, HttpStatus.OK);
    }

    // Update methods
    @PutMapping("/update")
    public ResponseEntity<MoveOutputDTO> updateMove(@RequestParam long id, @RequestBody MoveInputDTO moveInputDTO) {
        MoveOutputDTO updatedMove = moveService.updateEntity(id, moveInputDTO);
        return new ResponseEntity<>(updatedMove, HttpStatus.OK);
    }

    // Delete methods
    @DeleteMapping("/delete")
    public ResponseEntity<MoveOutputDTO> deleteMoveById(@RequestParam long id) {
        moveService.deleteEntityById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-all")
    public ResponseEntity<MoveOutputDTO> deleteAllMoves() {
        moveService.deleteAllEntities();
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
