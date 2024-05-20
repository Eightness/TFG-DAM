package albert.lozano.poketeambuilder.pokeapi.resource.type;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.pokemon.Pokemon;

public class TypePokemon {

	private Integer slot;
	private NamedApiResource<Pokemon> pokemon;
	
	public Integer getSlot() {
		return slot;
	}
	public void setSlot(Integer slot) {
		this.slot = slot;
	}
	public NamedApiResource<Pokemon> getPokemon() {
		return pokemon;
	}
	public void setPokemon(NamedApiResource<Pokemon> pokemon) {
		this.pokemon = pokemon;
	}
	
}
