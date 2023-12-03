import 'package:flutter/cupertino.dart';
import 'package:ready_structure/core/services/navigation.dart';
import '../../di/locator.dart';
import '../state/cubit_state.dart';
import 'screen_state.dart';

abstract class AppStatelessScreen extends StatelessWidget
    implements ScreenState {
  BuildContext? context;

  AppStatelessScreen({Key? key}) : super(key: key);

  @override
  content();

  ///stateless don't has a state
  @override
  onInitState() {}

  @override
  onUpdateState(ResourceState state) {}

  @override
  Widget build(BuildContext context) {
    _setup(context);
    onInitState();

    return content();
  }

  void _setup(BuildContext context) {
    this.context = context;
  }

  navigate(Widget to) {
    locator<NavigationService>().navigateByWidget(to);
  }
}
