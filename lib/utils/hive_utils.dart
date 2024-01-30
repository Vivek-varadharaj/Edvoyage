import 'package:hive_flutter/adapters.dart';

import 'session_key.dart';

class HiveUtils {
  static Box<dynamic> session = Hive.box<dynamic>('session');

  static Future<void> init() async {
    await Hive.initFlutter();
    session = await Hive.openBox<dynamic>('session');
  }

  static void addSession(SessionKey key, dynamic value) {
    if (session == null) {
      throw Exception('Session box not initialized');
    }
    session.put(key.name, value);
  }

  static T getSession<T>(SessionKey key, {T? defaultValue}) {
    if (session == null) {
      throw Exception('Session box not initialized');
    }
    return session.get(key.name, defaultValue: defaultValue);
  }

  static void clear() {
    if (session == null) {
      throw Exception('Session box not initialized');
    }
    session.clear();
  }

  static void putData(isLogin, bool bool) {}
  static void putUsername(username, bool bool) {
// TODO: implement putUsername

    //Save the username in the session box
  }
}
