library discord_logger;

import 'dart:convert';
import 'package:discord_logger/exception.dart';
import 'package:discord_logger/utils/utils.dart';

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

  /// get [messages] of specific [channels]
  Future getChannelMessages() async {
    _assertInstance();
    try {
      var getResponse = await requestChannelMessages();
      return getResponse;
    } catch (e) {
      throw DiscordLoggerException(e.toString());
    }
  }

  /// update [message] of specific [channel]
  Future updateChannelMessage(
      {required String messageId, required String message}) async {
    _assertInstance();
    try {
      var postBody = jsonEncode({
        "content": message,
      });
      var getResponse = await updateChannelMessages(messageId, postBody);
      return getResponse;
    } catch (e) {
      throw DiscordLoggerException(e.toString());
    }
  }

  /// delete a [message] of specific [channel]
  Future deleteChannelMessage({required String messageId}) async {
    _assertInstance();
    try {
      var getResponse = await deleteChannelMessages(messageId);
      return getResponse;
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
