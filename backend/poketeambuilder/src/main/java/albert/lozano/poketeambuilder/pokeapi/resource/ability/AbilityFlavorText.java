package albert.lozano.poketeambuilder.pokeapi.resource.ability;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.language.Language;
import albert.lozano.poketeambuilder.pokeapi.resource.versiongroup.VersionGroup;

public class AbilityFlavorText {

	private String flavorText;
	private NamedApiResource<Language> language;
	private NamedApiResource<VersionGroup> versionGroup;
	
	public String getFlavorText() {
		return flavorText;
	}
	public void setFlavorText(String flavorText) {
		this.flavorText = flavorText;
	}
	public NamedApiResource<Language> getLanguage() {
		return language;
	}
	public void setLanguage(NamedApiResource<Language> language) {
		this.language = language;
	}
	public NamedApiResource<VersionGroup> getVersionGroup() {
		return versionGroup;
	}
	public void setVersionGroup(NamedApiResource<VersionGroup> versionGroup) {
		this.versionGroup = versionGroup;
	}
	
}
