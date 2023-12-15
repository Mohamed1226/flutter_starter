// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_url_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionModel _$VersionModelFromJson(Map<String, dynamic> json) => VersionModel(
      maintainState: MaintainState.fromJson(
          json['maintain_state'] as Map<String, dynamic>),
      minimumSupportedVersion: json['minimum_supported_version'] as String,
      updateUrl: UpdateUrl.fromJson(json['update_url'] as Map<String, dynamic>),
      latestVersion: json['latest_version'] as String,
    );

Map<String, dynamic> _$VersionModelToJson(VersionModel instance) =>
    <String, dynamic>{
      'maintain_state': instance.maintainState,
      'minimum_supported_version': instance.minimumSupportedVersion,
      'latest_version': instance.latestVersion,
      'update_url': instance.updateUrl,
    };

MaintainState _$MaintainStateFromJson(Map<String, dynamic> json) =>
    MaintainState(
      maintainMsg: LocalizedStringValue.fromJson(
          json['maintain_msg'] as Map<String, dynamic>),
      underMaintenance: json['under_maintenance'] as bool,
    );

Map<String, dynamic> _$MaintainStateToJson(MaintainState instance) =>
    <String, dynamic>{
      'maintain_msg': instance.maintainMsg,
      'under_maintenance': instance.underMaintenance,
    };

UpdateUrl _$UpdateUrlFromJson(Map<String, dynamic> json) => UpdateUrl(
      android: json['android'] as String,
      ios: json['ios'] as String,
    );

Map<String, dynamic> _$UpdateUrlToJson(UpdateUrl instance) => <String, dynamic>{
      'android': instance.android,
      'ios': instance.ios,
    };
