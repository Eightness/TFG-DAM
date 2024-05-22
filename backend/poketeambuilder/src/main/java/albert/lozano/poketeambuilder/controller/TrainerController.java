/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller;

import albert.lozano.poketeambuilder.application.implementation.TrainerServiceImpl;
import albert.lozano.poketeambuilder.controller.dto.inputDTO.TrainerInputDTO;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.TrainerOutputDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * TrainerController class. RestController to manage all HTTP methods for a Trainer.
 */
@RestController
@RequestMapping("/trainer")
public class TrainerController {
    // Attributes
    @Autowired
    private TrainerServiceImpl trainerService;

    // CRUD Methods
    // Create methods
    @PostMapping("/add")
    public ResponseEntity<TrainerOutputDTO> postTrainer(@RequestBody TrainerInputDTO trainerInputDTO) {
        TrainerOutputDTO newTrainer = trainerService.addEntity(trainerInputDTO);
        return new ResponseEntity<>(newTrainer, HttpStatus.OK);
    }

    // Read methods
    @GetMapping("/get")
    public ResponseEntity<TrainerOutputDTO> getTrainerById(@RequestParam long id) {
        TrainerOutputDTO trainer = trainerService.getEntityById(id);
        return new ResponseEntity<>(trainer, HttpStatus.OK);
    }

    @GetMapping("/get-all")
    public ResponseEntity<List<TrainerOutputDTO>> getAllTrainers() {
        List<TrainerOutputDTO> allTrainers = trainerService.getAllEntities(0, 10);
        return new ResponseEntity<>(allTrainers, HttpStatus.OK);
    }

    // Update Methods
    @PutMapping("/update")
    public ResponseEntity<TrainerOutputDTO> updateTrainerById(@RequestParam long id, @RequestBody TrainerInputDTO trainerInputDTO) {
        TrainerOutputDTO updatedTrainer = trainerService.updateEntity(id, trainerInputDTO);
        return new ResponseEntity<>(updatedTrainer, HttpStatus.OK);
    }

    // Delete methods
    @DeleteMapping("/delete")
    public ResponseEntity<TrainerOutputDTO> deleteTrainerById(@RequestParam long id) {
        trainerService.deleteEntityById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-all")
    public ResponseEntity<TrainerOutputDTO> deleteAllTrainers() {
        trainerService.deleteAllEntities();
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
