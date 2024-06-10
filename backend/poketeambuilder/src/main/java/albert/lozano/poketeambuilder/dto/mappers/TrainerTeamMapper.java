package albert.lozano.poketeambuilder.dto.mappers;

import albert.lozano.poketeambuilder.domain.Team;
import albert.lozano.poketeambuilder.domain.Trainer;
import albert.lozano.poketeambuilder.dto.TeamDTO;
import albert.lozano.poketeambuilder.dto.TrainerDTO;
import albert.lozano.poketeambuilder.repository.TeamRepository;
import albert.lozano.poketeambuilder.repository.TrainerRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class TrainerTeamMapper {
    @Autowired
    PokemonMapper pokemonMapper;

    @Autowired
    CommentMapper commentMapper;

    @Autowired
    TrainerRepository trainerRepository;

    @Autowired
    TeamRepository teamRepository;

    public TrainerDTO trainerToTrainerDTO(Trainer trainer) {
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

        return trainerDTO;
    }

    public Trainer trainerDTOToTrainer(TrainerDTO trainerDTO) {
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

        return trainer;
    }

    public List<TrainerDTO> trainersToTrainersDTO(List<Trainer> trainers) {
        List<TrainerDTO> trainersDTO = new ArrayList<>();

        for (Trainer trainer : trainers) {
            TrainerDTO trainerDTO = trainerToTrainerDTO(trainer);
            trainersDTO.add(trainerDTO);
        }

        return trainersDTO;
    }

    // -----------------------------------------------------------------------------------------------------------------

    public TeamDTO teamToTeamDTO(Team team) {
        TeamDTO teamDTO = new TeamDTO();

        teamDTO.setName(team.getName());
        teamDTO.setCreatedDate(team.getCreatedDate());
        teamDTO.setPublic(team.isPublic());
        teamDTO.setNumLikes(team.getNumLikes());
        teamDTO.setGeneration(team.getGeneration());

        teamDTO.setPokemon(team.getPokemon().stream()
                .map(pokemonMapper::domainToDTO)
                .collect(Collectors.toList()));

        teamDTO.setComments(new ArrayList<>()); // Adjust if comments mapping is needed

        Trainer trainer = trainerRepository.findByUsername(team.getTrainer().getUsername());
        teamDTO.setTrainer(trainerToTrainerDTO(trainer));

        return teamDTO;
    }

    public List<TeamDTO> teamsToTeamsDTO(List<Team> teams) {
        List<TeamDTO> teamsDTO = new ArrayList<>();

        for (Team team : teams) {
            TeamDTO teamDTO = teamToTeamDTO(team);
            teamsDTO.add(teamDTO);
        }

        return teamsDTO;
    }

    public Team teamDTOToTeam(TeamDTO teamDTO) {
        Team team = new Team();

        team.setName(teamDTO.getName());
        team.setCreatedDate(teamDTO.getCreatedDate());
        team.setPublic(teamDTO.isPublic());
        team.setNumLikes(teamDTO.getNumLikes());
        team.setGeneration(teamDTO.getGeneration());

        if (teamDTO.getPokemon() != null) {
            team.setPokemon(teamDTO.getPokemon().stream()
                    .map(pokemonMapper::DTOToDomain)
                    .collect(Collectors.toList()));
        }

        if (teamDTO.getTrainer() != null && teamDTO.getTrainer().getUsername() != null) {
            Trainer trainer = trainerRepository.findByUsername(teamDTO.getTrainer().getUsername());
            if (trainer != null) {
                team.setTrainer(trainer);
            } else {
                throw new RuntimeException("Couldn't find trainer with username: " + teamDTO.getTrainer().getUsername());
            }
        }

        return team;
    }

    public List<Team> teamsDTOToTeams(List<TeamDTO> teamsDTO) {
        List<Team> teams = new ArrayList<>();

        for (TeamDTO teamDTO : teamsDTO) {
            Team team = teamDTOToTeam(teamDTO);
            teams.add(team);
        }

        return teams;
    }
}

