import 'package:deal_app/bloc/event_bloc/event_event.dart';
import 'package:deal_app/bloc/event_bloc/event_state.dart';
import 'package:deal_app/models/event.dart';

import 'package:deal_app/services/event_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/datasource.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final EventService _eventService = EventService();

  EventBloc({req}) : super(const EventInitialState()) {
    on<GetEventsEvent>(onGetEvents);
  }

  Future<void> onGetEvents(
      GetEventsEvent event, Emitter<EventState> emit) async {
    emit(const EventLoadingState());

    final result = await _eventService.getEvents();

    if (result is DataSuccess<List<Event>>) {
      emit(EventLoadedState(events: result.data));
    } else if (result is DataFailure) {
      emit(EventNotLoadedState(msg: result.message));
    }
  }
}
