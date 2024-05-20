package albert.lozano.poketeambuilder.pokeapi.resource.berryflavor;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.berry.Berry;

public class FlavorBerryMap {

	private Integer potency;
	private NamedApiResource<Berry> berry;
	
	public Integer getPotency() {
		return potency;
	}
	public void setPotency(Integer potency) {
		this.potency = potency;
	}
	public NamedApiResource<Berry> getBerry() {
		return berry;
	}
	public void setBerry(NamedApiResource<Berry> berry) {
		this.berry = berry;
	}
	
}
