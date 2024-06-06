/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.application.implementation;

import albert.lozano.poketeambuilder.application.services.GenericCRUDService;
import albert.lozano.poketeambuilder.domain.Team;
import albert.lozano.poketeambuilder.dto.PokemonDTO;
import albert.lozano.poketeambuilder.dto.mappers.PokemonMapper;
import albert.lozano.poketeambuilder.domain.Pokemon;
import albert.lozano.poketeambuilder.repository.PokemonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * PokemonServiceImpl class. Implements GenericService interface and contains all methods related to Team's CRUD.
 */
@Service
public class PokemonServiceImpl implements GenericCRUDService<PokemonDTO, Long> {
    // Attributes
    @Autowired
    PokemonRepository pokemonRepository;
    @Autowired
    PokemonMapper pokemonMapper;

    // Methods
    @Override
    public PokemonDTO getEntityById(Long id) {
        Pokemon pokemon = pokemonRepository.findById(id).orElseThrow();
        return pokemonMapper.domainToDTO(pokemon);
    }

    @Override
    public List<PokemonDTO> getEntityByIds(List<Long> ids) {
        return null;
    }

    @Override
    public List<PokemonDTO> getAllEntities(int pageNumber, int pageSize) {
        List<Pokemon> allPokemon = pokemonRepository.findAll();
        return pokemonMapper.domainToDTO(allPokemon);
    }

    @Override
    public PokemonDTO addEntity(PokemonDTO entityDTO) {
        Pokemon pokemon = pokemonMapper.DTOToDomain(entityDTO);
        pokemonRepository.save(pokemon);
        return pokemonMapper.domainToDTO(pokemon);
    }

    public PokemonDTO addEntity(PokemonDTO entityDTO, Team team) {
        Pokemon pokemon = pokemonMapper.DTOToDomain(entityDTO, team);
        pokemonRepository.save(pokemon);
        return pokemonMapper.domainToDTO(pokemon);
    }

    @Override
    public List<PokemonDTO> addEntities(List<PokemonDTO> entitiesDTO) {
        return null;
    }

    @Override
    public PokemonDTO updateEntity(Long id, PokemonDTO entityDTO) {
        Pokemon pokemon = pokemonRepository.findById(id).orElseThrow();
        Pokemon updatedPokemon = pokemonMapper.DTOToDomain(entityDTO);

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
        return pokemonMapper.domainToDTO(pokemon);
    }

    @Override
    public List<PokemonDTO> updateEntities(Long ids, List<PokemonDTO> entitiesDTO) {
        return null;
    }

    @Override
    public PokemonDTO modifyEntity(Long id, PokemonDTO entityDTO) {
        return null;
    }

    @Override
    public List<PokemonDTO> modifyEntitiesByIds(List<Long> ids, List<PokemonDTO> entitiesDTO) {
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
