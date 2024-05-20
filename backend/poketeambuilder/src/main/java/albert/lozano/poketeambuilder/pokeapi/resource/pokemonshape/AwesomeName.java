package albert.lozano.poketeambuilder.pokeapi.resource.pokemonshape;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.language.Language;

public class AwesomeName {

	private String awesomeName;
	private NamedApiResource<Language> language;
	
	public String getAwesomeName() {
		return awesomeName;
	}
	public void setAwesomeName(String awesomeName) {
		this.awesomeName = awesomeName;
	}
	public NamedApiResource<Language> getLanguage() {
		return language;
	}
	public void setLanguage(NamedApiResource<Language> language) {
		this.language = language;
	}
	
}
