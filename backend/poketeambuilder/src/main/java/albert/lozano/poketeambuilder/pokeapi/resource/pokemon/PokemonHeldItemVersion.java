package albert.lozano.poketeambuilder.pokeapi.resource.pokemon;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.version.Version;

public class PokemonHeldItemVersion {

	private NamedApiResource<Version> version;
	private Integer rarity;
	
	public NamedApiResource<Version> getVersion() {
		return version;
	}
	public void setVersion(NamedApiResource<Version> version) {
		this.version = version;
	}
	public Integer getRarity() {
		return rarity;
	}
	public void setRarity(Integer rarity) {
		this.rarity = rarity;
	}
	
}
