package albert.lozano.poketeambuilder.pokeapi.resource.locationarea;

import java.util.List;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.VersionEncounterDetail;
import albert.lozano.poketeambuilder.pokeapi.resource.pokemon.Pokemon;

public class PokemonEncounter {

	private NamedApiResource<Pokemon> pokemon;
	private List<VersionEncounterDetail> versionDetails;
	
	public NamedApiResource<Pokemon> getPokemon() {
		return pokemon;
	}
	public void setPokemon(NamedApiResource<Pokemon> pokemon) {
		this.pokemon = pokemon;
	}
	public List<VersionEncounterDetail> getVersionDetails() {
		return versionDetails;
	}
	public void setVersionDetails(List<VersionEncounterDetail> versionDetails) {
		this.versionDetails = versionDetails;
	}
	
}
