/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.application.services;

import java.util.List;

/**
 * GenericService interface. Contains methods that defines most business' logic in this app.
 * @param <DTO> Data Transfer Object
 * @param <PK> Primary key
 */
public interface GenericCRUDService<DTO, PK> {
    // Get methods
    DTO getEntityById(PK id);
    List<DTO> getEntityByIds(List<PK> ids);
    List<DTO> getAllEntities(int pageNumber, int pageSize);

    // Post methods
    DTO addEntity(DTO EntityDTO);
    List<DTO> addEntities(List<DTO> EntitiesDTO);

    // Put methods
    DTO updateEntity(PK id, DTO EntityDTO);
    List<DTO> updateEntities(PK ids, List<DTO> EntitiesDTO);

    // Patch methods
    DTO modifyEntity(PK id, DTO EntityDTO);
    List<DTO> modifyEntitiesByIds(List<PK> ids, List<DTO> EntitiesDTO);

    // Delete methods
    void deleteEntityById(PK id);
    void deleteEntitiesByIds(List<PK> ids);
    void deleteAllEntities();
}
