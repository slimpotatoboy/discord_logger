// To parse this JSON data, do
//
//     final discordMessageModel = discordMessageModelFromJson(jsonString);

import 'dart:convert';

List<DiscordMessageModel> discordMessageModelFromJson(String str) =>
    List<DiscordMessageModel>.from(
        json.decode(str).map((x) => DiscordMessageModel.fromJson(x)));

String discordMessageModelToJson(List<DiscordMessageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DiscordMessageModel {
  String id;
  int type;
  String content;
  String channelId;
  Author author;
  List<dynamic> attachments;
  List<dynamic> embeds;
  List<dynamic> mentions;
  List<dynamic> mentionRoles;
  bool pinned;
  bool mentionEveryone;
  bool tts;
  DateTime timestamp;
  dynamic editedTimestamp;
  int flags;
  List<dynamic> components;

  DiscordMessageModel({
    required this.id,
    required this.type,
    required this.content,
    required this.channelId,
    required this.author,
    required this.attachments,
    required this.embeds,
    required this.mentions,
    required this.mentionRoles,
    required this.pinned,
    required this.mentionEveryone,
    required this.tts,
    required this.timestamp,
    this.editedTimestamp,
    required this.flags,
    required this.components,
  });

  factory DiscordMessageModel.fromJson(Map<String, dynamic> json) =>
      DiscordMessageModel(
        id: json["id"],
        type: json["type"],
        content: json["content"],
        channelId: json["channel_id"],
        author: Author.fromJson(json["author"]),
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        embeds: List<dynamic>.from(json["embeds"].map((x) => x)),
        mentions: List<dynamic>.from(json["mentions"].map((x) => x)),
        mentionRoles: List<dynamic>.from(json["mention_roles"].map((x) => x)),
        pinned: json["pinned"],
        mentionEveryone: json["mention_everyone"],
        tts: json["tts"],
        timestamp: DateTime.parse(json["timestamp"]),
        editedTimestamp: json["edited_timestamp"],
        flags: json["flags"],
        components: List<dynamic>.from(json["components"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "content": content,
        "channel_id": channelId,
        "author": author.toJson(),
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "embeds": List<dynamic>.from(embeds.map((x) => x)),
        "mentions": List<dynamic>.from(mentions.map((x) => x)),
        "mention_roles": List<dynamic>.from(mentionRoles.map((x) => x)),
        "pinned": pinned,
        "mention_everyone": mentionEveryone,
        "tts": tts,
        "timestamp": timestamp.toIso8601String(),
        "edited_timestamp": editedTimestamp,
        "flags": flags,
        "components": List<dynamic>.from(components.map((x) => x)),
      };
}

class Author {
  String id;
  String username;
  dynamic globalName;
  dynamic displayName;
  dynamic avatar;
  String discriminator;
  int publicFlags;
  bool bot;
  dynamic avatarDecoration;

  Author({
    required this.id,
    required this.username,
    this.globalName,
    this.displayName,
    this.avatar,
    required this.discriminator,
    required this.publicFlags,
    required this.bot,
    this.avatarDecoration,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        username: json["username"],
        globalName: json["global_name"],
        displayName: json["display_name"],
        avatar: json["avatar"],
        discriminator: json["discriminator"],
        publicFlags: json["public_flags"],
        bot: json["bot"],
        avatarDecoration: json["avatar_decoration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "global_name": globalName,
        "display_name": displayName,
        "avatar": avatar,
        "discriminator": discriminator,
        "public_flags": publicFlags,
        "bot": bot,
        "avatar_decoration": avatarDecoration,
      };
}
