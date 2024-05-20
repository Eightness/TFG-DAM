package albert.lozano.poketeambuilder.pokeapi.resource.gender;

import java.util.List;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.pokemonspecies.PokemonSpecies;

public class Gender {

	private Integer id;
	private String name;
	private List<PokemonSpeciesGender> pokemonSpeciesDetails;
	private List<NamedApiResource<PokemonSpecies>> requiredForEvolution;
	
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
	public List<PokemonSpeciesGender> getPokemonSpeciesDetails() {
		return pokemonSpeciesDetails;
	}
	public void setPokemonSpeciesDetails(List<PokemonSpeciesGender> pokemonSpeciesDetails) {
		this.pokemonSpeciesDetails = pokemonSpeciesDetails;
	}
	public List<NamedApiResource<PokemonSpecies>> getRequiredForEvolution() {
		return requiredForEvolution;
	}
	public void setRequiredForEvolution(List<NamedApiResource<PokemonSpecies>> requiredForEvolution) {
		this.requiredForEvolution = requiredForEvolution;
	}
	
}
