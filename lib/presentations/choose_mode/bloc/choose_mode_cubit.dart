import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ChooseModeCubit extends HydratedCubit<ThemeMode>{
  //lưu giữ trang thái khi hoạt động và tắt

  //constructor lấy mode từ hệ thống
  ChooseModeCubit() : super(ThemeMode.system);

  //phát trạng thái để thay đổi
  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json["theme" as int]];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {"theme" : state.index};
  }

}


  
