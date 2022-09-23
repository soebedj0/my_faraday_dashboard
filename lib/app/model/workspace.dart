// To parse this JSON data, do
//
//     final workspace = workspaceFromJson(jsonString);

import 'dart:convert';

Workspace workspaceFromJson(String str) => Workspace.fromJson(json.decode(str));

String workspaceToJson(Workspace data) => json.encode(data.toJson());

class Workspace {
  Workspace({
    required this.public,
    required this.scope,
    required this.readonly,
    required this.stats,
    required this.id,
    required this.lastRunAgentDate,
    required this.updateDate,
    required this.customer,
    required this.description,
    required this.name,
    required this.histogram,
    required this.duration,
    required this.users,
    required this.active,
    required this.createDate,
    required this.workspaceId,
    required this.important,
  });

  bool public;
  String scope;
  bool readonly;
  String stats;
  int id;
  DateTime lastRunAgentDate;
  DateTime updateDate;
  String customer;
  String description;
  String name;
  List<Histogram> histogram;
  String duration;
  List<String> users;
  bool active;
  DateTime createDate;
  int workspaceId;
  bool important;

  factory Workspace.fromJson(Map<String, dynamic> json) => Workspace(
        public: json["public"],
        scope: json["scope"],
        readonly: json["readonly"],
        stats: json["stats"],
        id: json["_id"],
        lastRunAgentDate: DateTime.parse(json["last_run_agent_date"]),
        updateDate: DateTime.parse(json["update_date"]),
        customer: json["customer"],
        description: json["description"],
        name: json["name"],
        histogram: List<Histogram>.from(
            json["histogram"].map((x) => Histogram.fromJson(x))),
        duration: json["duration"],
        users: List<String>.from(json["users"].map((x) => x)),
        active: json["active"],
        createDate: DateTime.parse(json["create_date"]),
        workspaceId: json["id"],
        important: json["important"],
      );

  Map<String, dynamic> toJson() => {
        "public": public,
        "scope": scope,
        "readonly": readonly,
        "stats": stats,
        "_id": id,
        "last_run_agent_date": lastRunAgentDate.toIso8601String(),
        "update_date": updateDate.toIso8601String(),
        "customer": customer,
        "description": description,
        "name": name,
        "histogram": List<dynamic>.from(histogram.map((x) => x.toJson())),
        "duration": duration,
        "users": List<dynamic>.from(users.map((x) => x)),
        "active": active,
        "create_date": createDate.toIso8601String(),
        "id": workspaceId,
        "important": important,
      };
}

class Histogram {
  Histogram({
    required this.medium,
    required this.high,
    required this.critical,
    required this.confirmed,
    required this.date,
  });

  int medium;
  int high;
  int critical;
  int confirmed;
  String date;

  factory Histogram.fromJson(Map<String, dynamic> json) => Histogram(
        medium: json["medium"],
        high: json["high"],
        critical: json["critical"],
        confirmed: json["confirmed"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
        "high": high,
        "critical": critical,
        "confirmed": confirmed,
        "date": date,
      };
}
