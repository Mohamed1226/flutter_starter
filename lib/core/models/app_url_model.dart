import 'dart:io';

import 'localized_string_value.dart';

class VersionModel {
  VersionModel({
    required this.maintainState,
    required this.minimumSupportedVersion,
    required this.updateUrl,
    required this.latestVersion,
  });

  MaintainState maintainState;
  String minimumSupportedVersion;
  String latestVersion;
  UpdateUrl updateUrl;

  factory VersionModel.mock() => VersionModel(
      latestVersion: '12.0.10',
      minimumSupportedVersion: '12.0.10',
      maintainState: MaintainState.mock(),
      updateUrl: UpdateUrl.mock());

  factory VersionModel.fromJson(Map<String, dynamic> json) => VersionModel(
        maintainState: MaintainState.fromJson(json["maintain_state"]),
        minimumSupportedVersion: json["minimum_supported_version"],
        latestVersion: json["latest_version"],
        updateUrl: UpdateUrl.fromJson(json["update_url"]),
      );

  // factory VersionModel.fromDoc(
  //     DocumentSnapshot<Map<String, dynamic>> snapshot) {
  //   final json = snapshot.data();
  //   return VersionModel.fromJson(json ?? {});
  // }

  Map<String, dynamic> toJson() => {
        "maintain_state": maintainState.toJson(),
        "minimum_supported_version": minimumSupportedVersion,
        "latest_version": latestVersion,
        "update_url": updateUrl.toJson(),
      };
}

class MaintainState {
  MaintainState({
    required this.maintainMsg,
    required this.underMaintenance,
  });

  LocalizedStringValue maintainMsg;
  bool underMaintenance;

  factory MaintainState.mock() => MaintainState(
        maintainMsg: LocalizedStringValue(arValue: '', enValue: ''),
        underMaintenance: false,
      );

  factory MaintainState.fromJson(Map<String, dynamic> json) => MaintainState(
        maintainMsg: LocalizedStringValue.fromJson(json["maintain_msg"]),
        underMaintenance: json["under_maintenance"] == null
            ? null
            : json["under_maintenance"],
      );

  Map<String, dynamic> toJson() => {
        "maintain_msg": maintainMsg.toJson(),
        "under_maintenance": underMaintenance,
      };
}

class UpdateUrl {
  UpdateUrl({
    required this.android,
    required this.ios,
  });

  String android;
  String ios;

  String get value {
    if (Platform.isIOS) {
      return ios;
    } else {
      return android;
    }
  }

  factory UpdateUrl.mock() => UpdateUrl(android: '', ios: '');

  factory UpdateUrl.fromJson(Map<String, dynamic> json) => UpdateUrl(
        android: json["android"] == null ? null : json["android"],
        ios: json["ios"] == null ? null : json["ios"],
      );

  Map<String, dynamic> toJson() => {
        "android": android,
        "ios": ios,
      };
}
