import 'package:deal_app/config/datasource.dart';
import 'package:deal_app/services/event_service.dart';
import 'package:test/test.dart';

void main() {
  group(EventService, () {
    test('createEvent() should return void', () async {
      await EventService().createEvent(
        title: 'test',
        about: 'test',
        cost: 100,
        date: DateTime.now(),
        adress: 'test',
        image: 'test',
      );
    });
    test('getEvent() should return DataSource', () async {
      const id = "4bdd3b85-7453-4925-bb81-142051dae958";
      final data = await EventService().getEvent(id: id);
      print((data as DataSuccess).data);
    });
  });
}
