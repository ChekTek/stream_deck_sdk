import 'dart:convert';

class PluginArguments {
  final int port;
  final String pluginUuid;
  final String registerEvent;
  final Info info;

  PluginArguments({
    required this.port,
    required this.pluginUuid,
    required this.registerEvent,
    required this.info,
  });

  factory PluginArguments.fromExecutableArgumentsList(List<String> arguments) {
    return PluginArguments(
        port: int.parse(arguments[arguments.indexOf('-port') + 1]),
        pluginUuid: arguments[arguments.indexOf('-pluginUUID') + 1],
        registerEvent: arguments[arguments.indexOf('-registerEvent') + 1],
        info: Info.fromJson(jsonDecode(arguments[arguments.indexOf('-info') + 1])));
  }
}

class Application {
  String? font;
  String? language;
  String? platform;
  String? platformVersion;
  String? version;

  Application({this.font, this.language, this.platform, this.platformVersion, this.version});

  Application.fromJson(Map<String, dynamic> json) {
    font = json['font'];
    language = json['language'];
    platform = json['platform'];
    platformVersion = json['platformVersion'];
    version = json['version'];
  }
}

class Colors {
  String? buttonPressedBackgroundColor;
  String? buttonPressedBorderColor;
  String? buttonPressedTextColor;
  String? disabledColor;
  String? highlightColor;
  String? mouseDownColor;

  Colors(
      {this.buttonPressedBackgroundColor,
      this.buttonPressedBorderColor,
      this.buttonPressedTextColor,
      this.disabledColor,
      this.highlightColor,
      this.mouseDownColor});

  Colors.fromJson(Map<String, dynamic> json) {
    buttonPressedBackgroundColor = json['buttonPressedBackgroundColor'];
    buttonPressedBorderColor = json['buttonPressedBorderColor'];
    buttonPressedTextColor = json['buttonPressedTextColor'];
    disabledColor = json['disabledColor'];
    highlightColor = json['highlightColor'];
    mouseDownColor = json['mouseDownColor'];
  }
}

class Devices {
  String? id;
  String? name;
  Size? size;
  int? type;

  Devices({this.id, this.name, this.size, this.type});

  Devices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
    type = json['type'];
  }
}

class Size {
  int? columns;
  int? rows;

  Size({this.columns, this.rows});

  Size.fromJson(Map<String, dynamic> json) {
    columns = json['columns'];
    rows = json['rows'];
  }
}

class PluginInfo {
  String? uuid;
  String? version;

  PluginInfo({this.uuid, this.version});

  PluginInfo.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    version = json['version'];
  }
}

class Info {
  Application? application;
  Colors? colors;
  int? devicePixelRatio;
  List<Devices>? devices;
  PluginInfo? plugin;

  Info({this.application, this.colors, this.devicePixelRatio, this.devices, this.plugin});

  Info.fromJson(Map<String, dynamic> json) {
    application = json['application'] != null ? Application.fromJson(json['application']) : null;
    colors = json['colors'] != null ? Colors.fromJson(json['colors']) : null;
    devicePixelRatio = json['devicePixelRatio'];
    if (json['devices'] != null) {
      devices = <Devices>[];
      json['devices'].forEach((v) {
        devices!.add(new Devices.fromJson(v));
      });
    }
    plugin = json['plugin'] != null ? PluginInfo.fromJson(json['plugin']) : null;
  }
}
