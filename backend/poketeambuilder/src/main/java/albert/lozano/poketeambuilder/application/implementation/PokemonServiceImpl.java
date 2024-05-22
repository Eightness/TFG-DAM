/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.application.implementation;

import albert.lozano.poketeambuilder.application.services.GenericCRUDService;
import albert.lozano.poketeambuilder.controller.dto.inputDTO.PokemonInputDTO;
import albert.lozano.poketeambuilder.controller.dto.mappers.PokemonMapper;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.PokemonOutputDTO;
import albert.lozano.poketeambuilder.domain.Pokemon;
import albert.lozano.poketeambuilder.repository.PokemonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * PokemonServiceImpl class. Implements GenericService interface and contains all methods related to Team's CRUD.
 */
@Service
public class PokemonServiceImpl implements GenericCRUDService<PokemonInputDTO, PokemonOutputDTO, Long> {
    // Attributes
    @Autowired
    PokemonRepository pokemonRepository;
    @Autowired
    PokemonMapper pokemonMapper;

    // Methods
    @Override
    public PokemonOutputDTO getEntityById(Long id) {
        Pokemon pokemon = pokemonRepository.findById(id).orElseThrow();
        return pokemonMapper.domainToOutput(pokemon);
    }

    @Override
    public List<PokemonOutputDTO> getEntityByIds(List<Long> ids) {
        return null;
    }

    @Override
    public List<PokemonOutputDTO> getAllEntities(int pageNumber, int pageSize) {
        List<Pokemon> allPokemon = pokemonRepository.findAll();
        return pokemonMapper.domainToOutput(allPokemon);
    }

    @Override
    public PokemonOutputDTO addEntity(PokemonInputDTO inputEntity) {
        Pokemon pokemon = pokemonMapper.inputToDomain(inputEntity);
        pokemonRepository.save(pokemon);
        return pokemonMapper.domainToOutput(pokemon);
    }

    @Override
    public List<PokemonOutputDTO> addEntities(List<PokemonInputDTO> inputEntities) {
        return null;
    }

    @Override
    public PokemonOutputDTO updateEntity(Long id, PokemonInputDTO inputEntity) {
        Pokemon pokemon = pokemonRepository.findById(id).orElseThrow();
        Pokemon updatedPokemon = pokemonMapper.inputToDomain(inputEntity);

        pokemon.setName(updatedPokemon.getName());
        pokemon.setSpriteUrl(updatedPokemon.getSpriteUrl());
        pokemon.setNature(updatedPokemon.getNature());
        pokemon.setAbility(updatedPokemon.getAbility());
        pokemon.setItem(updatedPokemon.getItem());
        pokemon.setShiny(updatedPokemon.getShiny());
        // Statistics
        // Evs
        pokemon.setEvAtk(updatedPokemon.getEvAtk());
        pokemon.setEvSpAtk(updatedPokemon.getEvSpAtk());
        pokemon.setEvDef(updatedPokemon.getEvDef());
        pokemon.setEvSpDef(updatedPokemon.getEvSpDef());
        pokemon.setEvSpeed(updatedPokemon.getEvSpeed());
        pokemon.setEvHealth(updatedPokemon.getEvHealth());
        // Ivs
        pokemon.setIvAtk(updatedPokemon.getIvAtk());
        pokemon.setIvSpAtk(updatedPokemon.getIvSpAtk());
        pokemon.setIvDef(updatedPokemon.getIvDef());
        pokemon.setIvSpDef(updatedPokemon.getIvSpDef());
        pokemon.setIvSpeed(updatedPokemon.getIvSpeed());
        pokemon.setIvHealth(updatedPokemon.getIvHealth());

        pokemonRepository.save(pokemon);
        return pokemonMapper.domainToOutput(pokemon);
    }

    @Override
    public List<PokemonOutputDTO> updateEntities(Long ids, List<PokemonInputDTO> inputEntities) {
        return null;
    }

    @Override
    public PokemonOutputDTO modifyEntity(Long id, PokemonInputDTO inputEntity) {
        return null;
    }

    @Override
    public List<PokemonOutputDTO> modifyEntitiesByIds(List<Long> ids, List<PokemonInputDTO> inputEntities) {
        return null;
    }

    @Override
    public void deleteEntityById(Long id) {
        pokemonRepository.deleteById(id);
    }

    @Override
    public void deleteEntitiesByIds(List<Long> ids) {

    }

    @Override
    public void deleteAllEntities() {
        pokemonRepository.deleteAll();
    }
}
