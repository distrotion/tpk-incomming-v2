import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../data/model.dart';
import '../../data_dummy.dart';

String server = 'http://localhost:9210/';

/// Event being processed by [CounterBloc].
abstract class DataSetEvent {}

/// Notifies bloc to increment state.
class GetDataPressed extends DataSetEvent {}

class CounterValue extends DataSetBloc {
  final int value;
  CounterValue(this.value);
}

class DataSetBloc extends Bloc<DataSetEvent, List<dataset>> {
  /// {@macro counter_bloc}
  DataSetBloc() : super(<dataset>[]) {
    on<GetDataPressed>((event, emit) {
      return _getdata([], emit);
    });
  }
  Future<void> _getdata(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    // http://localhost:9210/tblSAPGoodReceive_get
    final response = await http.post(
        Uri.parse(server + "tblSAPGoodReceive_get"),
        body: {"MATNR": "", "CHARG": ""});
    print(response.statusCode);
    print(response.body);
    var data_input = [];
    List<dataset> stateoutput = [];
    if (response.statusCode == 200) {
      var databuff = jsonDecode(response.body);
      data_input = databuff[0]['output'];
      for (var i = 0; i < data_input.length; i++) {
        stateoutput.add(dataset(
          id: i + 1,
          f01: data_input[i]['MATNR'].toString(),
          f02: data_input[i]['NAME1'].toString(),
          f03: data_input[i]['PART_NM'].toString(),
          f04: data_input[i]['PART_NO'].toString(),
          f05: data_input[i]['CHARG'].toString(),
          f06: data_input[i]['CUST_LOT'].toString(),
          f07: data_input[i]['STATUS'].toString(),
          f08: "",
          f09: data_input[i]['MATNR'].toString(),
          f10: data_input[i]['CHARG'].toString(),
          f11: data_input[i]['MBLNR'].toString(),
          f12: data_input[i]['BWART'].toString(),
          f13: data_input[i]['MENGE'].toString(),
          f14: data_input[i]['MEINS'].toString(),
          f15: data_input[i]['MAT_FG'].toString(),
          f16: data_input[i]['KUNNR'].toString(),
          f17: data_input[i]['SORTL'].toString(),
          f18: data_input[i]['NAME1'].toString(),
          f19: data_input[i]['CUST_LOT'].toString(),
          f20: data_input[i]['PART_NM'].toString(),
          f21: data_input[i]['PART_NO'].toString(),
          f22: data_input[i]['PROCESS'].toString(),
          f23: data_input[i]['OLDMAT_CP'].toString(),
          f24: data_input[i]['STATUS'].toString(),
          f25: "",
          f26: "",
        ));
      }
      emit(stateoutput);
    } else {
      print("where is my server");
      emit([]);
    }
  }

  Future<void> _PostData01(int toAdd, Emitter<int> emit) async {}
}

//-------------------------------------------------

abstract class DropDownData_INCM_Event {}

class DropDownData_INCM_Pressed extends DropDownData_INCM_Event {}

class DropDownData_INCM_Bloc
    extends Bloc<DropDownData_INCM_Event, DropDownData_INCM> {
  /// {@macro counter_bloc}
  DropDownData_INCM_Bloc() : super(zeroDropDownData_MR) {
    on<DropDownData_INCM_Pressed>((event, emit) {
      return _PostData01_1(zeroDropDownData_MR, emit);
    });
  }
  Future<void> _PostData01_1(
      DropDownData_INCM toAdd, Emitter<DropDownData_INCM> emit) async {
    emit(zeroDropDownData_MR);
  }
}

//-------------------------------------------------

abstract class CallDropDownDataS_INCM_Event {}

class CallDropDownDataS_INCM_Pressed_01 extends CallDropDownDataS_INCM_Event {}

class CallDropDownDataS_INCM_Pressed_02 extends CallDropDownDataS_INCM_Event {}

class CallDropDownDataS_INCM_Bloc
    extends Bloc<CallDropDownDataS_INCM_Event, CallDropDownDataS_INCM> {
  /// {@macro counter_bloc}
  CallDropDownDataS_INCM_Bloc() : super(ZeCallDropdowndata_INCM) {
    on<CallDropDownDataS_INCM_Pressed_01>((event, emit) {
      return _PostData01_2(ZeCallDropdowndata_INCM, emit);
    });
    on<CallDropDownDataS_INCM_Pressed_02>((event, emit) {
      return _PostData02_2(ZeCallDropdowndata_INCM, emit);
    });
  }
  Future<void> _PostData01_2(CallDropDownDataS_INCM toAdd,
      Emitter<CallDropDownDataS_INCM> emit) async {
    emit(ZeCallDropdowndata_INCM);
  }

  Future<void> _PostData02_2(CallDropDownDataS_INCM toAdd,
      Emitter<CallDropDownDataS_INCM> emit) async {
    emit(ZeCallDropdowndata_INCM);
  }
}
