package albert.lozano.poketeambuilder.pokeapi.resource;

import albert.lozano.poketeambuilder.pokeapi.resource.language.Language;

public class Description {

	private String description;
	private NamedApiResource<Language> language;
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public NamedApiResource<Language> getLanguage() {
		return language;
	}
	public void setLanguage(NamedApiResource<Language> language) {
		this.language = language;
	}
	
}
