package albert.lozano.poketeambuilder.pokeapi.resource.locationarea;

import java.util.List;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.encountermethod.EncounterMethod;

public class EncounterMethodRate {

	private NamedApiResource<EncounterMethod> encounterMethod;
	private List<EncounterVersionDetails> versionDetails;
	
	public NamedApiResource<EncounterMethod> getEncounterMethod() {
		return encounterMethod;
	}
	public void setEncounterMethod(NamedApiResource<EncounterMethod> encounterMethod) {
		this.encounterMethod = encounterMethod;
	}
	public List<EncounterVersionDetails> getVersionDetails() {
		return versionDetails;
	}
	public void setVersionDetails(List<EncounterVersionDetails> versionDetails) {
		this.versionDetails = versionDetails;
	}
	
}
