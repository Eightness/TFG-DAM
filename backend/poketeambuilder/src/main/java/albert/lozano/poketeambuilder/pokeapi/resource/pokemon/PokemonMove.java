package albert.lozano.poketeambuilder.pokeapi.resource.pokemon;

import java.util.List;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.move.Move;

public class PokemonMove {

	private NamedApiResource<Move> move;
	private List<PokemonMoveVersion> versionGroupDetails;
	
	public NamedApiResource<Move> getMove() {
		return move;
	}
	public void setMove(NamedApiResource<Move> move) {
		this.move = move;
	}
	public List<PokemonMoveVersion> getVersionGroupDetails() {
		return versionGroupDetails;
	}
	public void setVersionGroupDetails(List<PokemonMoveVersion> versionGroupDetails) {
		this.versionGroupDetails = versionGroupDetails;
	}
	
}
