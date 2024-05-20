/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.pokeapi.resource;

import albert.lozano.poketeambuilder.pokeapi.resource.machine.Machine;
import albert.lozano.poketeambuilder.pokeapi.resource.versiongroup.VersionGroup;

public class MachineVersionDetail {

	private ApiResource<Machine> machine;
	private NamedApiResource<VersionGroup> versionGroup;
	
	public ApiResource<Machine> getMachine() {
		return machine;
	}
	public void setMachine(ApiResource<Machine> machine) {
		this.machine = machine;
	}
	public NamedApiResource<VersionGroup> getVersionGroup() {
		return versionGroup;
	}
	public void setVersionGroup(NamedApiResource<VersionGroup> versionGroup) {
		this.versionGroup = versionGroup;
	}
	
}
