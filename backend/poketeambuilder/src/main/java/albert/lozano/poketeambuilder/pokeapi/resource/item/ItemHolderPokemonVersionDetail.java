package albert.lozano.poketeambuilder.pokeapi.resource.item;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.version.Version;

public class ItemHolderPokemonVersionDetail {

	private Integer rarity;
	private NamedApiResource<Version> version;
	
	public Integer getRarity() {
		return rarity;
	}
	public void setRarity(Integer rarity) {
		this.rarity = rarity;
	}
	public NamedApiResource<Version> getVersion() {
		return version;
	}
	public void setVersion(NamedApiResource<Version> version) {
		this.version = version;
	}
	
}
