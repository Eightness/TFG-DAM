/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.controller;

import albert.lozano.poketeambuilder.application.implementation.PokemonServiceImpl;
import albert.lozano.poketeambuilder.dto.PokemonDTO;
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
    public ResponseEntity<PokemonDTO> postPokemon(@RequestBody PokemonDTO pokemonDTO) {
        PokemonDTO newPokemon = pokemonService.addEntity(pokemonDTO);
        return new ResponseEntity<>(newPokemon, HttpStatus.OK);
    }

    // Read methods
    @GetMapping("/get")
    public ResponseEntity<PokemonDTO> getPokemonById(@RequestParam long id) {
        PokemonDTO pokemon = pokemonService.getEntityById(id);
        return new ResponseEntity<>(pokemon, HttpStatus.OK);
    }

    @GetMapping("/get-all")
    public ResponseEntity<List<PokemonDTO>> getAllPokemon() {
        List<PokemonDTO> allPokemon = pokemonService.getAllEntities(0, 10);
        return new ResponseEntity<>(allPokemon, HttpStatus.OK);
    }

    // Update methods
    @PutMapping("/update")
    public ResponseEntity<PokemonDTO> updatePokemon(@RequestParam long id, @RequestBody PokemonDTO pokemonDTO) {
        PokemonDTO updatedPokemon = pokemonService.updateEntity(id, pokemonDTO);
        return new ResponseEntity<>(updatedPokemon, HttpStatus.OK);
    }

    // Delete methods
    @DeleteMapping("/delete")
    public ResponseEntity<PokemonDTO> deletePokemonById(@RequestParam long id) {
        pokemonService.deleteEntityById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-all")
    public ResponseEntity<PokemonDTO> deleteAllPokemon() {
        pokemonService.deleteAllEntities();
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
