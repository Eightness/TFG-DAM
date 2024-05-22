/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.application.implementation;

import albert.lozano.poketeambuilder.application.services.GenericCRUDService;
import albert.lozano.poketeambuilder.controller.dto.inputDTO.TrainerInputDTO;
import albert.lozano.poketeambuilder.controller.dto.mappers.TrainerMapper;
import albert.lozano.poketeambuilder.controller.dto.outputDTO.TrainerOutputDTO;
import albert.lozano.poketeambuilder.domain.Trainer;
import albert.lozano.poketeambuilder.repository.TrainerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TrainerServiceImpl class. Implements GenericService interface and contains all methods related to Trainer's CRUD.
 */
@Service
public class TrainerServiceImpl implements GenericCRUDService<TrainerInputDTO, TrainerOutputDTO, Long> {
    // Attributes
    @Autowired
    TrainerRepository trainerRepository;
    @Autowired
    TrainerMapper trainerMapper;

    // Methods
    @Override
    public TrainerOutputDTO getEntityById(Long id) {
        Trainer trainer = trainerRepository.findById(id).orElseThrow();
        return trainerMapper.domainToOutput(trainer);
    }

    @Override
    public List<TrainerOutputDTO> getEntityByIds(List<Long> ids) {
        return null;
    }

    @Override
    public List<TrainerOutputDTO> getAllEntities(int pageNumber, int pageSize) {
        List<Trainer> allTrainers = trainerRepository.findAll();
        return trainerMapper.domainToOutput(allTrainers);
    }

    @Override
    public TrainerOutputDTO addEntity(TrainerInputDTO inputEntity) {
        Trainer trainer = trainerMapper.inputToDomain(inputEntity);
        trainerRepository.save(trainer);
        return trainerMapper.domainToOutput(trainer);
    }

    @Override
    public List<TrainerOutputDTO> addEntities(List<TrainerInputDTO> inputEntities) {
        return null;
    }

    @Override
    public TrainerOutputDTO updateEntity(Long id, TrainerInputDTO inputEntity) {
        Trainer trainer = trainerRepository.findById(id).orElseThrow();
        Trainer updatedTrainer = trainerMapper.inputToDomain(inputEntity);

        trainer.setUsername(updatedTrainer.getUsername());
        trainer.setPassword(updatedTrainer.getPassword());
        trainer.setEmail(updatedTrainer.getEmail());
        trainer.setTheme(updatedTrainer.getTheme());

        trainerRepository.save(trainer);
        return trainerMapper.domainToOutput(trainer);
    }

    @Override
    public List<TrainerOutputDTO> updateEntities(Long ids, List<TrainerInputDTO> inputEntities) {
        return null;
    }

    @Override
    public TrainerOutputDTO modifyEntity(Long id, TrainerInputDTO inputEntity) {
        return null;
    }

    @Override
    public List<TrainerOutputDTO> modifyEntitiesByIds(List<Long> ids, List<TrainerInputDTO> inputEntities) {
        return null;
    }

    @Override
    public void deleteEntityById(Long id) {
        trainerRepository.deleteById(id);
    }

    @Override
    public void deleteEntitiesByIds(List<Long> ids) {
    }

    @Override
    public void deleteAllEntities() {
        trainerRepository.deleteAll();
    }
}
