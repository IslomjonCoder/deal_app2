import 'package:deal_app/models/event.dart';
import 'package:equatable/equatable.dart';

class EventState extends Equatable {
  const EventState();

  @override
  List<Object?> get props => [];
}

class EventInitialState extends EventState {
  const EventInitialState();

  @override
  List<Object?> get props => [];
}

class EventLoadingState extends EventState {
  const EventLoadingState();

  @override
  List<Object?> get props => [];
}

class EventLoadedState extends EventState {
  final List<Event> events;

  const EventLoadedState({required this.events});

  @override
  List<Object?> get props => [events];
}

class EventNotLoadedState extends EventState {
  final String msg;

  const EventNotLoadedState({required this.msg});

  @override
  List<Object?> get props => [msg];
}
