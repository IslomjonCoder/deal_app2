import 'dart:convert';

import 'package:deal_app/config/apis.dart';
import 'package:deal_app/config/datasource.dart';
import 'package:deal_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/userinfo.profile',
  ]);

  Future<(String?, String?, String?, String?)> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    final User? currentUser = _auth.currentUser;
    final String? lastName =
        await _getLastName(googleSignInAuthentication?.accessToken);
    print(currentUser);
    return (currentUser?.displayName, lastName, currentUser?.email, '');
  }

  Future<String?> _getLastName(String? accessToken) async {
    if (accessToken == null) return null;

    const url = 'https://people.googleapis.com/v1/people/me?personFields=names';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final names = data['names'] as List<dynamic>;
      if (names.isNotEmpty) {
        return names[0]['familyName'] as String?;
      }
    }

    return null;
  }

  Future<bool> deleteUser(String id) async {
    final uri = Uri.http(Apis.baseUrl, Apis.deleteUser, {"id": id});
    final response = await http.delete(uri);

    return response.statusCode == 200;
  }

  void signOutGoogle() async => await googleSignIn.signOut();

  Future<DataSource> registerUser(
      String firstName,
      String lastName,
      String patronymic,
      int age,
      String gender,
      String about,
      String born,
      List<String> hobby,
      String avatar,
      List<String> usersChat,
      List<String> userChatIgnore,
      bool online) async {
    final uri = Uri.http(Apis.baseUrl, Apis.registerUser);
    final response = await http.post(uri,
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "patronymic": patronymic,
          "age": age,
          "gender": gender,
          "about": about,
          "born": born,
          "hobby": hobby,
          "avatar": avatar,
          "usersChat": usersChat,
          "userChatIgnore": userChatIgnore,
          "online": online
        }));

    if (response.statusCode == 200) {
      return DataSuccess<CustomUser>(
          data: CustomUser.fromJson(jsonDecode(response.body)),
          message: "User register success");
    }

    return DataFailure(message: "Something got wrong ${response.body}");
  }
}

class TelegramSignIn extends StatefulWidget {
  const TelegramSignIn({super.key});

  @override
  _TelegramSignInState createState() => _TelegramSignInState();
}

class _TelegramSignInState extends State<TelegramSignIn> {
  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  Future<void> initUniLinks() async {
    // Handle incoming links when the app is opened from a link
    try {
      final initialLink = await getInitialLink();
      if (initialLink != null) {
        handleIncomingLink(Uri.parse(initialLink));
      }
    } catch (e) {
      // Handle exception
    }

    // Handle incoming links when the app is already running
    uriLinkStream.listen((Uri? link) {
      if (link != null) {
        handleIncomingLink(link);
      }
    }, onError: (err) {
      // Handle exception
    });
  }

  void handleIncomingLink(Uri link) {
    // Extract token from the incoming link
    // Example: yourapp://auth?token=12345
    String? token = link.queryParameters['token'];
    if (token != null) {
      // Use this token to fetch user info from your backend
      fetchUserInfo(token);
    }
  }

  Future<void> fetchUserInfo(String token) async {
    // Implement API call to your backend to fetch user info using the token
    // Update your app state with the user info
  }

  Future<void> initiateLoginUrl() async {
    const url =
        'https://t.me/YourBotUsername'; // Replace with your bot's username
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: initiateLoginUrl,
      child: const Text('Sign in with Telegram'),
    );
  }
}
