import 'package:json_annotation/json_annotation.dart';

part 'characters_model.g.dart';

@JsonSerializable()
class CharactersModel {
  final CharactersModelInfo? info;
  final List<CharactersModelResults?>? results;

  CharactersModel(this.info, this.results);

  factory CharactersModel.fromJson(Map<String, dynamic> json) => _$CharactersModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersModelToJson(this);
}

@JsonSerializable()
class CharactersModelInfo {
  final int? count;
  final int? pages;
  final String? next;
  final dynamic prev;

  CharactersModelInfo(this.count, this.pages, this.next, this.prev);

  factory CharactersModelInfo.fromJson(Map<String, dynamic> json) =>
      _$CharactersModelInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersModelInfoToJson(this);
}

@JsonSerializable()
class CharactersModelResults {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final CharactersModelResultsOrigin? origin;
  final CharactersModelResultsLocation? location;
  final String? image;
  final List<String?>? episode;
  final String? url;
  final String? created;

  CharactersModelResults(this.id, this.name, this.status, this.species, this.type, this.gender,
      this.origin, this.location, this.image, this.episode, this.url, this.created);

  factory CharactersModelResults.fromJson(Map<String, dynamic> json) =>
      _$CharactersModelResultsFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersModelResultsToJson(this);
}

@JsonSerializable()
class CharactersModelResultsOrigin {
  final String? name;
  final String? url;

  CharactersModelResultsOrigin(this.name, this.url);

  factory CharactersModelResultsOrigin.fromJson(Map<String, dynamic> json) =>
      _$CharactersModelResultsOriginFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersModelResultsOriginToJson(this);
}

@JsonSerializable()
class CharactersModelResultsLocation {
  final String? name;
  final String? url;

  CharactersModelResultsLocation(this.name, this.url);

  factory CharactersModelResultsLocation.fromJson(Map<String, dynamic> json) =>
      _$CharactersModelResultsLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersModelResultsLocationToJson(this);
}
