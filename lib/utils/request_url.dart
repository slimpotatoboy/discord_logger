import 'package:http/http.dart' as http;
import 'package:discord_logger/discord_logger.dart';

Future requestUrl(String postBody) async {
  Uri url = Uri.parse(
      "https://discord.com/api/v10/channels/${DiscordLogger.instance.channelId}/messages");
  final response = await http.post(
    url,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bot ${DiscordLogger.instance.botToken}",
    },
    body: postBody,
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
