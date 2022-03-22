import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:dio/dio.dart';

import '../../ConsolePanal/ConsoleBox.dart';
import '../../ConsolePanal/ConsoleSub.dart/nogood.dart';
import '../../MainBody.dart';
import '../../data/Base64Img.dart';
import '../../data/model.dart';
import '../../data_dummy.dart';
import '../../witget/Loading.dart';
import '../Rebuild/cubit.dart';

// String server = 'http://localhost:9210/';

String server = 'http://172.23.10.40:9210/';
String serverflush = 'http://172.23.10.40:1880/flush';
//172.23.10.39

/// Event being processed by [CounterBloc].
abstract class DataSetEvent {}

/// Notifies bloc to increment state.
class GetDataPressed extends DataSetEvent {}

class FlushITDataPressed extends DataSetEvent {}

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
    on<FlushITDataPressed>((event, emit) {
      return _flushdata([], emit);
    });
  }
  Future<void> _getdata(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    // http://localhost:9210/tblSAPGoodReceive_get
    final response = await http
        .post(Uri.parse(server + "tblSAPGoodReceive_get"), body: {
      "MATNR": "",
      "CHARG": ""
    }, headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });

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
          f25: data_input[i]['Appearance_for_Rust_status'].toString(),
          f26: data_input[i]['Appearance_for_Scratch_status'].toString(),
        ));
      }
      //stateoutput = data_test
      emit(stateoutput);
    } else {
      print("where is my server");
      //stateoutput = data_test
      stateoutput = [];
      emit(stateoutput);
    }
  }

  Future<void> _PostData01(int toAdd, Emitter<int> emit) async {}

  Future<void> _flushdata(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    final response = await http.post(Uri.parse(serverflush), body: {
      "Qurey": "flush"
    }, headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });
  }
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
    DropDownData_INCM stateoutput = zeroDropDownData_MR;
    final response = await http.post(Uri.parse(server + "queryItem"), body: {
      "Qurey": "test"
    }, headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });

    var data_input;
    if (response.statusCode == 200) {
      var databuff = jsonDecode(response.body);
      data_input = databuff[0]['output'];
    } else {
      data_input = '';
      print("where is my server");
    }

    if (data_input != '') {
      stateoutput.list01.clear();
      stateoutput.list02.clear();
      stateoutput.list03.clear();
      stateoutput.list04.clear();
      stateoutput.list05.clear();
      stateoutput.list06.clear();
      stateoutput.list07.clear();
      stateoutput.list08.clear();
      stateoutput.list09.clear();
      stateoutput.list10.clear();

      for (var i = 0; i < data_input['list01'].length; i++) {
        stateoutput.list01.add(data_input['list01'][i].toString());
      }

      stateoutput.list02 = [""];
      stateoutput.list03 = [""];
      stateoutput.list04 = [""];
      stateoutput.list05 = [""];
      stateoutput.list06 = [""];
      stateoutput.list07 = [""];
      stateoutput.list08 = [""];
      stateoutput.list09 = [""];
      stateoutput.list10 = [""];
      stateoutput.list08 = [""];
      stateoutput.list09 = [""];
      stateoutput.list10 = [""];
    } else {
      stateoutput.list01 = [""];
      stateoutput.list02 = [""];
      stateoutput.list03 = [""];
      stateoutput.list04 = [""];
      stateoutput.list05 = [""];
      stateoutput.list06 = [""];
      stateoutput.list07 = [""];
      stateoutput.list08 = [""];
      stateoutput.list09 = [""];
      stateoutput.list10 = [""];
    }

    //stateoutput = ["","Appearance_for_Rust","Appearance_for_Scratch"]

    emit(stateoutput);
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
    // final response = await http.post(Uri.parse(server + "getDataIncomming"),
    // body: {
    //   "MATNR": MATNRnow,
    //   "CHARG": CHARGnow
    // },
    //     headers: {
    //       "Accept": "application/json",
    //       "Access-Control_Allow_Origin": "*"
    //     });

    final response = await Dio().post(
      server + "getDataIncomming",
      data: {"MATNR": MATNRnow, "CHARG": CHARGnow},
    );

    var data_input;
    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      if (databuff[0]['status'] == 'ok') {
        data_input = databuff[0]['output'];
        var dataset1 = data_input[0]['Appearance_for_Rust'] ?? '';
        var dataset2 = data_input[0]['Appearance_for_Scratch'] ?? '';

        // print(dataset1);

        if (ItemNow == 'Appearance_for_Rust') {
          if (dataset1 != '') {
            // print(dataset1);
            if (dataset1['status'].toString() == 'WAIT') {
              statusNow = dataset1['status'].toString();
              specialAccStatusNow = dataset1['specialAccStatus'].toString();
              specialAccCOMMENTNow = dataset1['specialAccCOMMENT'].toString();
              specialAccPicNow = dataset1['specialAccPic01'].toString();
              confirmPass = false;
              wait = true;
              PassText = 'PASS';
            } else if (dataset1['status'].toString() == 'reject') {
              statusNow = dataset1['status'].toString();
              specialAccStatusNow = dataset1['specialAccStatus'].toString();
              specialAccCOMMENTNow = dataset1['specialAccCOMMENT'].toString();
              specialAccPicNow = dataset1['specialAccPic01'].toString();
              confirmPass = true;
              wait = false;
              PassText = 'REJECT';
            } else {
              statusNow = dataset1['status'].toString();
              specialAccStatusNow = dataset1['specialAccStatus'].toString();
              specialAccCOMMENTNow = dataset1['specialAccCOMMENT'].toString();
              specialAccPicNow = dataset1['specialAccPic01'].toString();
              confirmPass = true;
              wait = false;
              PassText = 'PASS';
              // nextItem(contexttable);
            }
          } else {
            statusNow = '';
            specialAccStatusNow = '';
            specialAccCOMMENTNow = '';
            specialAccPicNow = '';
            confirmPass = false;
            wait = false;
            PassText = 'PASS';
          }
        } else if (ItemNow == 'Appearance_for_Scratch') {
          if (dataset2 != '') {
            if (dataset2['status'].toString() == 'WAIT') {
              statusNow = dataset2['status'].toString();
              specialAccStatusNow = dataset2['specialAccStatus'].toString();
              specialAccCOMMENTNow = dataset2['specialAccCOMMENT'].toString();
              specialAccPicNow = dataset2['specialAccPic01'].toString();
              confirmPass = false;
              wait = true;
              PassText = 'PASS';
            } else if (dataset2['status'].toString() == 'reject') {
              //statusNow 'reject'
              statusNow = dataset2['status'].toString();
              specialAccStatusNow = dataset2['specialAccStatus'].toString();
              specialAccCOMMENTNow = dataset2['specialAccCOMMENT'].toString();
              specialAccPicNow = dataset2['specialAccPic01'].toString();
              confirmPass = true;
              wait = false;
              PassText = 'REJECT';
            } else {
              statusNow = dataset2['status'].toString();
              specialAccStatusNow = dataset2['specialAccStatus'].toString();
              specialAccCOMMENTNow = dataset2['specialAccCOMMENT'].toString();
              specialAccPicNow = dataset2['specialAccPic01'].toString();
              confirmPass = true;
              wait = false;
              PassText = 'PASS';
              // html.window.location.reload();
              // Navigator.pop(contexttable);
              // onLoadingType02(maintablecontext,
              //     maintablecontext.read<DataSetBloc>().add(GetDataPressed()));
            }
          } else {
            statusNow = '';
            specialAccStatusNow = '';
            specialAccCOMMENTNow = '';
            specialAccPicNow = '';
            confirmPass = false;
            wait = false;
            PassText = 'PASS';
          }
        } else {
          statusNow = '';
          specialAccStatusNow = '';
          specialAccCOMMENTNow = '';
          specialAccPicNow = '';
          confirmPass = false;
          wait = false;
          PassText = 'PASS';
        }
      } else {
        statusNow = '';
        specialAccStatusNow = '';
        specialAccCOMMENTNow = '';
        specialAccPicNow = '';
        confirmPass = false;
        wait = false;
        PassText = 'PASS';
      }
    } else {
      data_input = '';
      print("where is my server");
    }

    // yield state;
    // state = ZeCallDropdowndata_INCM;
    emit(ZeCallDropdowndata_INCM);
  }

  Future<void> _PostData02_2(CallDropDownDataS_INCM toAdd,
      Emitter<CallDropDownDataS_INCM> emit) async {
    Object bodyout = {};
    if (ItemNow == 'Appearance_for_Rust') {
      bodyout = {
        "MATNR": MATNRnow,
        "CHARG": CHARGnow,
        "MBLNR": MBLNRnow,
        "BWART": BWARTnow,
        "MENGE": MENGEnow,
        "MEINS": MEINSnow,
        "MAT_FG": MAT_FGnow,
        "KUNNR": KUNNRnow,
        "SORTL": SORTLnow,
        "NAME1": NAME1now,
        "CUST_LOT": CUST_LOTnow,
        "PART_NM": PART_NMnow,
        "PART_NO": PART_NOnow,
        "PROCESS": PROCESSnow,
        "OLDMAT_CP": OLDMAT_CPnow,
        "STATUS": STATUSnow,
        "UserNO": UserNO,

        "ITEM": "Appearance_for_Rust",
        "ITEMstatus": ITEMstatusNow,
        "ITEMspecialAccStatus": ITEMspecialAccStatusNow,
        "ITEMspecialAccCOMMENT": ITEMspecialAccCOMMENTNow,
        // "ITEMspecialAccPic": ITEMspecialAccPicNow,
        "ITEMspecialAccPic01": base64pic01,
        "ITEMspecialAccPic02": base64pic02,
        "ITEMspecialAccPic03": base64pic03,
        "ITEMspecialAccPic04": base64pic04,
        "ITEMspecialAccPic05": base64pic05,
        "ITEMsPiecesSelected": PiecesDropdownSelected,

        // "Appearance_for_Rust": {
        //   "status": 'GOOD',
        //   "specialAccStatus": '',
        //   "specialAccCOMMENT": '',
        //   "specialAccPic": '',
        // }
      };
    } else if (ItemNow == 'Appearance_for_Scratch') {
      bodyout = {
        "MATNR": MATNRnow,
        "CHARG": CHARGnow,
        "MBLNR": MBLNRnow,
        "BWART": BWARTnow,
        "MENGE": MENGEnow,
        "MEINS": MEINSnow,
        "MAT_FG": MAT_FGnow,
        "KUNNR": KUNNRnow,
        "SORTL": SORTLnow,
        "NAME1": NAME1now,
        "CUST_LOT": CUST_LOTnow,
        "PART_NM": PART_NMnow,
        "PART_NO": PART_NOnow,
        "PROCESS": PROCESSnow,
        "OLDMAT_CP": OLDMAT_CPnow,
        "STATUS": STATUSnow,
        "UserNO": UserNO,

        "ITEM": "Appearance_for_Scratch",
        "ITEMstatus": ITEMstatusNow,
        "ITEMspecialAccStatus": ITEMspecialAccStatusNow,
        "ITEMspecialAccCOMMENT": ITEMspecialAccCOMMENTNow,
        // "ITEMspecialAccPic": ITEMspecialAccPicNow,
        "ITEMspecialAccPic01": base64pic01,
        "ITEMspecialAccPic02": base64pic02,
        "ITEMspecialAccPic03": base64pic03,
        "ITEMspecialAccPic04": base64pic04,
        "ITEMspecialAccPic05": base64pic05,
        "ITEMsPiecesSelected": PiecesDropdownSelected,

        //base64pic

        // "Appearance_for_Scratch": {
        //   "status": '',
        //   "specialAccStatus": '',
        //   "specialAccCOMMENT": '',
        //   "specialAccPic": '',
        // }
      };
    } else {
      bodyout = {
        "MATNR": MATNRnow,
        "CHARG": CHARGnow,
        "MBLNR": MBLNRnow,
        "BWART": BWARTnow,
        "MENGE": MENGEnow,
        "MEINS": MEINSnow,
        "MAT_FG": MAT_FGnow,
        "KUNNR": KUNNRnow,
        "SORTL": SORTLnow,
        "NAME1": NAME1now,
        "CUST_LOT": CUST_LOTnow,
        "PART_NM": PART_NMnow,
        "PART_NO": PART_NOnow,
        "PROCESS": PROCESSnow,
        "OLDMAT_CP": OLDMAT_CPnow,
        "STATUS": STATUSnow,
        "ITEM": "",
        "UserNO": UserNO,
      };
    }

    // final response = await http.post(Uri.parse(server + "updateDataIncomming"),
    //     body: bodyout,
    //     headers: {
    //       "Accept": "application/json",
    //       "Access-Control_Allow_Origin": "*"
    //     }).timeout(const Duration(seconds: 5));

    final response =
        await Dio().post(server + "updateDataIncomming", data: bodyout);

    var data_input;
    if (response.statusCode == 200) {
      // if (response.data[0]['status'] == 'ok') {
      // } else {}

    } else {
      data_input = '';
      print("where is my server");
    }
    // base64pic = logo;
    BlocProvider.of<BlocPageRebuild>(contexttable).rebuildPage();

    emit(ZeCallDropdowndata_INCM);
  }
}
