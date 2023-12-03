import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/cubit_state.dart';

class AppCubit extends Cubit<ResourceState> {
  AppCubit(ResourceState initialState) : super(initialState);

  @mustCallSuper
  @override
  Future<void> close() {
    return super.close();
  }
}
