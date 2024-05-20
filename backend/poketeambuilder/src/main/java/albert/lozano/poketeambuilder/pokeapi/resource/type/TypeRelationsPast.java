package albert.lozano.poketeambuilder.pokeapi.resource.type;

import albert.lozano.poketeambuilder.pokeapi.resource.NamedApiResource;
import albert.lozano.poketeambuilder.pokeapi.resource.generation.Generation;

public class TypeRelationsPast {
    
    private NamedApiResource<Generation> generation;
    private TypeRelations damageRelations;
    
    public NamedApiResource<Generation> getGeneration() {
        return generation;
    }
    public void setGeneration(NamedApiResource<Generation> generation) {
        this.generation = generation;
    }
    public TypeRelations getDamageRelations() {
        return damageRelations;
    }
    public void setDamageRelations(TypeRelations damageRelations) {
        this.damageRelations = damageRelations;
    }
}
