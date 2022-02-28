import 'dart:convert';
import 'dart:typed_data';
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_test/MainBody.dart';
import 'package:table_test/styles/TextStyle.dart';
import 'package:table_test/witget/ComInputText.dart';
import 'package:table_test/witget/Loading.dart';

//------------------------------------

import '../bloc/Rebuild/cubit.dart';
import '../bloc/bloc-data01/EventTable01.dart';
import '../data/Base64Img.dart';
import '../data/model.dart';
import 'ConsoleSub.dart/nogood.dart';
import 'ConsoleSub.dart/normal.dart';
import 'ConsoleSub.dart/waitting.dart';

//------------------------------------

late BuildContext maintablecontext;

int UserNO = 0;

String base64pic01 = logo;
String base64pic02 = logo;
String base64pic03 = logo;
String base64pic04 = logo;
String base64pic05 = logo;

bool confirmPass = false;
int stepindex = 0;
int itemMax = 0;
int yesno = 0;
int attper = 0;
bool wait = false;

String SpacialAccText = '';
bool nogood = false;
bool undercontroltap1 = false;

String PassText = "PASS";

String MATNRnow = '';
String CHARGnow = '';
String MBLNRnow = '';
String BWARTnow = '';
String MENGEnow = '';
String MEINSnow = '';
String MAT_FGnow = '';
String KUNNRnow = '';
String SORTLnow = '';
String NAME1now = '';
String CUST_LOTnow = '';
String PART_NMnow = '';
String PART_NOnow = '';
String PROCESSnow = '';
String OLDMAT_CPnow = '';
String STATUSnow = '';

String ItemNow = '';

String ITEMstatusNow = '';
String ITEMspecialAccStatusNow = '';
String ITEMspecialAccCOMMENTNow = '';
String ITEMspecialAccPicNow = '';

String statusNow = '';
String specialAccStatusNow = '';
String specialAccCOMMENTNow = '';
String specialAccPicNow = '';

//-------------------------------------

void ResetNow() {
  MATNRnow = '';
  CHARGnow = '';
  MBLNRnow = '';
  BWARTnow = '';
  MENGEnow = '';
  MEINSnow = '';
  MAT_FGnow = '';
  KUNNRnow = '';
  SORTLnow = '';
  NAME1now = '';
  CUST_LOTnow = '';
  PART_NMnow = '';
  PART_NOnow = '';
  PROCESSnow = '';
  OLDMAT_CPnow = '';
  STATUSnow = '';

  ItemNow = '';

  ITEMstatusNow = '';
  ITEMspecialAccStatusNow = '';
  ITEMspecialAccCOMMENTNow = '';
  ITEMspecialAccPicNow = '';

  statusNow = '';
  specialAccStatusNow = '';
  specialAccCOMMENTNow = '';
  specialAccPicNow = '';
}

//-------------------------------------

