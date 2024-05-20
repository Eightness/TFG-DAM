package albert.lozano.poketeambuilder.pokeapi.resource.pokemon;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.generation.Generation;

import java.util.List;

public class PokemonTypePast {

    private NamedApiResource<Generation> generation;
    private List<PokemonType> types;
    
    public NamedApiResource<Generation> getGeneration() {
        return generation;
    }
    public void setGeneration(NamedApiResource<Generation> generation) {
        this.generation = generation;
    }
    public List<PokemonType> getTypes() {
        return types;
    }
    public void setTypes(List<PokemonType> types) {
        this.types = types;
    }
}
