package albert.lozano.poketeambuilder.pokeapi.resource.berry;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.berryflavor.BerryFlavor;

public class BerryFlavorMap {

	private Integer potency;
	private NamedApiResource<BerryFlavor> flavor;
	
	public Integer getPotency() {
		return potency;
	}
	public void setPotency(Integer potency) {
		this.potency = potency;
	}
	public NamedApiResource<BerryFlavor> getFlavor() {
		return flavor;
	}
	public void setFlavor(NamedApiResource<BerryFlavor> flavor) {
		this.flavor = flavor;
	}
	
}
