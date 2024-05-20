package albert.lozano.poketeambuilder.pokeapi.resource.nature;

import java.util.List;

import albert.lozano.poketeambuilder.pokeapi.resource.Name;
import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.PokeApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.berryflavor.BerryFlavor;
import albert.lozano.poketeambuilder.pokeapi.resource.stat.Stat;
import albert.lozano.poketeambuilder.pokeapi.utils.Localizable;

public class Nature implements PokeApiResource, Localizable {

	private Integer id;
	private String name;
	private NamedApiResource<Stat> decreasedStat;
	private NamedApiResource<Stat> increasedStat;
	private NamedApiResource<BerryFlavor> hatesFlavor;
	private NamedApiResource<BerryFlavor> likesFlavor;
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
	public NamedApiResource<Stat> getDecreasedStat() {
		return decreasedStat;
	}
	public void setDecreasedStat(NamedApiResource<Stat> decreasedStat) {
		this.decreasedStat = decreasedStat;
	}
	public NamedApiResource<Stat> getIncreasedStat() {
		return increasedStat;
	}
	public void setIncreasedStat(NamedApiResource<Stat> increasedStat) {
		this.increasedStat = increasedStat;
	}
	public NamedApiResource<BerryFlavor> getHatesFlavor() {
		return hatesFlavor;
	}
	public void setHatesFlavor(NamedApiResource<BerryFlavor> hatesFlavor) {
		this.hatesFlavor = hatesFlavor;
	}
	public NamedApiResource<BerryFlavor> getLikesFlavor() {
		return likesFlavor;
	}
	public void setLikesFlavor(NamedApiResource<BerryFlavor> likesFlavor) {
		this.likesFlavor = likesFlavor;
	}
	public List<Name> getNames() {
		return names;
	}
	public void setNames(List<Name> names) {
		this.names = names;
	}
	
}
