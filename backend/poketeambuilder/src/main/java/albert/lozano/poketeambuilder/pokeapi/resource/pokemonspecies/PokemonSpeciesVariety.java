package albert.lozano.poketeambuilder.pokeapi.resource.pokemonspecies;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.pokemon.Pokemon;

public class PokemonSpeciesVariety {

	private Boolean isDefault;
	private NamedApiResource<Pokemon> pokemon;
	
	public Boolean getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}
	public NamedApiResource<Pokemon> getPokemon() {
		return pokemon;
	}
	public void setPokemon(NamedApiResource<Pokemon> pokemon) {
		this.pokemon = pokemon;
	}
	
}
