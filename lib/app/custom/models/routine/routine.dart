import 'dart:convert';

import 'package:flutter/material.dart';

class Routine {
  int id;
  String? title;
  String? description;
  String? frequency;
  TimeOfDay? time;
  DateTime? dateCreated;
  int? status;
  int? missedNumber;
  int? doneNumber;
  Routine({
    required this.id,
    this.title,
    this.description,
    this.frequency,
    this.time,
    this.dateCreated,
    this.status,
    this.missedNumber,
    this.doneNumber,
  });

  Routine copyWith({
    int? id,
    String? title,
    String? description,
    String? frequency,
    TimeOfDay? time,
    DateTime? dateCreated,
    int? status,
    int? missedNumber,
    int? doneNumber,
  }) {
    return Routine(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      frequency: frequency ?? this.frequency,
      time: time ?? this.time,
      dateCreated: dateCreated ?? this.dateCreated,
      status: status ?? this.status,
      missedNumber: missedNumber ?? this.missedNumber,
      doneNumber: doneNumber ?? this.doneNumber,
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
      'status': status,
      'missedNumber': missedNumber,
      'doneNumber': doneNumber,
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
      status: map['status']?.toInt(),
      missedNumber: map['missedNumber']?.toInt(),
      doneNumber: map['doneNumber']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Routine.fromJson(String source) => Routine.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Routine(id: $id, title: $title, description: $description, frequency: $frequency, time: $time, dateCreated: $dateCreated, status: $status, missedNumber: $missedNumber, doneNumber: $doneNumber)';
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
      other.status == status &&
      other.missedNumber == missedNumber &&
      other.doneNumber == doneNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      frequency.hashCode ^
      time.hashCode ^
      dateCreated.hashCode ^
      status.hashCode ^
      missedNumber.hashCode ^
      doneNumber.hashCode;
  }
}
