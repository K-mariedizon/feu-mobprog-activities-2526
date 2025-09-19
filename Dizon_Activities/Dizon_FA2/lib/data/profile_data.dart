import 'package:flutter_basics/models/profile_info.dart';

// Marvel Questions
const marvelData = [
  ProfileInfo("Who is Iron Man?", ["Tony Stark", "Steve Rogers", "Bruce Wayne"], correctAnswer: "Tony Stark"),
  ProfileInfo("Who lifted Thor’s hammer in Endgame?", ["Hulk", "Captain America", "Spider-Man"], correctAnswer: "Captain America"),
  ProfileInfo("Black Panther’s country?", ["Wakanda", "Latveria", "Asgard"], correctAnswer: "Wakanda"),
  ProfileInfo("Scarlet Witch’s real name?", ["Natasha Romanoff", "Wanda Maximoff", "Carol Danvers"], correctAnswer: "Wanda Maximoff"),
  ProfileInfo("Villain in Infinity War?", ["Thanos", "Loki", "Ultron"], correctAnswer: "Thanos"),
  ProfileInfo("Hawkeye’s weapon?", ["Bow and Arrow", "Sword", "Shield"], correctAnswer: "Bow and Arrow"),
  ProfileInfo("Peter Parker is?", ["Spider-Man", "Iron Man", "Ant-Man"], correctAnswer: "Spider-Man"),
  ProfileInfo("Avengers leader?", ["Thor", "Captain America", "Doctor Strange"], correctAnswer: "Captain America"),
  ProfileInfo("Iron Man’s AI?", ["Jarvis", "Ultron", "Friday"], correctAnswer: "Jarvis"),
  ProfileInfo("Thor’s hammer name?", ["Stormbreaker", "Mjolnir", "Excalibur"], correctAnswer: "Mjolnir"),
];

// DC Questions
const dcData = [
  ProfileInfo("Batman’s city?", ["Metropolis", "Gotham", "Central City"], correctAnswer: "Gotham"),
  ProfileInfo("Superman’s weakness?", ["Kryptonite", "Gold", "Silver"], correctAnswer: "Kryptonite"),
  ProfileInfo("Wonder Woman’s weapon?", ["Sword", "Lasso of Truth", "Trident"], correctAnswer: "Lasso of Truth"),
  ProfileInfo("Flash’s real name?", ["Barry Allen", "Wally West", "Hal Jordan"], correctAnswer: "Barry Allen"),
  ProfileInfo("Aquaman rules?", ["Ocean", "Amazon", "Mountains"], correctAnswer: "Ocean"),
  ProfileInfo("Cyborg is part?", ["Justice League", "Avengers", "Titans"], correctAnswer: "Justice League"),
  ProfileInfo("Lex Luthor’s enemy?", ["Superman", "Batman", "Flash"], correctAnswer: "Superman"),
  ProfileInfo("Green Lantern’s ring color?", ["Blue", "Green", "Yellow"], correctAnswer: "Green"),
  ProfileInfo("Harley Quinn partner?", ["Joker", "Deadshot", "Riddler"], correctAnswer: "Joker"),
  ProfileInfo("Shazam’s magic word?", ["Abracadabra", "Shazam", "Alakazam"], correctAnswer: "Shazam"),
];

// Sanrio Questions
const sanrioData = [
  ProfileInfo("Hello Kitty’s bow color?", ["Red", "Blue", "Pink"], correctAnswer: "Red"),
  ProfileInfo("Kuromi’s favorite color?", ["Black", "Purple", "Pink"], correctAnswer: "Black"),
  ProfileInfo("My Melody is a?", ["Dog", "Rabbit", "Cat"], correctAnswer: "Rabbit"),
  ProfileInfo("Cinnamoroll can?", ["Fly", "Swim", "Disappear"], correctAnswer: "Fly"),
  ProfileInfo("Keroppi is a?", ["Frog", "Duck", "Turtle"], correctAnswer: "Frog"),
  ProfileInfo("Badtz-Maru’s attitude?", ["Good", "Mischievous", "Shy"], correctAnswer: "Mischievous"),
  ProfileInfo("Pompompurin is a?", ["Dog", "Cat", "Bear"], correctAnswer: "Dog"),
  ProfileInfo("Little Twin Stars names?", ["Kiki & Lala", "Lilo & Stitch", "Mika & Mako"], correctAnswer: "Kiki & Lala"),
  ProfileInfo("Chococat’s feature?", ["Whiskers", "Big eyes", "Bow"], correctAnswer: "Whiskers"),
  ProfileInfo("Hello Kitty’s twin sister?", ["Lala", "Mimi", "Nana"], correctAnswer: "Mimi"),
];

// Map categories to data
final Map<String, List<ProfileInfo>> profileCategories = {
  "Marvel": marvelData,
  "DC": dcData,
  "Sanrio": sanrioData,
};
