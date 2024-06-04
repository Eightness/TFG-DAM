/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.dto.mappers;

import albert.lozano.poketeambuilder.dto.PokemonDTO;
import albert.lozano.poketeambuilder.domain.Pokemon;

import java.util.List;
import java.util.stream.Collectors;

/**
 * PokemonMapper interface. It's a mapper from MapStruct. Automatically maps DTOs. Extends from GenericDTOMapper, previously implemented.
 */
public class PokemonMapper implements GenericDTOMapper<PokemonDTO, Pokemon> {
    @Override
    public Pokemon DTOToDomain(PokemonDTO pokemonDTO) {
        Pokemon pokemon = new Pokemon();

        pokemon.setName(pokemonDTO.getName());
        pokemon.setSpriteUrl(pokemonDTO.getSpriteUrl());
        pokemon.setItem(pokemonDTO.getItem());
        pokemon.setAbility(pokemonDTO.getAbility());
        pokemon.setNature(pokemonDTO.getNature());
        pokemon.setShiny(pokemonDTO.isShiny());
        pokemon.setIvDef(pokemonDTO.getIvDef());
        pokemon.setIvAtk(pokemonDTO.getIvAtk());
        pokemon.setIvSpDef(pokemonDTO.getIvSpDef());
        pokemon.setIvSpAtk(pokemonDTO.getIvSpAtk());
        pokemon.setIvSpeed(pokemonDTO.getIvSpeed());
        pokemon.setIvHealth(pokemonDTO.getIvHealth());
        pokemon.setEvDef(pokemonDTO.getEvDef());
        pokemon.setEvAtk(pokemonDTO.getEvAtk());
        pokemon.setEvSpDef(pokemonDTO.getEvSpDef());
        pokemon.setEvSpAtk(pokemonDTO.getEvSpAtk());
        pokemon.setEvSpeed(pokemonDTO.getEvSpeed());
        pokemon.setEvHealth(pokemonDTO.getEvHealth());

        return pokemon;
    }

    @Override
    public List<Pokemon> DTOToDomain(List<PokemonDTO> pokemonDTOs) {
        return pokemonDTOs.stream().map(this::DTOToDomain).collect(Collectors.toList());
    }

    @Override
    public PokemonDTO domainToDTO(Pokemon pokemon) {
        PokemonDTO pokemonDTO = new PokemonDTO();

        pokemonDTO.setName(pokemon.getName());
        pokemonDTO.setSpriteUrl(pokemon.getSpriteUrl());
        pokemonDTO.setItem(pokemon.getItem());
        pokemonDTO.setAbility(pokemon.getAbility());
        pokemonDTO.setNature(pokemon.getNature());
        pokemonDTO.setShiny(pokemon.getShiny());
        pokemonDTO.setIvDef(pokemon.getIvDef());
        pokemonDTO.setIvAtk(pokemon.getIvAtk());
        pokemonDTO.setIvSpDef(pokemon.getIvSpDef());
        pokemonDTO.setIvSpAtk(pokemon.getIvSpAtk());
        pokemonDTO.setIvSpeed(pokemon.getIvSpeed());
        pokemonDTO.setIvHealth(pokemon.getIvHealth());
        pokemonDTO.setEvDef(pokemon.getEvDef());
        pokemonDTO.setEvAtk(pokemon.getEvAtk());
        pokemonDTO.setEvSpDef(pokemon.getEvSpDef());
        pokemonDTO.setEvSpAtk(pokemon.getEvSpAtk());
        pokemonDTO.setEvSpeed(pokemon.getEvSpeed());
        pokemonDTO.setEvHealth(pokemon.getEvHealth());

        return pokemonDTO;
    }

    @Override
    public List<PokemonDTO> domainToDTO(List<Pokemon> pokemons) {
        return pokemons.stream().map(this::domainToDTO).collect(Collectors.toList());
    }
}
