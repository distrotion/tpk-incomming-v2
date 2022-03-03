import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../ConsolePanal/ConsoleBox.dart';

//-------------------------------------------------
String server = 'http://172.23.10.40:9210/';

abstract class Report_Event {}

class CreateReport extends Report_Event {}

class Report_Bloc extends Bloc<Report_Event, int> {
  Report_Bloc() : super(0) {
    on<CreateReport>((event, emit) {
      return _Report_Function_01(0, emit);
    });
  }
  //-----------------------------------
  Future<void> _Report_Function_01(int toAdd, Emitter<int> emit) async {
    final response = await Dio().post(
      server + "reportservice",
      data: {"MATNR": MATNRnow, "CHARG": CHARGnow},
    );

    print("object");

    emit(0);
  }
}
