package albert.lozano.poketeambuilder.pokeapi.resource.pokemon;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.stat.Stat;

public class PokemonStat {

	private NamedApiResource<Stat> stat;
	private Integer effort;
	private Integer baseStat;
	
	public NamedApiResource<Stat> getStat() {
		return stat;
	}
	public void setStat(NamedApiResource<Stat> stat) {
		this.stat = stat;
	}
	public Integer getEffort() {
		return effort;
	}
	public void setEffort(Integer effort) {
		this.effort = effort;
	}
	public Integer getBaseStat() {
		return baseStat;
	}
	public void setBaseStat(Integer baseStat) {
		this.baseStat = baseStat;
	}
	
}
