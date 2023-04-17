library discord_logger;

import 'dart:convert';
import 'package:discord_logger/exception.dart';
import 'package:discord_logger/utils/request_url.dart';

class DiscordLogger {
  static DiscordLogger? _instance;
  static DiscordLogger get instance {
    _assertInstance();
    return _instance!;
  }

  factory DiscordLogger({
    required String channelId,
    required String botToken,
  }) {
    _instance = DiscordLogger._internal(channelId, botToken);

    return _instance!;
  }

  DiscordLogger._internal(this.channelId, this.botToken);

  ///
  final String channelId;
  final String botToken;

  /// pass [message] as string which also returns Future
  Future sendMessage(String message) async {
    _assertInstance();

    try {
      var postBody = jsonEncode({
        "content": message,
      });
      requestUrl(postBody);
    } catch (e) {
      throw DiscordLoggerException(e.toString());
    }
  }

  static void _assertInstance() {
    assert(
      _instance != null,
      "[DiscordLogger] instance needs to be created first.",
    );
  }
}
