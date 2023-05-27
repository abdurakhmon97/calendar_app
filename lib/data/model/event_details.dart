import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_details.freezed.dart';

part 'event_details.g.dart';

@freezed
class EventDetails with _$EventDetails {
  const factory EventDetails({
    int? id,
    String? name,
    String? startTime,
    String? location,
    int? priorityColor,
    String? endTime,
    String? description,
    int? reminder,
    String? date,
  }) = _EventDetails;

  factory EventDetails.fromJson(Map<String, dynamic> json) =>
      _$EventDetailsFromJson(json);
}
