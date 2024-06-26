/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller;

import albert.lozano.poketeambuilder.application.implementation.TeamServiceImpl;
import albert.lozano.poketeambuilder.dto.TeamDTO;
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
    public ResponseEntity<TeamDTO> postTeam(@RequestBody TeamDTO teamDTO) {
        TeamDTO newTeam = teamService.addEntity(teamDTO);
        return new ResponseEntity<>(newTeam, HttpStatus.OK);
    }

    // Read methods
    @GetMapping("/get")
    public ResponseEntity<TeamDTO> getTeamById(@RequestParam long id) {
        TeamDTO team = teamService.getEntityById(id);
        return new ResponseEntity<>(team, HttpStatus.OK);
    }

    @GetMapping("/get-all")
    public ResponseEntity<List<TeamDTO>> getAllTeams() {
        List<TeamDTO> allTeams = teamService.getAllEntities(0, 10);
        return new ResponseEntity<>(allTeams, HttpStatus.OK);
    }

    @GetMapping("/get-all-public")
    public ResponseEntity<List<TeamDTO>> getAllPublicTeams() {
        List<TeamDTO> allPublicTeams = teamService.getAllPublicTeams();
        return new ResponseEntity<>(allPublicTeams, HttpStatus.OK);
    }

    @GetMapping("/teams-with-comments")
    public ResponseEntity<List<TeamDTO>> getTeamsWithComments() {
        List<TeamDTO> teamsWithComments = teamService.getTeamsWithComments();
        return ResponseEntity.ok(teamsWithComments);
    }


    // Update methods
    @PutMapping("/update")
    public ResponseEntity<TeamDTO> updateTeam(@RequestBody TeamDTO teamDTO, @RequestBody TeamDTO updatedTeamDTO) {
        TeamDTO updatedTeam = teamService.updateTeam(teamDTO, updatedTeamDTO);
        return new ResponseEntity<>(updatedTeam, HttpStatus.OK);
    }

    // Delete methods
    @DeleteMapping("/delete")
    public ResponseEntity<TeamDTO> deleteTeamById(@RequestParam long id) {
        teamService.deleteEntityById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-all")
    public ResponseEntity<TeamDTO> deleteAllTeams() {
        teamService.deleteAllEntities();
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/trainer/{username}")
    public ResponseEntity<List<TeamDTO>> getTeamsByTrainerUsername(@PathVariable String username) {
        List<TeamDTO> teams = teamService.getTeamsByTrainerUsername(username);
        return ResponseEntity.ok(teams);
    }

    @DeleteMapping("/delete/{teamName}/{trainerUsername}")
    public ResponseEntity<TeamDTO> deleteTeamByNameAndTrainerUsername(@PathVariable String teamName, @PathVariable String trainerUsername) {
        teamService.deleteTeamByNameAndTrainerUsername(teamName, trainerUsername);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/like")
    public ResponseEntity<TeamDTO> likeTeam(@RequestBody TeamDTO teamDTO) {
        TeamDTO likedTeam = teamService.likeTeam(teamDTO);
        return new ResponseEntity<>(likedTeam, HttpStatus.OK);
    }

    @PostMapping("/dislike")
    public ResponseEntity<TeamDTO> dislikeTeam(@RequestBody TeamDTO teamDTO) {
        TeamDTO likedTeam = teamService.dislikeTeam(teamDTO);
        return new ResponseEntity<>(likedTeam, HttpStatus.OK);
    }
}
