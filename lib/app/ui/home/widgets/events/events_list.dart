import 'package:calendar_app/app/ui/home/widgets/events/event_header.dart';
import 'package:calendar_app/app/ui/home/widgets/events/single_event.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
  const EventsList({
    Key? key,
    required this.events,
    required this.onAddEvent,
  }) : super(key: key);

  final List<EventDetailsEntity> events;
  final Function(BuildContext) onAddEvent;

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
                    eventDetailsEntity: EventDetailsEntity(
                        id: 1,
                        name: 'Watching Football ',
                        startTime: DateTime(2023),
                        endTime: DateTime(2023),
                        location: 'Stamford Bridge',
                        priorityColor: 0,
                        description:
                            'Manchester United vs Arsenal (Premiere League)',
                        reminder: 10,
                        date: DateTime.now()),
                    onEventTap: () {},
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
