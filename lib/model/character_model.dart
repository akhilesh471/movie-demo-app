// To parse required this JSON data, do
//
//     final charactersModel = charactersModelFromJson(jsonString);

import 'dart:convert';

CharactersModel charactersModelFromJson(String str) => CharactersModel.fromJson(json.decode(str));

String charactersModelToJson(CharactersModel data) => json.encode(data.toJson());

class CharactersModel {
    CharactersModel({
        required this.characters,
        required this.series,
    });

    List<Character> characters;
    Series series;

    factory CharactersModel.fromJson(Map<String, dynamic> json) => CharactersModel(
        characters: List<Character>.from(json["characters"].map((x) => Character.fromJson(x))),
        series: Series.fromJson(json["series"]),
    );

    Map<String, dynamic> toJson() => {
        "characters": List<dynamic>.from(characters.map((x) => x.toJson())),
        "series": series.toJson(),
    };
}

class Character {
    Character({
        required this.id,
        required this.name,
        required this.age,
        required this.profession,
        required this.img,
    });

    int id;
    String name;
    int age;
    String profession;
    String img;

    factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        profession: json["profession"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "profession": profession,
        "img": img,
    };
}

class Series {
    Series({
        required this.title,
        required this.ott,
        required this.img,
        required this.desc,
    });

    String title;
    String ott;
    String img;
    String desc;

    factory Series.fromJson(Map<String, dynamic> json) => Series(
        title: json["title"],
        ott: json["ott"],
        img: json["img"],
        desc: json["desc"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "ott": ott,
        "img": img,
        "desc": desc,
    };
}
