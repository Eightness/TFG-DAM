/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.pokeapi.resource;

import java.util.List;

import albert.lozano.poketeambuilder.pokeapi.resource.version.Version;

public class VersionEncounterDetail {

	private NamedApiResource<Version> version;
	private Integer maxChance;
	private List<Encounter> encounterDetails;
	
	public NamedApiResource<Version> getVersion() {
		return version;
	}
	public void setVersion(NamedApiResource<Version> version) {
		this.version = version;
	}
	public Integer getMaxChance() {
		return maxChance;
	}
	public void setMaxChance(Integer maxChance) {
		this.maxChance = maxChance;
	}
	public List<Encounter> getEncounterDetails() {
		return encounterDetails;
	}
	public void setEncounterDetails(List<Encounter> encounterDetails) {
		this.encounterDetails = encounterDetails;
	}
	
}
