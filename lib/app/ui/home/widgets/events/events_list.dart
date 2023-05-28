import 'package:calendar_app/app/ui/home/widgets/events/event_header.dart';
import 'package:calendar_app/app/ui/home/widgets/events/single_event.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
  const EventsList({
    Key? key,
    required this.events,
    required this.onAddEvent,
    required this.onEditEvent,
  }) : super(key: key);

  final List<EventDetailsEntity> events;
  final Function(BuildContext) onAddEvent;
  final Function(BuildContext, EventDetailsEntity) onEditEvent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EventHeader(onAddEvent: onAddEvent),
        const SizedBox(height: 18),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SingleEvent(
                    eventDetailsEntity: events[index],
                    onEventTap: () => onEditEvent(context, events[index]),
                  ),
                  if (index < events.length - 1) const SizedBox(height: 14),
                ],
              );
            },
            itemCount: events.length,
          ),
        ),
      ],
    );
  }
}
