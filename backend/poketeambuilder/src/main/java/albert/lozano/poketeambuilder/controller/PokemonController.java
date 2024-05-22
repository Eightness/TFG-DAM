/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller;

import albert.lozano.poketeambuilder.application.implementation.PokemonServiceImpl;
import albert.lozano.poketeambuilder.controller.dto.inputDTO.PokemonInputDTO;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.PokemonOutputDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * PokemonController class. RestController to manage all HTTP methods for a Trainer.
 */
@RestController
@RequestMapping("/pokemon")
public class PokemonController {
    // Attributes
    @Autowired
    private PokemonServiceImpl pokemonService;

    // CRUD Methods
    // Create methods
    @PostMapping("/add")
    public ResponseEntity<PokemonOutputDTO> postPokemon(@RequestBody PokemonInputDTO pokemonInputDTO) {
        PokemonOutputDTO newPokemon = pokemonService.addEntity(pokemonInputDTO);
        return new ResponseEntity<>(newPokemon, HttpStatus.OK);
    }

    // Read methods
    @GetMapping("/get")
    public ResponseEntity<PokemonOutputDTO> getPokemonById(@RequestParam long id) {
        PokemonOutputDTO pokemon = pokemonService.getEntityById(id);
        return new ResponseEntity<>(pokemon, HttpStatus.OK);
    }

    @GetMapping("/get-all")
    public ResponseEntity<List<PokemonOutputDTO>> getAllPokemon() {
        List<PokemonOutputDTO> allPokemon = pokemonService.getAllEntities(0, 10);
        return new ResponseEntity<>(allPokemon, HttpStatus.OK);
    }

    // Update methods
    @PutMapping("/update")
    public ResponseEntity<PokemonOutputDTO> updatePokemon(@RequestParam long id, @RequestBody PokemonInputDTO pokemonInputDTO) {
        PokemonOutputDTO updatedPokemon = pokemonService.updateEntity(id, pokemonInputDTO);
        return new ResponseEntity<>(updatedPokemon, HttpStatus.OK);
    }

    // Delete methods
    @DeleteMapping("/delete")
    public ResponseEntity<PokemonOutputDTO> deletePokemonById(@RequestParam long id) {
        pokemonService.deleteEntityById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-all")
    public ResponseEntity<PokemonOutputDTO> deleteAllPokemon() {
        pokemonService.deleteAllEntities();
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
