// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersModel _$CharactersModelFromJson(Map<String, dynamic> json) =>
    CharactersModel(
      json['info'] == null
          ? null
          : CharactersModelInfo.fromJson(json['info'] as Map<String, dynamic>),
      (json['results'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CharactersModelResults.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersModelToJson(CharactersModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

CharactersModelInfo _$CharactersModelInfoFromJson(Map<String, dynamic> json) =>
    CharactersModelInfo(
      (json['count'] as num?)?.toInt(),
      (json['pages'] as num?)?.toInt(),
      json['next'] as String?,
      json['prev'],
    );

Map<String, dynamic> _$CharactersModelInfoToJson(
        CharactersModelInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };

CharactersModelResults _$CharactersModelResultsFromJson(
        Map<String, dynamic> json) =>
    CharactersModelResults(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['status'] as String?,
      json['species'] as String?,
      json['type'] as String?,
      json['gender'] as String?,
      json['origin'] == null
          ? null
          : CharactersModelResultsOrigin.fromJson(
              json['origin'] as Map<String, dynamic>),
      json['location'] == null
          ? null
          : CharactersModelResultsLocation.fromJson(
              json['location'] as Map<String, dynamic>),
      json['image'] as String?,
      (json['episode'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      json['url'] as String?,
      json['created'] as String?,
    );

Map<String, dynamic> _$CharactersModelResultsToJson(
        CharactersModelResults instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created,
    };

CharactersModelResultsOrigin _$CharactersModelResultsOriginFromJson(
        Map<String, dynamic> json) =>
    CharactersModelResultsOrigin(
      json['name'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$CharactersModelResultsOriginToJson(
        CharactersModelResultsOrigin instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

CharactersModelResultsLocation _$CharactersModelResultsLocationFromJson(
        Map<String, dynamic> json) =>
    CharactersModelResultsLocation(
      json['name'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$CharactersModelResultsLocationToJson(
        CharactersModelResultsLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
