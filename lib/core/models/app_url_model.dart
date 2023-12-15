import 'dart:io';
import 'localized_string_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_url_model.g.dart';

@JsonSerializable()
class VersionModel {
  VersionModel({
    required this.maintainState,
    required this.minimumSupportedVersion,
    required this.updateUrl,
    required this.latestVersion,
  });

  @JsonKey(name: "maintain_state")
  MaintainState maintainState;
  @JsonKey(name: "minimum_supported_version")
  String minimumSupportedVersion;
  @JsonKey(name: "latest_version")
  String latestVersion;
  @JsonKey(name: "update_url")
  UpdateUrl updateUrl;

  factory VersionModel.mock() => VersionModel(
      latestVersion: '12.0.10',
      minimumSupportedVersion: '12.0.10',
      maintainState: MaintainState.mock(),
      updateUrl: UpdateUrl.mock());

  factory VersionModel.fromJson(Map<String, dynamic> json) =>
      _$VersionModelFromJson(json);

  // factory VersionModel.fromDoc(
  //     DocumentSnapshot<Map<String, dynamic>> snapshot) {
  //   final json = snapshot.data();
  //   return VersionModel.fromJson(json ?? {});
  // }

  Map<String, dynamic> toJson() => _$VersionModelToJson(this);
}

@JsonSerializable()
class MaintainState {
  MaintainState({
    required this.maintainMsg,
    required this.underMaintenance,
  });

  @JsonKey(name: "maintain_msg")
  LocalizedStringValue maintainMsg;
  @JsonKey(name: "under_maintenance")
  bool underMaintenance;

  factory MaintainState.mock() => MaintainState(
        maintainMsg: const LocalizedStringValue(arValue: '', enValue: ''),
        underMaintenance: false,
      );

  factory MaintainState.fromJson(Map<String, dynamic> json) =>
      _$MaintainStateFromJson(json);

  Map<String, dynamic> toJson() => _$MaintainStateToJson(this);
}

@JsonSerializable()
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

  factory UpdateUrl.fromJson(Map<String, dynamic> json) =>
      _$UpdateUrlFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUrlToJson(this);
}
