/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller;

import albert.lozano.poketeambuilder.application.implementation.TeamServiceImpl;
import albert.lozano.poketeambuilder.controller.dto.inputDTO.TeamInputDTO;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.TeamOutputDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * TeamController class. RestController to manage all HTTP methods for a Trainer.
 */
@RestController
@RequestMapping("/team")
public class TeamController {
    // Attributes
    @Autowired
    private TeamServiceImpl teamService;

    // CRUD Methods
    // Create methods
    @PostMapping("/add")
    public ResponseEntity<TeamOutputDTO> postTeam(@RequestBody TeamInputDTO teamInputDTO) {
        TeamOutputDTO newTeam = teamService.addEntity(teamInputDTO);
        return new ResponseEntity<>(newTeam, HttpStatus.OK);
    }

    // Read methods
    @GetMapping("/get")
    public ResponseEntity<TeamOutputDTO> getTeamById(@RequestParam long id) {
        TeamOutputDTO team = teamService.getEntityById(id);
        return new ResponseEntity<>(team, HttpStatus.OK);
    }

    @GetMapping("/get-all")
    public ResponseEntity<List<TeamOutputDTO>> getAllTeams() {
        List<TeamOutputDTO> allTeams = teamService.getAllEntities(0, 10);
        return new ResponseEntity<>(allTeams, HttpStatus.OK);
    }

    // Update methods
    @PutMapping("/update")
    public ResponseEntity<TeamOutputDTO> updateTeam(@RequestParam long id, @RequestBody TeamInputDTO teamInputDTO) {
        TeamOutputDTO updatedTeam = teamService.updateEntity(id, teamInputDTO);
        return new ResponseEntity<>(updatedTeam, HttpStatus.OK);
    }

    // Delete methods
    @DeleteMapping("/delete")
    public ResponseEntity<TeamOutputDTO> deleteTeamById(@RequestParam long id) {
        teamService.deleteEntityById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-all")
    public ResponseEntity<TeamOutputDTO> deleteAllTeams() {
        teamService.deleteAllEntities();
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
