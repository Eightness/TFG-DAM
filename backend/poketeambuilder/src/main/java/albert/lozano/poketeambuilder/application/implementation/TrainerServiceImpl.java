/**
 * @author Albert Lozano Blasco
 * @version 1.0
 */

package albert.lozano.poketeambuilder.application.implementation;

import albert.lozano.poketeambuilder.application.services.GenericCRUDService;
import albert.lozano.poketeambuilder.dto.TrainerDTO;
import albert.lozano.poketeambuilder.dto.mappers.TrainerMapper;
import albert.lozano.poketeambuilder.domain.Trainer;
import albert.lozano.poketeambuilder.repository.TrainerRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TrainerServiceImpl class. Implements GenericService interface and contains all methods related to Trainer's CRUD.
 */
@Service
public class TrainerServiceImpl implements GenericCRUDService<TrainerDTO, Long> {
    // Attributes
    @Autowired
    TrainerRepository trainerRepository;
    @Autowired
    TrainerMapper trainerMapper;

    // Methods
    @Override
    public TrainerDTO getEntityById(Long id) {
        Trainer trainer = trainerRepository.findById(id).orElseThrow();
        return trainerMapper.domainToDTO(trainer);
    }

    @Override
    public List<TrainerDTO> getEntityByIds(List<Long> ids) {
        return null;
    }

    @Override
    public List<TrainerDTO> getAllEntities(int pageNumber, int pageSize) {
        List<Trainer> allTrainers = trainerRepository.findAll();
        return trainerMapper.domainToDTO(allTrainers);
    }

    @Override
    public TrainerDTO addEntity(TrainerDTO inputEntity) {
        Trainer trainer = trainerMapper.DTOToDomain(inputEntity);
        trainerRepository.save(trainer);
        return trainerMapper.domainToDTO(trainer);
    }

    @Override
    public List<TrainerDTO> addEntities(List<TrainerDTO> inputEntities) {
        return null;
    }

    @Override
    public TrainerDTO updateEntity(Long id, TrainerDTO inputEntity) {
        Trainer trainer = trainerRepository.findById(id).orElseThrow();
        Trainer updatedTrainer = trainerMapper.DTOToDomain(inputEntity);

        trainer.setUsername(updatedTrainer.getUsername());
        trainer.setPassword(updatedTrainer.getPassword());
        trainer.setEmail(updatedTrainer.getEmail());
        trainer.setTheme(updatedTrainer.getTheme());

        trainerRepository.save(trainer);
        return trainerMapper.domainToDTO(trainer);
    }

    public TrainerDTO updateCurrentTrainer(TrainerDTO trainerDTO) {
        Trainer trainer = trainerRepository.findByUsername(trainerDTO.getUsername());
        Trainer updatedTrainer = trainerMapper.DTOToDomain(trainerDTO);

        trainer.setName(updatedTrainer.getName());
        trainer.setFirstSurname(updatedTrainer.getFirstSurname());
        trainer.setSecondSurname(updatedTrainer.getSecondSurname());
        trainer.setPhone(updatedTrainer.getPhone());
        trainer.setPassword(updatedTrainer.getPassword());
        trainer.setTheme(updatedTrainer.getTheme());
        trainer.setBio(updatedTrainer.getBio());

        trainerRepository.save(trainer);
        return trainerMapper.domainToDTO(trainer);
    }

    @Override
    public List<TrainerDTO> updateEntities(Long ids, List<TrainerDTO> inputEntities) {
        return null;
    }

    @Override
    public TrainerDTO modifyEntity(Long id, TrainerDTO inputEntity) {
        return null;
    }

    @Override
    public List<TrainerDTO> modifyEntitiesByIds(List<Long> ids, List<TrainerDTO> inputEntities) {
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

    public boolean existsByUsername(String username) {
        return trainerRepository.existsByUsername(username);
    }

    public boolean existsByEmail(String email) {
        return trainerRepository.existsByEmail(email);
    }

    public boolean checkCredentials(String username, String password) {
        return trainerRepository.existsByUsernameAndPassword(username, password);
    }

    public TrainerDTO getTrainerByUsername(String username) {
        return trainerMapper.domainToDTO(trainerRepository.findByUsername(username));
    }

    @Transactional
    public void deleteCurrentTrainer(TrainerDTO trainerDTO) {
        trainerRepository.deleteByUsername(trainerDTO.getUsername());
    }
}
