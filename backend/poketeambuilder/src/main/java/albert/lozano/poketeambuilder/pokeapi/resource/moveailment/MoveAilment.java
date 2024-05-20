package albert.lozano.poketeambuilder.pokeapi.resource.moveailment;

import java.util.List;

import albert.lozano.poketeambuilder.pokeapi.resource.Name;
import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.PokeApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.move.Move;
import albert.lozano.poketeambuilder.pokeapi.utils.Localizable;

public class MoveAilment implements PokeApiResource, Localizable {

	private Integer id;
	private String name;
	private List<NamedApiResource<Move>> moves;
	private List<Name> names;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<NamedApiResource<Move>> getMoves() {
		return moves;
	}
	public void setMoves(List<NamedApiResource<Move>> moves) {
		this.moves = moves;
	}
	public List<Name> getNames() {
		return names;
	}
	public void setNames(List<Name> names) {
		this.names = names;
	}
	
}
