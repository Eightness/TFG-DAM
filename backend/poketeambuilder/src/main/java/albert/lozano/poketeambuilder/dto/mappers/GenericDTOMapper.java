/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.dto.mappers;

import java.util.List;

/**
 * GenericDTOMapper interface. Contains all base methods to map InputDTOs > Domain > OutputDTOs.
 * @param <DTO> Frontend layer
 * @param <Domain> Backend layer
 */
public interface GenericDTOMapper<DTO, Domain> {
    // DTO -> Domain
    Domain DTOToDomain(DTO entityDTO);
    List<Domain> DTOToDomain(List<DTO> EntitiesDTO);

    // Domain -> DTO
    DTO domainToDTO(Domain domain);
    List<DTO> domainToDTO(List<Domain> domains);
}
