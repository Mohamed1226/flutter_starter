import '../state/cubit_state.dart';

abstract class ScreenState {
  content();

  onInitState();

  onUpdateState(ResourceState state) {}
}
