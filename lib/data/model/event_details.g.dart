// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventDetails _$$_EventDetailsFromJson(Map<String, dynamic> json) =>
    _$_EventDetails(
      id: json['id'] as int?,
      name: json['name'] as String?,
      startTime: json['startTime'] as String?,
      location: json['location'] as String?,
      priorityColor: json['priorityColor'] as int?,
      endTime: json['endTime'] as String?,
      description: json['description'] as String?,
      reminder: json['reminder'] as int?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$_EventDetailsToJson(_$_EventDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startTime': instance.startTime,
      'location': instance.location,
      'priorityColor': instance.priorityColor,
      'endTime': instance.endTime,
      'description': instance.description,
      'reminder': instance.reminder,
      'date': instance.date,
    };
