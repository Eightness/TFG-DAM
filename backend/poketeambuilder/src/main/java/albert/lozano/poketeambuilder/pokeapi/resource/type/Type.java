package albert.lozano.poketeambuilder.pokeapi.resource.type;

import java.util.List;

import albert.lozano.poketeambuilder.pokeapi.resource.GenerationGameIndex;
import albert.lozano.poketeambuilder.pokeapi.resource.Name;
import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.PokeApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.generation.Generation;
import albert.lozano.poketeambuilder.pokeapi.resource.move.Move;
import albert.lozano.poketeambuilder.pokeapi.resource.movedamageclass.MoveDamageClass;
import albert.lozano.poketeambuilder.pokeapi.utils.Localizable;

public class Type implements PokeApiResource, Localizable {

	private Integer id;
	private String name;
	private TypeRelations damageRelations;
	private List<TypeRelationsPast> pastDamageRelations;
	private List<GenerationGameIndex> gameIndices;
	private NamedApiResource<Generation> generation;
	private NamedApiResource<MoveDamageClass> moveDamageClass;
	private List<Name> names;
	private List<TypePokemon> pokemon;
	private List<NamedApiResource<Move>> moves;
	
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
	public TypeRelations getDamageRelations() {
		return damageRelations;
	}
	public void setDamageRelations(TypeRelations damageRelations) {
		this.damageRelations = damageRelations;
	}
	public List<TypeRelationsPast> getPastDamageRelations() {
		return pastDamageRelations;
	}
	public void setPastDamageRelations(List<TypeRelationsPast> pastDamageRelations) {
		this.pastDamageRelations = pastDamageRelations;
	}
	public List<GenerationGameIndex> getGameIndices() {
		return gameIndices;
	}
	public void setGameIndices(List<GenerationGameIndex> gameIndices) {
		this.gameIndices = gameIndices;
	}
	public NamedApiResource<Generation> getGeneration() {
		return generation;
	}
	public void setGeneration(NamedApiResource<Generation> generation) {
		this.generation = generation;
	}
	public NamedApiResource<MoveDamageClass> getMoveDamageClass() {
		return moveDamageClass;
	}
	public void setMoveDamageClass(NamedApiResource<MoveDamageClass> moveDamageClass) {
		this.moveDamageClass = moveDamageClass;
	}
	public List<Name> getNames() {
		return names;
	}
	public void setNames(List<Name> names) {
		this.names = names;
	}
	public List<TypePokemon> getPokemon() {
		return pokemon;
	}
	public void setPokemon(List<TypePokemon> pokemon) {
		this.pokemon = pokemon;
	}
	public List<NamedApiResource<Move>> getMoves() {
		return moves;
	}
	public void setMoves(List<NamedApiResource<Move>> moves) {
		this.moves = moves;
	}
	
}