void ConsoleBox(dataset data, List list01) {
  showDialog(
    context: contexttable,
    barrierDismissible: true,
    builder: (BuildContext context) {
      Widget con0 = Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 15, end: 15, top: 10, bottom: 10),
          child: Container(
            // color: Colors.black,
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
            ),
            child: const Center(child: Text("--")),
          ));

      Widget con = con0;
      List _list1 = list01;
      itemMax = _list1.length - 1;

      if (stepindex == 0) {
        con = con0;
      } else {
        if (nogood) {
          con = NoGoodConfirm();
        } else {
          if (wait) {
            con = WattingItem();
          } else {
            con = NormalCheck();
          }
        }
        //BlocProvider.of<BlocPageRebuild>(contexttable).rebuildPage();
        // con = NormalCheck();
      }
      ItemNow = _list1[stepindex];

      MATNRnow = data.f01;
      CHARGnow = data.f05;
      //-------------------------
      MBLNRnow = data.f11;
      BWARTnow = data.f12;
      MENGEnow = data.f13;
      MEINSnow = data.f14;
      MAT_FGnow = data.f15;
      KUNNRnow = data.f16;
      SORTLnow = data.f17;
      NAME1now = data.f18;
      CUST_LOTnow = data.f19;
      PART_NMnow = data.f20;
      PART_NOnow = data.f21;
      PROCESSnow = data.f22;
      OLDMAT_CPnow = data.f23;
      STATUSnow = data.f24;

      contexttable
          .read<CallDropDownDataS_INCM_Bloc>()
          .add(CallDropDownDataS_INCM_Pressed_01());

      return Container(
        // color: Colors.blue,
        child: Dialog(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
                height: 500,
                width: 700,
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                width: 100,
                                child: Text(
                                  "MATCP",
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Text(
                                  ': ' + data.f01,
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                width: 100,
                                child: Container(
                                  child: Text("NAME1",
                                      // style: TxtStylePOP(fontSize: 20),
                                      overflow: TextOverflow.fade),
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Text(
                                  ': ' + data.f02,
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                width: 100,
                                child: Text(
                                  "PART_NM",
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Text(
                                  ': ' + data.f03,
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                width: 100,
                                child: const Text(
                                  "PART_NO",
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Text(
                                  ': ' + data.f04,
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                width: 100,
                                child: Text(
                                  "CHARG",
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Text(
                                  ': ' + data.f05,
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                width: 100,
                                child: Text(
                                  "CUST_LOT",
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Text(
                                  ': ' + data.f06,
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                width: 100,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "STATUS",
                                    // style: TxtStylePOP(fontSize: 20)
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Text(
                                  ': ' + data.f07,
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Spacer(),
                          SizedBox(
                              height: 100,
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                start: 15, top: 2, bottom: 2),
                                        child: InkWell(
                                          onTap: () {
                                            UserNO = 1;
                                            BlocProvider.of<BlocPageRebuild>(
                                                    contexttable)
                                                .rebuildPage();
                                          },
                                          child: Container(
                                            // color: Colors.amberAccent,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2.0,
                                                  color: Colors.black),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(8)),
                                              color: UserNO == 1
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                            child: Center(
                                              child: Text("User 01",
                                                  style: UserNO == 1
                                                      ? const TxtStyleBlackBG()
                                                      : const TxtStyleWhiteBG()),
                                            ),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                start: 15, top: 2, bottom: 2),
                                        child: InkWell(
                                          onTap: () {
                                            UserNO = 2;
                                            BlocProvider.of<BlocPageRebuild>(
                                                    contexttable)
                                                .rebuildPage();
                                          },
                                          child: Container(
                                            // color: Colors.amberAccent,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2.0,
                                                  color: Colors.black),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(8)),
                                              color: UserNO == 2
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                            child: Center(
                                              child: Text("User 02",
                                                  style: UserNO == 2
                                                      ? const TxtStyleBlackBG()
                                                      : const TxtStyleWhiteBG()),
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              )),
                          SizedBox(
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 15, top: 2, bottom: 2),
                                child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2.0, color: Colors.black),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: PicShowFront(base64: logo),
                                    )),
                              )),
                          SizedBox(
                              height: 52,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ReportButton(),
                                ],
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: 400,
                      // color: Colors.blue,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.only(start: 40, end: 40),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 7,
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2.0, color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        color: Colors.white,
                                      ),
                                      // color: Colors.red,
                                      child: Center(
                                          child: Text(_list1[stepindex])),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      height: 40,
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: InkWell(
                                      onTap: () {
                                        RedataPage();
                                        onLoadingType01(
                                            context,
                                            maintablecontext
                                                .read<
                                                    CallDropDownDataS_INCM_Bloc>()
                                                .add(
                                                    CallDropDownDataS_INCM_Pressed_01()),
                                            BlocProvider.of<BlocPageRebuild>(
                                                    context)
                                                .rebuildPage());
                                        PrevItem(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2.0, color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          color: Colors.white,
                                        ),
                                        height: 40,
                                        // color: Colors.blue,
                                        child: Center(child: Text("<")),
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: InkWell(
                                      onTap: () {
                                        RedataPage();
                                        onLoadingType01(
                                            context,
                                            maintablecontext
                                                .read<
                                                    CallDropDownDataS_INCM_Bloc>()
                                                .add(
                                                    CallDropDownDataS_INCM_Pressed_01()),
                                            BlocProvider.of<BlocPageRebuild>(
                                                    context)
                                                .rebuildPage());
                                        nextItem(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2.0, color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          color: Colors.white,
                                        ),
                                        height: 40,
                                        // color: Colors.blue,
                                        child: Center(child: Text(">")),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(width: 350, height: 350, child: con)
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      );
    },
  );
}

nextItem(BuildContext contextin) {
  // if (confirmPass || (stepindex == 0) || wait) {
  //   if (stepindex < itemMax) {
  //     confirmPass = false;
  //     stepindex++;
  //     BlocProvider.of<BlocPageRebuild>(contextin).rebuildPage();
  //   } else if (stepindex == itemMax) {
  //     // Navigator.pop(contextin);
  //   } else if (constatus != 0) {
  //     stepindex++;
  //     BlocProvider.of<BlocPageRebuild>(contextin).rebuildPage();
  //   }
  // }
  if (stepindex < itemMax) {
    stepindex++;
    BlocProvider.of<BlocPageRebuild>(contextin).rebuildPage();
  }
}

PrevItem(BuildContext contextin) {
  if (stepindex > 0) {
    if (stepindex > 0) {
      stepindex--;
      BlocProvider.of<BlocPageRebuild>(contextin).rebuildPage();
    }
  }

  // stepindex--;
  // BlocProvider.of<BlocPageRebuild>(contextin).rebuildPage();
}

class PicShowFront extends StatefulWidget {
  PicShowFront({Key? key, required this.base64}) : super(key: key);
  String base64;
  @override
  State createState() => new PicShowFrontState();
}

class PicShowFrontState extends State<PicShowFront> {
  // String _base64 = base64pic01;

  @override
  Widget build(BuildContext context) {
    if (widget.base64 == null) return new Container();
    Uint8List bytes = base64.decode(widget.base64);
    return Container(
      height: 50,
      child: new Image.memory(bytes),
    );
  }
}

void RedataPage() {
  nogood = false;
  yesno = 0;
  attper = 0;
  NoGoodPage = 1;
  PiecesDropdownSelected = '1';
}

class ReportButton extends StatelessWidget {
  const ReportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        child: Text('Report'),
        onPressed: () {
          js.context
              .callMethod('open', ['https://stackoverflow.com/questions/ask']);
        },
      ),
    );
  }
}
