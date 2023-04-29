import 'package:discord_logger/models/discord_channel_messages.dart';
import 'package:http/http.dart' as http;
import 'package:discord_logger/discord_logger.dart';

/// [requestChannelMessages] is to [GET] the list of all messages
Future requestChannelMessages() async {
  Uri url = Uri.parse(
      "https://discord.com/api/v10/channels/${DiscordLogger.instance.channelId}/messages");
  final response = await http.get(
    url,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bot ${DiscordLogger.instance.botToken}",
    },
  );

  if (response.statusCode == 200) {
    return discordMessageModelFromJson(response.body);
  } else {
    return false;
  }
}

/// [updateChannelMessages] is to [PATCH] a single message
Future updateChannelMessages(String messageId, String body) async {
  Uri url = Uri.parse(
      "https://discord.com/api/v10/channels/${DiscordLogger.instance.channelId}/messages/$messageId");
  final response = await http.patch(
    url,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bot ${DiscordLogger.instance.botToken}",
    },
    body: body,
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

/// [deleteChannelMessages] is to [DELETE] a message
Future deleteChannelMessages(String messageId) async {
  Uri url = Uri.parse(
      "https://discord.com/api/v10/channels/${DiscordLogger.instance.channelId}/messages/$messageId");
  final response = await http.delete(
    url,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bot ${DiscordLogger.instance.botToken}",
    },
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
