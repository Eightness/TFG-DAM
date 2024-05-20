package albert.lozano.poketeambuilder.pokeapi.resource.supercontesteffect;

import java.util.List;

import albert.lozano.poketeambuilder.pokeapi.resource.FlavorText;
import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.move.Move;

public class SuperContestEffect {

	private Integer id;
	private Integer appeal;
	private List<FlavorText> flavorTextEntries;
	private List<NamedApiResource<Move>> moves;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAppeal() {
		return appeal;
	}
	public void setAppeal(Integer appeal) {
		this.appeal = appeal;
	}
	public List<FlavorText> getFlavorTextEntries() {
		return flavorTextEntries;
	}
	public void setFlavorTextEntries(List<FlavorText> flavorTextEntries) {
		this.flavorTextEntries = flavorTextEntries;
	}
	public List<NamedApiResource<Move>> getMoves() {
		return moves;
	}
	public void setMoves(List<NamedApiResource<Move>> moves) {
		this.moves = moves;
	}
	
}
