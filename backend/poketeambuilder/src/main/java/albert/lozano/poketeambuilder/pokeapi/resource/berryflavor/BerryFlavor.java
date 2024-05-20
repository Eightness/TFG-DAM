package albert.lozano.poketeambuilder.pokeapi.resource.berryflavor;

import java.util.List;

import albert.lozano.poketeambuilder.pokeapi.resource.Name;
import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.PokeApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.contesttype.ContestType;
import albert.lozano.poketeambuilder.pokeapi.utils.Localizable;

public class BerryFlavor implements PokeApiResource, Localizable {

	private Integer id;
	private String name;
	private List<FlavorBerryMap> barries;
	private NamedApiResource<ContestType> contestType;
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
	public List<FlavorBerryMap> getBarries() {
		return barries;
	}
	public void setBarries(List<FlavorBerryMap> barries) {
		this.barries = barries;
	}
	public NamedApiResource<ContestType> getContestType() {
		return contestType;
	}
	public void setContestType(NamedApiResource<ContestType> contestType) {
		this.contestType = contestType;
	}
	public List<Name> getNames() {
		return names;
	}
	public void setNames(List<Name> names) {
		this.names = names;
	}
	
}
