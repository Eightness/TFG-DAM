package albert.lozano.poketeambuilder.pokeapi.resource.locationarea;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.version.Version;

public class EncounterVersionDetails {

	private Integer rate;
	private NamedApiResource<Version> version;
	
	public Integer getRate() {
		return rate;
	}
	public void setRate(Integer rate) {
		this.rate = rate;
	}
	public NamedApiResource<Version> getVersion() {
		return version;
	}
	public void setVersion(NamedApiResource<Version> version) {
		this.version = version;
	}
	
}
