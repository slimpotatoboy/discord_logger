# Discord Logger 🚀

[![GitHub stars](https://img.shields.io/github/stars/slimpotatoboy/discord_logger.svg?style=social)](https://github.com/slimpotatoboy/discord_logger)

[![Follow Twitter](https://img.shields.io/twitter/follow/slimpotatoboy?style=social)](https://twitter.com/intent/follow?screen_name=slimpotatoboy)

A simple flutter package to send message to discord channel via discord bot

## Usage

To use this plugin, add `discord_logger` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels) 🔗.

### Steps before using this package

- Create New Application in 🔗 https://discord.com/developers/applications.

- Go to OAuth2 in menu and go to Url Generator

- Select `applications.commands` and `bot` in the form

- For now, give Administrator Permissions in Bot Permissions

- Copy the Generated Url and Paste in your browser's new tab

- Add the server you want to access to send Messages(for now) and complete the process


### You are good to go now 👍

### Initialize [DiscordLogger]

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    DiscordLogger(
      channelId: "[Add Your Channel Id]",
      botToken: "[Add Your Bot Token]",
    );

    return MaterialApp(
      ...
    );
  }
}
```

## How to get the Channel ID and Bot Token?

- Go to https://discord.com/developers/applications and select the application

- Go to Bot Section in menu

- Add a New Bot

![Add Bot](https://dipenmaharjan.com.np/assets/png/addbot.jpg)

- Reset Token To get the Token

![Get Bot Token](https://dipenmaharjan.com.np/assets/png/gettoken.jpg)

- Copy the token and add to the botToken parameter


### Create Instance of DiscordLogger
```dart
final discord = DiscordLogger.instance;
```

#### Send Message:

```dart
...

discord.sendMessage("This is a error log to my channel");

...
```

#### Get All Messages:

```dart
...

List messages = [];
var response = await discord.getChannelMessages();
setState((){
  messages = response;
});

...
```

#### Edit a single message:

```dart
...

discord.updateChannelMessage(messageId: "123", message: "This is an updated message");

...
```

#### Delete a single message:

```dart
...

discord.deleteChannelMessage(messageId: "123");

...
```


## 🚀 Contributors

- [Dipen Maharjan](https://dipenmaharjan.com.np/)

---

**Any new Contributors are welcomed.**

Feel Free to request any missing features or report issues [here](https://github.com/slimpotatoboy/discord_logger/issues) 🔗.
