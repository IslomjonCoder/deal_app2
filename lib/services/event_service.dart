import 'dart:convert';

import 'package:deal_app/config/datasource.dart';
import 'package:deal_app/models/event.dart';
import 'package:http/http.dart' as http;

class EventService {
  Future<DataSource> createEvent({
    required String title,
    required String about,
    required int cost,
    required DateTime date,
    required String adress,
    required String image,
  }) async {
    final time =
        "${date.hour.toString().padLeft(2, "0")}:${date.minute.toString().padLeft(2, "0")}:${date.second.toString().padLeft(2, "0")}";

    final dateString = "${date.year}-${date.month}-${date.day}T$time";
    final body = jsonEncode(<String, dynamic>{
      "title": "string",
      "about": "string",
      "cost": 0,
      "date": "2025-01-06T14:16:40",
      "adress": "string",
      "image": "string"
    });
    print("DateTime: $dateString");
    print("Body: $body");
    final response = await http.post(
      Uri.parse('http://5.35.81.3:8080/Event/create-event'),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json',
      },
      body: body,
    );
    if (response.statusCode == 200) {
      return DataSuccess<Event>(
        data: Event.fromJson(jsonDecode(response.body)),
        message: "Event create success",
      );
    }
    return DataFailure(message: "Something got wrong ${response.body}");
  }

  Future<DataSource> getEvent({
    required String id,
  }) async {
    final response = await http.get(
      Uri.parse('http://5.35.81.3:8080/Event/get-event?id=$id'),
      headers: {
        'accept': '*/*',
      },
    );
    if (response.statusCode == 200) {
      return DataSuccess<Event>(
        data: Event.fromJson(jsonDecode(response.body)),
        message: "Event fetch success",
      );
    }
    return DataFailure(message: "Something got wrong ${response.body}");
  }

  Future<DataSource> getEvents() async {
    final response = await http.get(
      Uri.parse('http://5.35.81.3:8080/Event/get-events'),
      headers: {
        'accept': '*/*',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> eventsJson = json.decode(response.body);
      final List<Event> events =
          eventsJson.map((el) => Event.fromJson(el)).toList();

      return DataSuccess<List<Event>>(
        data: events,
        message: "Event fetch success",
      );
    }
    return DataFailure(message: "Something got wrong ${response.body}");
  }

/*************  ✨ Codeium Command ⭐  *************/

  Future<DataSource> editEvent({
    required String id,
    required String title,
    required String about,
    required int cost,
    required DateTime date,
    required String adress,
    required String image,
  }) async {
    final dateString = "${date.toIso8601String()}Z";
    final body = jsonEncode(<String, dynamic>{
      "title": title,
      "about": about,
      "cost": cost,
      "date": dateString,
      "adress": adress,
      "image": image
    });
    final response = await http.post(
      Uri.parse('http://5.35.81.3:8080/Event/edit-event?id=$id'),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json',
      },
      body: body,
    );
    if (response.statusCode == 200) {
      return DataSuccess<Event>(
        data: Event.fromJson(jsonDecode(response.body)),
        message: "Event edit success",
      );
    }
    return DataFailure(message: "Something got wrong ${response.body}");
  }
/******  a091933d-6511-4c0b-a685-12566e02622c  *******/
}
