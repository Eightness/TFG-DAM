package albert.lozano.poketeambuilder.pokeapi.resource.ability;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.pokemon.Pokemon;

public class AbilityPokemon {

	private Boolean isHidden;
	private Integer slot;
	private NamedApiResource<Pokemon> pokemon;
	
	public Boolean getIsHidden() {
		return isHidden;
	}
	public void setIsHidden(Boolean isHidden) {
		this.isHidden = isHidden;
	}
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
