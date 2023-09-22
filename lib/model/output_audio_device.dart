// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AudioDeviceInformation {
  final String? name;
  final int? id;
  final String? address;
  final int? type;

  AudioDeviceInformation({this.name, this.address, this.id, this.type});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'address': address,
      'type': type,
    };
  }

  factory AudioDeviceInformation.fromMap(Map<String, dynamic> map) {
    return AudioDeviceInformation(
      name: map['name'] != null ? map['name'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      address: map['address'] != null ? map['address'] as String : null,
      type: map['type'] != null ? map['type'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AudioDeviceInformation.fromJson(String source) =>
      AudioDeviceInformation.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
