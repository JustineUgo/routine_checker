import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Routine {
  int id;
  String? title;
  String? description;
  String? frequency;
  TimeOfDay? time;
  DateTime? dateCreated;
  DateTime? dateExpired;
  int? status;
  // int? missedNumber;
  // int? doneNumber;
  List<DateTime>? datesMissed;
  List<DateTime>? datesDone;
  List<DateTime>? datesScheduled;
  String? info;
  String? expireInfo;
  Routine({
    required this.id,
    this.title,
    this.description,
    this.frequency,
    this.time,
    this.dateCreated,
    this.dateExpired,
    this.status,
    this.datesMissed,
    this.datesDone,
    this.datesScheduled,
    this.info,
    this.expireInfo,
  });



  Routine copyWith({
    int? id,
    String? title,
    String? description,
    String? frequency,
    TimeOfDay? time,
    DateTime? dateCreated,
    DateTime? dateExpired,
    int? status,
    List<DateTime>? datesMissed,
    List<DateTime>? datesDone,
    List<DateTime>? datesScheduled,
    String? info,
    String? expireInfo,
  }) {
    return Routine(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      frequency: frequency ?? this.frequency,
      time: time ?? this.time,
      dateCreated: dateCreated ?? this.dateCreated,
      dateExpired: dateExpired ?? this.dateExpired,
      status: status ?? this.status,
      datesMissed: datesMissed ?? this.datesMissed,
      datesDone: datesDone ?? this.datesDone,
      datesScheduled: datesScheduled ?? this.datesScheduled,
      info: info ?? this.info,
      expireInfo: expireInfo ?? this.expireInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'frequency': frequency,
      'time': [time?.hour, time?.minute],
      'dateCreated': dateCreated?.millisecondsSinceEpoch,
      'dateExpired': dateExpired?.millisecondsSinceEpoch,
      'status': status,
      'datesMissed': datesMissed?.map((x) => x.millisecondsSinceEpoch).toList(),
      'datesDone': datesDone?.map((x) => x.millisecondsSinceEpoch).toList(),
      'datesScheduled': datesScheduled?.map((x) => x.millisecondsSinceEpoch).toList(),
      'info': info,
      'expireInfo': expireInfo,
    };
  }

  factory Routine.fromMap(Map<String, dynamic> map) {
    return Routine(
      id: map['id']?.toInt() ?? 0,
      title: map['title'],
      description: map['description'],
      frequency: map['frequency'],
      time: map['time'] != null ? TimeOfDay(hour: map['time'][0], minute: map['time'][1]) : null,
      dateCreated: map['dateCreated'] != null ? DateTime.fromMillisecondsSinceEpoch(map['dateCreated']) : null,
      dateExpired: map['dateExpired'] != null ? DateTime.fromMillisecondsSinceEpoch(map['dateExpired']) : null,
      status: map['status']?.toInt(),
      datesMissed: map['datesMissed'] != null ? List<DateTime>.from(map['datesMissed']?.map((x) => DateTime.fromMillisecondsSinceEpoch(x))) : null,
      datesDone: map['datesDone'] != null ? List<DateTime>.from(map['datesDone']?.map((x) => DateTime.fromMillisecondsSinceEpoch(x))) : null,
      datesScheduled: map['datesScheduled'] != null ? List<DateTime>.from(map['datesScheduled']?.map((x) => DateTime.fromMillisecondsSinceEpoch(x))) : null,
      info: map['info'],
      expireInfo: map['expireInfo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Routine.fromJson(String source) => Routine.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Routine(id: $id, title: $title, description: $description, frequency: $frequency, time: $time, dateCreated: $dateCreated, dateExpired: $dateExpired, status: $status, datesMissed: $datesMissed, datesDone: $datesDone, datesScheduled: $datesScheduled, info: $info, expireInfo: $expireInfo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Routine &&
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.frequency == frequency &&
      other.time == time &&
      other.dateCreated == dateCreated &&
      other.dateExpired == dateExpired &&
      other.status == status &&
      listEquals(other.datesMissed, datesMissed) &&
      listEquals(other.datesDone, datesDone) &&
      listEquals(other.datesScheduled, datesScheduled) &&
      other.info == info &&
      other.expireInfo == expireInfo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      frequency.hashCode ^
      time.hashCode ^
      dateCreated.hashCode ^
      dateExpired.hashCode ^
      status.hashCode ^
      datesMissed.hashCode ^
      datesDone.hashCode ^
      datesScheduled.hashCode ^
      info.hashCode ^
      expireInfo.hashCode;
  }
}
