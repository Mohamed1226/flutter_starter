//
// import 'dart:developer';
//
// import '../../../models/app_url_model.dart';
// import '../../../ui/cubit/app_cubit.dart';
// import '../../../ui/dialogs/app_dialog.dart';
// import '../../../ui/state/cubit_state.dart';
//
// class AppUpdateCubit extends AppCubit {
//   AppUpdateCubit() : super(InitResource());
//
//   Future<void> setup() async {
//     /// Get current version
//     final currentVersion = await AppVersion.instance.getVersion();
//     log("currentVersion in store $currentVersion");
//
//     /// Emmit init state with current version
//     await _checkVersion(currentVersion);
//   }
//
//   Future<void> _checkVersion(String currentVersion) async {
//     final result = await DIManager.firebaseRepo.getVersionInfo();
//     log("currentVersion in firebaseRepo $result");
//     _handleVersionResponse(
//         remoteVersionInfo: result, currentVersion: currentVersion);
//   }
//
//   void _handleVersionResponse(
//       {required String currentVersion,
//       required VersionModel remoteVersionInfo}) {
//     if (remoteVersionInfo.maintainState.underMaintenance) {
//       AppDialogs.showUnderMaintenanceDialog(
//           underMaintenanceMessage:
//           remoteVersionInfo.maintainState.maintainMsg.value);
//       return;
//     } else {
//       _compareRemoteAndCurrentVersion(
//           currentVersion: currentVersion, remoteVersionInfo: remoteVersionInfo);
//     }
//   }
//
//   void _compareRemoteAndCurrentVersion(
//       {required String currentVersion,
//       required VersionModel remoteVersionInfo}) {
//     final current = Version.parse(currentVersion);
//     final minimumSupported =
//         Version.parse(remoteVersionInfo.minimumSupportedVersion);
//     final latest = Version.parse(remoteVersionInfo.latestVersion);
//
//     //Updated
//     if (current == latest) {
//       log("version state is updated current $current latest $latest");
//     }
//
//     if (current < minimumSupported) {
//       //Force Update  major
//       log("version state is force update current $current latest $latest");
//
//       AppDialogs.showForceUpdateDialog(
//           updateUrl: UpdateUrl(
//               android: remoteVersionInfo.updateUrl.android,
//               ios: remoteVersionInfo.updateUrl.android),
//           onDone: () {
//             setup();
//           });
//       return;
//     }
//
//     if (current < latest) {
//       log("version state is Optional update current $current latest $latest");
//
//       /// Still supported
//       AppDialogs.showOptionalUpdateDialog(
//           updateUrl: UpdateUrl(
//               android: remoteVersionInfo.updateUrl.android,
//               ios: remoteVersionInfo.updateUrl.android));
//       return;
//     }
//   }
// }
