import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../di/locator.dart';
import '../../services/navigation.dart';
import '../cubit/app_cubit.dart';
import '../snackbar_and_toast/snackbar.dart';
import '../state/cubit_state.dart';
import 'screen_state.dart';


abstract class AppScreen<T extends StatefulWidget, BLOC extends AppCubit>
    extends State<T> implements ScreenState {
  late BLOC cubit;

  // afterBuild() {
  //   addPostFrameCallback(tem) {}
  // }
  late final height = MediaQuery.of(context).size.height;
  late final width = MediaQuery.of(context).size.width;

  @override
  Widget content();

  @override
  onInitState();

  @override
  onUpdateState(ResourceState state) {}

  @override
  void initState() {
    super.initState();
    _setup();
    //afterBuild();
    onInitState();
  }

  @override
  Widget build(BuildContext context) {
    afterBuildingScreen();
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return content();
  }

  _setup() {
    cubit = locator<BLOC>();
    //setContext(context);
  }

  afterBuildingScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //execute after building UI
    });
  }

  Widget blocConsumer({required BlocWidgetBuilder<ResourceState> builder}) {
    return BlocConsumer<BLOC, ResourceState>(
        bloc: locator<BLOC>(),
        listener: (context, state) {
          _handleState(state);
          onUpdateState(state);
        },
        builder: builder);
  }

  void _handleState(ResourceState state) {
    if (state is ErrorResource) {
      AppSnackBar.showErrorSnackBar(message: state.exception.toString());
      log("error from AppScreen: ${state.exception}");
    }
  }

  navigate(Widget to) {
    locator<NavigationService>().navigateByWidget(to);
  }
}
