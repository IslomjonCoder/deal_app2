import 'package:deal_app/config/datasource.dart';
import 'package:deal_app/models/message.dart';
import 'package:deal_app/services/chat_service.dart';
import 'package:test/test.dart';

void main() {
  group(
    ChatService,
    () {
      test(
        'sendMessage',
        () async {
          final service = ChatService();
          const content = 'Hello, how are you?';
          final dateTime = DateTime.now();
          const senderId = "cbfbf673-6e20-46bf-8a4a-ddb1325ce575";
          const whoId = "7131e28e-8a69-43d1-8de5-0988bf34d700";

          final result = await service.sendMessage(
            content: content,
            dateTime: dateTime,
            senderId: senderId,
            whoId: whoId,
          ) as DataSuccess;
          print("Data:${result.data}");
          expect(
            result.data!.content,
            content,
          );
          expect(
            result.data!.dateTime,
            dateTime,
          );
          expect(
            result.data!.senderId,
            senderId,
          );
          expect(
            result.data!.whoId,
            whoId,
          );
        },
      );

      test(
        'getAllMessage',
        () async {
          final service = ChatService();
          const senderId = "cbfbf673-6e20-46bf-8a4a-ddb1325ce575";
          const whoId = "7131e28e-8a69-43d1-8de5-0988bf34d700";

          final result = await service.getAllMessage(
            senderId: senderId,
            whoId: whoId,
          ) as DataSuccess<List<Message>>;
          print("Data:${result.data}");
          expect(
            result.data,
            isNotEmpty,
          );
        },
      );
    },
  );
}
