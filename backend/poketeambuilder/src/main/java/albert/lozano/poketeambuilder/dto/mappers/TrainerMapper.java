/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.dto.mappers;

import albert.lozano.poketeambuilder.dto.TrainerDTO;
import albert.lozano.poketeambuilder.domain.Trainer;
import org.springframework.beans.factory.annotation.Autowired;


import java.util.ArrayList;
import java.util.List;

/**
 * TrainerMapper interface. It's a mapper from MapStruct. Automatically maps DTOs. Extends from GenericDTOMapper, previously implemented.
 */
public class TrainerMapper implements GenericDTOMapper<TrainerDTO, Trainer> {
    @Autowired
    private TeamMapper teamMapper;

    @Override
    public Trainer DTOToDomain(TrainerDTO trainerDTO) {
        Trainer trainer = new Trainer();

        trainer.setUsername(trainerDTO.getUsername());
        trainer.setPassword(trainerDTO.getPassword());
        trainer.setName(trainerDTO.getName());
        trainer.setFirstSurname(trainerDTO.getFirstSurname());
        trainer.setSecondSurname(trainerDTO.getSecondSurname());
        trainer.setEmail(trainerDTO.getEmail());
        trainer.setPhone(trainerDTO.getPhone());
        trainer.setCreatedDate(trainerDTO.getCreatedDate());
        trainer.setTheme(trainerDTO.getTheme());
        trainer.setBio(trainerDTO.getBio());
        trainer.setTeams(teamMapper.DTOToDomain(trainerDTO.getTeams()));

        return trainer;
    }

    @Override
    public List<Trainer> DTOToDomain(List<TrainerDTO> entitiesDTO) {
        List<Trainer> trainers = new ArrayList<>();

        for (TrainerDTO trainerDTO : entitiesDTO) {
            Trainer trainer = DTOToDomain(trainerDTO);
            trainers.add(trainer);
        }

        return trainers;
    }

    @Override
    public TrainerDTO domainToDTO(Trainer trainer) {
        TrainerDTO trainerDTO = new TrainerDTO();

        trainerDTO.setUsername(trainer.getUsername());
        trainerDTO.setPassword(trainer.getPassword());
        trainerDTO.setName(trainer.getName());
        trainerDTO.setFirstSurname(trainer.getFirstSurname());
        trainerDTO.setSecondSurname(trainer.getSecondSurname());
        trainerDTO.setEmail(trainer.getEmail());
        trainerDTO.setPhone(trainer.getPhone());
        trainerDTO.setCreatedDate(trainer.getCreatedDate());
        trainerDTO.setTheme(trainer.getTheme());
        trainerDTO.setBio(trainer.getBio());
        trainerDTO.setTeams(teamMapper.domainToDTO(trainer.getTeams()));

        return trainerDTO;
    }

    @Override
    public List<TrainerDTO> domainToDTO(List<Trainer> trainers) {
        List<TrainerDTO> trainersDTO = new ArrayList<>();

        for (Trainer trainer : trainers) {
            TrainerDTO trainerDTO = domainToDTO(trainer);
            trainersDTO.add(trainerDTO);
        }

        return trainersDTO;
    }
}
