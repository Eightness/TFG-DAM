package albert.lozano.poketeambuilder.pokeapi.resource.version;

import java.util.List;

import albert.lozano.poketeambuilder.pokeapi.resource.Name;
import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.PokeApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.versiongroup.VersionGroup;
import albert.lozano.poketeambuilder.pokeapi.utils.Localizable;

public class Version implements PokeApiResource, Localizable {

	private Integer id;
	private String name;
	private List<Name> names;
	private NamedApiResource<VersionGroup> versionGroup;
	
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
	public List<Name> getNames() {
		return names;
	}
	public void setNames(List<Name> names) {
		this.names = names;
	}
	public NamedApiResource<VersionGroup> getVersionGroup() {
		return versionGroup;
	}
	public void setVersionGroup(NamedApiResource<VersionGroup> versionGroup) {
		this.versionGroup = versionGroup;
	}
	
}
