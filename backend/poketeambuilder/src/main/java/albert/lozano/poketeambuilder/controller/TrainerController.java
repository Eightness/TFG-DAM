/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller;

import albert.lozano.poketeambuilder.application.implementation.TrainerServiceImpl;
import albert.lozano.poketeambuilder.dto.TrainerDTO;
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
    public ResponseEntity<TrainerDTO> postTrainer(@RequestBody TrainerDTO trainerDTO) {
        TrainerDTO newTrainer = trainerService.addEntity(trainerDTO);
        return new ResponseEntity<>(newTrainer, HttpStatus.OK);
    }

    // Read methods
    @GetMapping("/get")
    public ResponseEntity<TrainerDTO> getTrainerByUsername(@RequestParam String username) {
        TrainerDTO trainer = trainerService.getTrainerByUsername(username);
        return new ResponseEntity<>(trainer, HttpStatus.OK);
    }

    @GetMapping("/get-all")
    public ResponseEntity<List<TrainerDTO>> getAllTrainers() {
        List<TrainerDTO> allTrainers = trainerService.getAllEntities(0, 10);
        return new ResponseEntity<>(allTrainers, HttpStatus.OK);
    }

    // Update Methods
    @PutMapping("/update")
    public ResponseEntity<TrainerDTO> updateTrainerById(@RequestParam long id, @RequestBody TrainerDTO trainerDTO) {
        TrainerDTO updatedTrainer = trainerService.updateEntity(id, trainerDTO);
        return new ResponseEntity<>(updatedTrainer, HttpStatus.OK);
    }

    @PutMapping("/update-current")
    public ResponseEntity<TrainerDTO> updateCurrentTrainerByUsername(@RequestBody TrainerDTO trainerDTO) {
        TrainerDTO updatedTrainer = trainerService.updateCurrentTrainer(trainerDTO);
        return new ResponseEntity<>(updatedTrainer, HttpStatus.OK);
    }

    // Delete methods
    @DeleteMapping("/delete")
    public ResponseEntity<TrainerDTO> deleteTrainerById(@RequestParam long id) {
        trainerService.deleteEntityById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    @DeleteMapping("/delete-current")
    public ResponseEntity<TrainerDTO> deleteCurrentTrainer(@RequestBody TrainerDTO trainerDTO) {
        trainerService.deleteCurrentTrainer(trainerDTO);
        return new ResponseEntity<>(HttpStatus.OK);
    }


    @DeleteMapping("/delete-all")
    public ResponseEntity<TrainerDTO> deleteAllTrainers() {
        trainerService.deleteAllEntities();
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/check-exists-username")
    public boolean checkTrainerExistsByUsername(@RequestParam String username) {
        if (username != null && !username.isEmpty()) {
            return trainerService.existsByUsername(username);
        } else {
            return false;
        }
    }

    @GetMapping("/check-exists-email")
    public boolean checkTrainerExistsByEmail(@RequestParam String email) {
        if (email != null && !email.isEmpty()) {
            return trainerService.existsByEmail(email);
        } else {
            return false;
        }
    }

    @GetMapping("/check-credentials")
    public boolean checkTrainerCredentials(@RequestParam String username,
                                           @RequestParam String password) {
        if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) {
            return trainerService.checkCredentials(username, password);
        } else {
            return false;
        }
    }

}
