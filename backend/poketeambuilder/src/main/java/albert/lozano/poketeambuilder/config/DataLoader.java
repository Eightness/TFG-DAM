package albert.lozano.poketeambuilder.config;

import albert.lozano.poketeambuilder.application.implementation.PokemonServiceImpl;
import albert.lozano.poketeambuilder.domain.*;
import albert.lozano.poketeambuilder.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Component
public class DataLoader implements CommandLineRunner {

    @Autowired
    private TrainerRepository trainerRepository;

    @Autowired
    private TeamRepository teamRepository;

    @Autowired
    private PokemonRepository pokemonRepository;

    @Autowired
    private PokemonServiceImpl pokemonService;

    @Override
    public void run(String... args) throws Exception {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

        // Create Trainers
        Trainer albert = new Trainer(1L, "Eightness", "1234", "Albert", "Lozano", "Blasco", "albertlb08@gmail.com", "625760988", dateFormat.parse("2024-03-11 17:33:07.251000"), false, new ArrayList<>(), new ArrayList<>(), "Hi! I'm committed to mentoring new trainers and unlocking the hidden strengths of their Pokemon teams.");
        Trainer sergi = new Trainer(2L, "SergiMarrahy", "1234", "Sergi", "Marrahy", "Arenas", "sergimarenas@gmail.com", "654987321", dateFormat.parse("2024-04-16 21:34:32.346000"), true, new ArrayList<>(), new ArrayList<>(), "I'm obviously the very best of all trainers in the world.");
        Trainer duncan = new Trainer(3L, "DuncanRua", "1234", "Duncan", "Rua", "Valiente", "duncanrv@gmail.com", "654987321", dateFormat.parse("2024-05-16 11:34:08.697000"), false, new ArrayList<>(), new ArrayList<>(), "Always looking for skilled trainers to collaborate with and share knowledge to become the very best.");
        Trainer nacho = new Trainer(4L, "Nancho", "1234", "Nacho", "Pérez", "", "nancho@gmail.com", "654987321", dateFormat.parse("2024-06-08 13:35:00.552000"), true, new ArrayList<>(), new ArrayList<>(), "Long life to masia!");
        Trainer asdf = new Trainer(5L, "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "1234", dateFormat.parse("2024-06-09 13:35:00.552000"), false, new ArrayList<>(), new ArrayList<>(), "This is the bio of a trainer. It contains a brief description about the trainer.");
        Trainer test = new Trainer(6L, "test", "test", "test", "test", "test", "test", "1234", dateFormat.parse("2024-06-09 13:35:00.552000"), false, new ArrayList<>(), new ArrayList<>(), "This is the bio of a trainer. It contains a brief description about the trainer.");

        trainerRepository.save(albert);
        trainerRepository.save(sergi);
        trainerRepository.save(duncan);
        trainerRepository.save(nacho);
        trainerRepository.save(asdf);
        trainerRepository.save(test);

        // Create Teams
        Team team1Albert = new Team(1L, "Gen 1 Team", dateFormat.parse("2024-03-12 13:13:07.251000"), true, 21, 1, new ArrayList<>(), albert, new ArrayList<>());
        Team team2Albert = new Team(2L, "Gen 4 Team", dateFormat.parse("2024-03-21 18:33:01.251000"), true, 56, 4, new ArrayList<>(), albert, new ArrayList<>());
        Team team3Albert = new Team(3L, "Random Team", dateFormat.parse("2024-03-24 19:12:02.251000"), false, 0, 0, new ArrayList<>(), albert, new ArrayList<>());

        Team team1Sergi = new Team(4L, "Random1", dateFormat.parse("2024-04-17 13:33:07.251000"), true, 18, 0, new ArrayList<>(), sergi, new ArrayList<>());
        Team team2Sergi = new Team(5L, "BestTeam", dateFormat.parse("2024-04-26 13:35:09.251000"), true, 20, 0, new ArrayList<>(), sergi, new ArrayList<>());
        Team team3Sergi = new Team(6L, "PrivateTeam", dateFormat.parse("2024-05-01 13:33:07.2510009"), false, 0, 0, new ArrayList<>(), sergi, new ArrayList<>());

        Team team1Duncan = new Team(7L, "AllGen Team", dateFormat.parse("2024-05-27 13:33:07.251000"), true, 14, 0, new ArrayList<>(), duncan, new ArrayList<>());
        Team team2Duncan = new Team(8L, "Karate Team", dateFormat.parse("2024-05-28 13:33:07.251000"), true, 44, 0, new ArrayList<>(), duncan, new ArrayList<>());
        Team team3Duncan = new Team(9L, "Amazing", dateFormat.parse("2024-06-01 13:33:07.251000"), false, 0, 0, new ArrayList<>(), duncan, new ArrayList<>());

        Team team1Nacho = new Team(10L, "masia team", dateFormat.parse("2024-06-08 13:33:07.251000"), true, 43, 0, new ArrayList<>(), nacho, new ArrayList<>());
        Team team2Nacho = new Team(11L, "mola", dateFormat.parse("2024-06-09 13:33:07.251000"), true, 37, 0, new ArrayList<>(), nacho, new ArrayList<>());
        Team team3Nacho = new Team(12L, "meh", dateFormat.parse("2024-06-09 13:33:07.251000"), false, 0, 0, new ArrayList<>(), nacho, new ArrayList<>());

        // Create Pokémon

        // Albert
        team1Albert.getPokemon().add(new Pokemon(1, "Dratini", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/147.png", "Jolly", "Shed Skin", "White Herb", false, team1Albert, 25, 16, 20, 18, 25, 14, 165, 98, 49, 18, 239, 0));
        team1Albert.getPokemon().add(new Pokemon(2, "Onix", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/95.png", "Rash", "Sturdy", "Hearthflame Mask", false, team1Albert, 17, 31, 18, 22, 4, 0, 210, 164, 119, 112, 48, 234));
        team1Albert.getPokemon().add(new Pokemon(3, "Charmeleon", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png", "Modest", "Solar Power", "Focus Sash", false, team1Albert, 13, 28, 20, 6, 6, 12, 80, 4, 197, 162, 75, 244));
        team1Albert.getPokemon().add(new Pokemon(4, "Starmie", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/121.png", "Gentle", "Illuminate", "Focus Band", false, team1Albert, 8, 27, 18, 15, 5, 22, 27, 119, 19, 192, 2, 112));
        team1Albert.getPokemon().add(new Pokemon(5, "Shellder", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/90.png", "Docile", "Overcoat", "Leftovers", false, team1Albert, 23, 13, 26, 15, 21, 4, 8, 225, 179, 24, 178, 214));
        team1Albert.getPokemon().add(new Pokemon(6, "Ivysaur", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/2.png", "Naive", "Chlorophyll", "Smoke Ball", true, team1Albert, 22, 31, 10, 31, 30, 22, 45, 42, 247, 202, 39, 174));

        team2Albert.getPokemon().add(new Pokemon(7, "Rhyperior", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/464.png", "Gentle", "Reckless", "Mirror Herb", false, team2Albert, 4, 5, 13, 20, 11, 9, 167, 43, 27, 40, 187, 44));
        team2Albert.getPokemon().add(new Pokemon(8, "Bidoof", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/399.png", "Jolly", "Unaware", "Fairy Feather", false, team2Albert, 10, 26, 25, 28, 10, 16, 33, 89, 180, 213, 152, 56));
        team2Albert.getPokemon().add(new Pokemon(9, "Shellos", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/422.png", "Calm", "Storm Drain", "Heat Rock", false, team2Albert, 2, 14, 27, 24, 29, 2, 225, 96, 60, 231, 24, 28));
        team2Albert.getPokemon().add(new Pokemon(10, "Abomasnow", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/460.png", "Modest", "Soundproof", "Kings Rock", false, team2Albert, 11, 25, 31, 16, 16, 9, 82, 35, 20, 132, 13, 160));
        team2Albert.getPokemon().add(new Pokemon(11, "Cherrim", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/421.png", "Adamant", "Flower Gift", "Icy Rock", false, team2Albert, 4, 6, 21, 30, 25, 2, 53, 123, 11, 87, 188, 67));
        team2Albert.getPokemon().add(new Pokemon(12, "Magnezone", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/462.png", "Naughty", "Analytic", "Fairy Feather", true, team2Albert, 25, 22, 24, 4, 6, 7, 32, 9, 3, 103, 161, 59));

        team3Albert.getPokemon().add(new Pokemon(13, "Zoroark", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/571.png", "Careful", "Illusion", "Focus Sash", false, team3Albert, 25, 15, 25, 24, 7, 31, 165, 119, 201, 152, 248, 115));
        team3Albert.getPokemon().add(new Pokemon(14, "Azurill", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/298.png", "Lax", "Sap Sipper", "Mirror Herb", false, team3Albert, 11, 9, 28, 10, 17, 17, 87, 191, 188, 132, 107, 54));
        team3Albert.getPokemon().add(new Pokemon(15, "Meowth", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/52.png", "Gentle", "Technician", "White Herb", false, team3Albert, 19, 19, 1, 3, 26, 21, 199, 3, 191, 132, 83, 244));
        team3Albert.getPokemon().add(new Pokemon(16, "Camerupt", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/323.png", "Gentle", "Anger Point", "Fairy Feather", false, team3Albert, 12, 26, 0, 0, 24, 29, 217, 90, 101, 98, 45, 131));
        team3Albert.getPokemon().add(new Pokemon(17, "Slakoth", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/287.png", "Docile", "Truant", "Damp Rock", false, team3Albert, 0, 1, 13, 15, 17, 18, 90, 110, 29, 141, 30, 106));
        team3Albert.getPokemon().add(new Pokemon(18, "Probopass", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/476.png", "Impish", "Magnet Pull", "Eject Pack", false, team3Albert, 30, 1, 23, 23, 24, 23, 46, 195, 30, 88, 214, 112));


        // Sergi
        team1Sergi.getPokemon().add(new Pokemon(19, "Metapod", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/11.png", "Calm", "Shed Skin", "Eject Button", false, team1Sergi, 15, 24, 19, 26, 24, 5, 223, 72, 18, 15, 238, 228));
        team1Sergi.getPokemon().add(new Pokemon(20, "Phanpy", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/231.png", "Hardy", "Pickup", "Muscle Band", false, team1Sergi, 16, 13, 25, 22, 28, 23, 21, 236, 19, 142, 123, 58));
        team1Sergi.getPokemon().add(new Pokemon(21, "Sandile", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/551.png", "Lonely", "Moxie", "Eject Button", false,team1Sergi, 28, 22, 23, 29, 5, 0, 181, 200, 33, 54, 156, 111));
        team1Sergi.getPokemon().add(new Pokemon(22, "Girafarig", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/203.png", "Naughty", "Sap Sipper", "Punching Glove", false, team1Sergi, 9, 26, 0, 6, 17, 18, 14, 141, 128, 80, 240, 224));
        team1Sergi.getPokemon().add(new Pokemon(23, "Fuecoco", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/909.png", "Impish", "Unaware", "Quick Claw", false, team1Sergi, 19, 17, 5, 25, 30, 2, 232, 2, 136, 244, 208, 22));
        team1Sergi.getPokemon().add(new Pokemon(24, "Uxie", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/480.png", "Hasty", "Levitate", "Wise Glasses", false, team1Sergi, 5, 4, 6, 17, 27, 25, 107, 74, 135, 130, 98, 37));

        team2Sergi.getPokemon().add(new Pokemon(25, "Shroodle", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/944.png", "Jolly", "Unburden", "Rocky Helmet", false, team2Sergi, 20, 20, 30, 5, 17, 24, 217, 213, 35, 75, 23, 39));
        team2Sergi.getPokemon().add(new Pokemon(26, "Dracozolt", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/880.png", "Timid", "Volt Absorb", "Big Root", true, team2Sergi, 3, 20, 24, 18, 14, 17, 11, 86, 100, 36, 92, 59));
        team2Sergi.getPokemon().add(new Pokemon(27, "Empty Slot", "", "None", "None", "None", false, team2Sergi, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
        team2Sergi.getPokemon().add(new Pokemon(28, "Lechonk", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/915.png", "Naive", "Aroma Veil", "Smoke Ball", false, team2Sergi, 14, 17, 13, 27, 29, 13, 103, 217, 223, 200, 73, 5));
        team2Sergi.getPokemon().add(new Pokemon(29, "Empty Slot", "", "None", "None", "None", false, team2Sergi, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
        team2Sergi.getPokemon().add(new Pokemon(30, "Tinkatink", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/957.png", "Hasty", "Pickpocket", "Heavy Duty Boots", false, team2Sergi, 14, 29, 10, 11, 6, 1, 108, 82, 71, 108, 120, 31));

        team3Sergi.getPokemon().add(new Pokemon(31, "Weepinbell", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/70.png", "Gentle", "Gluttony", "Grassy Seed", false, team3Sergi, 11, 17, 21, 29, 17, 12, 192, 54, 200, 248, 49, 107));
        team3Sergi.getPokemon().add(new Pokemon(32, "Trumbeak", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/732.png", "Calm", "Skill Link", "Luminous Moss", false, team3Sergi, 13, 29, 15, 16, 31, 2, 88, 222, 127, 49, 210, 131));
        team3Sergi.getPokemon().add(new Pokemon(33, "Venonat", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/48.png", "Mild", "Tinted Lens", "Float Stone", false, team3Sergi, 10, 14, 24, 22, 18, 21, 208, 117, 83, 234, 198, 176));
        team3Sergi.getPokemon().add(new Pokemon(34, "Noctowl", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/164.png", "Quirky", "Keen Eye", "Wide Lens", false, team3Sergi, 14, 31, 16, 23, 18, 23, 63, 61, 152, 152, 231, 131));
        team3Sergi.getPokemon().add(new Pokemon(35, "Dusknoir", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/477.png", "Docile", "Frisk", "Pass Orb", false, team3Sergi, 13, 26, 27, 9, 19, 16, 56, 110, 105, 149, 73, 144));
        team3Sergi.getPokemon().add(new Pokemon(36, "Tinkatink", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/957.png", "Rash", "Pickpocket", "Mental Herb", false, team3Sergi, 1, 18, 3, 17, 16, 12, 102, 79, 126, 178, 115, 55));


        // Duncan
        team1Duncan.getPokemon().add(new Pokemon(37, "Marshadow", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/802.png", "Naive", "Technician", "Rocky Helmet", false, team1Duncan, 18, 23, 24, 1, 17, 3, 1, 103, 232, 233, 95, 233));
        team1Duncan.getPokemon().add(new Pokemon(38, "Whirlipede", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/544.png", "Gentle", "Speed Boost", "Damp Rock", false, team1Duncan, 10, 12, 20, 23, 23, 11, 182, 87, 191, 179, 31, 40));
        team1Duncan.getPokemon().add(new Pokemon(39, "Sealeo", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/364.png", "Jolly", "Thick Fat", "Eject Pack", false, team1Duncan, 12, 26, 25, 16, 27, 7, 46, 78, 104, 210, 42, 174));
        team1Duncan.getPokemon().add(new Pokemon(40, "Blacephalon", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/806.png", "Careful", "Beast Boost", "Pass Orb", false, team1Duncan, 19, 28, 27, 6, 0, 20, 109, 74, 117, 58, 34, 108));
        team1Duncan.getPokemon().add(new Pokemon(41, "Aipom", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/190.png", "Timid", "Pickup", "Rocky Helmet", false, team1Duncan, 2, 6, 25, 1, 11, 31, 78, 12, 202, 11, 136, 1));
        team1Duncan.getPokemon().add(new Pokemon(42, "Snom", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/872.png", "Timid", "Shield Dust", "Grip Claw", false, team1Duncan, 10, 30, 29, 16, 3, 1, 15, 201, 4, 7, 121, 29));

        team2Duncan.getPokemon().add(new Pokemon(43, "Hitmonlee", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/106.png",  "None", "None", "None", false, team2Duncan, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
        team2Duncan.getPokemon().add(new Pokemon(44, "Hitmonchan", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/107.png", "None", "None", "None", false, team2Duncan, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
        team2Duncan.getPokemon().add(new Pokemon(45, "Throh", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/538.png", "None", "None", "None", false, team2Duncan, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
        team2Duncan.getPokemon().add(new Pokemon(46, "Sawk", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/539.png", "None", "None", "None", false, team2Duncan, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
        team2Duncan.getPokemon().add(new Pokemon(47, "Hitmontop", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/237.png", "None", "None", "None", false, team2Duncan, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
        team2Duncan.getPokemon().add(new Pokemon(48, "Tyrogue", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/236.png", "None", "None", "None", false, team2Duncan, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));

        team3Duncan.getPokemon().add(new Pokemon(49, "Trapinch", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/328.png", "Adamant", "Sheer Force", "Wise Glasses", false, team3Duncan, 8, 10, 17, 18, 0, 0, 5, 35, 120, 117, 152, 214));
        team3Duncan.getPokemon().add(new Pokemon(50, "Fidough", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/926.png", "Bashful", "Klutz", "Focus Band", false, team3Duncan, 20, 4, 17, 27, 0, 0, 166, 4, 47, 193, 69, 86));
        team3Duncan.getPokemon().add(new Pokemon(51, "Solosis", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/577.png", "Gentle", "Overcoat", "Black Sludge", false, team3Duncan, 27, 16, 31, 28, 5, 14, 51, 175, 61, 204, 127, 61));
        team3Duncan.getPokemon().add(new Pokemon(52, "Zapdos", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/145.png", "Adamant", "Static", "Air Balloon", false, team3Duncan, 7, 0, 2, 10, 25, 19, 194, 216, 70, 177, 111, 70));
        team3Duncan.getPokemon().add(new Pokemon(53, "Staraptor", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/398.png", "Hasty", "Intimidate", "Assault Vest", false, team3Duncan, 28, 2, 5, 19, 21, 27, 220, 164, 252, 171, 75, 119));
        team3Duncan.getPokemon().add(new Pokemon(54, "Lairon", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/305.png", "Rash", "Sturdy", "Muscle Band", false, team3Duncan, 29, 24, 13, 28, 14, 5, 110, 34, 133, 236, 143, 27));


        // Nacho
        team1Nacho.getPokemon().add(new Pokemon(55, "Aipom", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/190.png", "Bashful", "Skill Link", "Air Balloon", false, team1Nacho, 20, 14, 21, 21, 0, 5, 89, 215, 101, 230, 140, 79));
        team1Nacho.getPokemon().add(new Pokemon(56, "Yanmega", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/469.png", "Naive", "Frisk", "Misty Seed", false, team1Nacho, 5, 11, 8, 9, 0, 29, 191, 194, 33, 4, 25, 79));
        team1Nacho.getPokemon().add(new Pokemon(57, "Malamar", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/687.png", "Bold", "Contrary", "Razor Fang", false, team1Nacho, 29, 3, 0, 20, 3, 9, 40, 177, 141, 75, 238, 245));
        team1Nacho.getPokemon().add(new Pokemon(58, "Klawf", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/950.png", "Bashful", "Regenerator", "Destiny Knot", false, team1Nacho, 9, 27, 3, 5, 26, 13, 155, 117, 189, 173, 213, 2));
        team1Nacho.getPokemon().add(new Pokemon(59, "Ducklett", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/580.png", "Modest", "Keen Eye", "Mirror Herb", false, team1Nacho, 5, 20, 11, 17, 26, 22, 192, 101, 159, 200, 13, 233));
        team1Nacho.getPokemon().add(new Pokemon(60, "Poltchageist", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1012.png", "Lax", "Hospitality", "Binding Band", false, team1Nacho, 24, 31, 26, 18, 17, 29, 46, 88, 236, 105, 27, 10));

        team2Nacho.getPokemon().add(new Pokemon(61, "Quilladin", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/651.png", "Quirky", "Bulletproof", "Room Service", false, team2Nacho, 7, 10, 10, 5, 1, 15, 146, 6, 187, 60, 16, 193));
        team2Nacho.getPokemon().add(new Pokemon(62, "Ditto", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png", "Jolly", "Limber", "Kings Rock", false, team2Nacho, 29, 17, 28, 28, 30, 17, 36, 133, 241, 132, 238, 93));
        team2Nacho.getPokemon().add(new Pokemon(63, "Sunkern", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/191.png", "Calm", "Solar Power", "Lax Incense", false, team2Nacho, 11, 27, 19, 22, 8, 6, 28, 148, 69, 63, 129, 234));
        team2Nacho.getPokemon().add(new Pokemon(64, "Quaquaval", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/914.png", "Lax", "Moxie", "Float Stone", false, team2Nacho, 15, 10, 24, 11, 23, 20, 238, 47, 74, 29, 34, 159));
        team2Nacho.getPokemon().add(new Pokemon(65, "Vanilluxe", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/584.png", "Hardy", "Ice Body", "Grassy Seed", false, team2Nacho, 22, 6, 29, 11, 31, 14, 196, 26, 157, 172, 75, 46));
        team2Nacho.getPokemon().add(new Pokemon(66, "Barbaracle", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/689.png", "Hasty", "Tough Claws", "Eject Button", false, team2Nacho, 0, 3, 1, 9, 4, 6, 128, 60, 214, 120, 219, 186));

        team3Nacho.getPokemon().add(new Pokemon(67, "Florges", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/671.png", "Timid", "Flower Veil", "Fairy Feather", false, team3Nacho, 9, 26, 25, 16, 22, 2, 151, 137, 84, 73, 44, 230));
        team3Nacho.getPokemon().add(new Pokemon(68, "Amaura", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/698.png", "Jolly", "Refrigerate", "Icy Rock", false, team3Nacho, 6, 18, 2, 23, 19, 16, 134, 68, 170, 120, 224, 117));
        team3Nacho.getPokemon().add(new Pokemon(69, "Tinkatuff", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/958.png", "Quirky", "Pickpocket", "Electric Seed", false, team3Nacho, 21, 5, 17, 11, 18, 8, 209, 94, 239, 16, 4, 213));
        team3Nacho.getPokemon().add(new Pokemon(70, "Drampa", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/780.png", "Impish", "Cloud Nine", "Leftovers", false, team3Nacho, 20, 11, 11, 25, 27, 29, 95, 106, 30, 33, 246, 188));
        team3Nacho.getPokemon().add(new Pokemon(71, "Rabsca", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/954.png", "Docile", "Synchronize", "Air Balloon", false, team3Nacho, 10, 28, 20, 16, 1, 12, 126, 161, 38, 230, 64, 67));
        team3Nacho.getPokemon().add(new Pokemon(72, "Trumbeak", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/732.png", "Naughty", "Skill Link", "Zoom Lens", false, team3Nacho, 13, 25, 2, 23, 1, 28, 63, 28, 130, 165, 114, 179));

        teamRepository.save(team1Albert);
        teamRepository.save(team2Albert);
        teamRepository.save(team3Albert);

        teamRepository.save(team1Sergi);
        teamRepository.save(team2Sergi);
        teamRepository.save(team3Sergi);

        teamRepository.save(team1Duncan);
        teamRepository.save(team2Duncan);
        teamRepository.save(team3Duncan);

        teamRepository.save(team1Nacho);
        teamRepository.save(team2Nacho);
        teamRepository.save(team3Nacho);
    }
}

