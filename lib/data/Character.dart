class Character {
  String name;
  int height;
  int mass;
  String hairColor;
  String skinColor;
  String eyeColor;
  String birthYear;
  String gender;
  String homeWorld;
  List<String> films;
  List<String> species;
  List<String> vehicles;
  List<String> starships;

  Character() : super() {
    name = "";
    height = 0;
    mass = 0;
    hairColor = "";
    skinColor = "";
    eyeColor = "";
    birthYear = "";
    gender = "";
    homeWorld = "";
    films = [];
    species = [];
    vehicles = [];
    starships = [];
  }

  Character.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    height = json['height'];
    mass = json['mass'];
    hairColor = json['hair_color'];
    skinColor = json['skin_color'];
    eyeColor = json['eye_color'];
    birthYear = json['birth_year'];
    gender = json['gender'];
    homeWorld = json['homeworld'];
    films = json['films'];
    species = json['species'];
    vehicles = json['vehicles'];
    starships = json['starships'];
  }
}