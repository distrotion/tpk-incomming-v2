import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_test/MainBody.dart';
import 'package:table_test/styles/TextStyle.dart';
import 'package:table_test/witget/ComInputText.dart';
import 'package:table_test/witget/Loading.dart';

//------------------------------------

import 'bloc/bloc-data01/cubit.dart';
import 'bloc/bloc-data01/event.dart';
import 'data/model.dart';

//------------------------------------

late BuildContext maintablecontext;

bool confirmPass = false;
int stepindex = 0;
int itemMax = 0;
int constatus = 0;
bool wait = false;

String SpacialAccText = '';
bool nogood = false;
bool undercontroltap1 = false;

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
          padding: EdgeInsetsDirectional.only(
              start: 15, end: 15, top: 10, bottom: 10),
          child: Container(
            // color: Colors.black,
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
            ),
            child: Center(child: Text("--")),
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
          // con = NormalCheck();
          print(wait);
          if (wait) {
            con = WattingItem();
          } else {
            con = NormalCheck();
          }
        }

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
                width: 800,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      width: 400,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                width: 150,
                                child: Text(
                                  "MATCP",
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Container(
                                width: 200,
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
                                width: 150,
                                child: Container(
                                  child: Text("NAME1",
                                      // style: TxtStylePOP(fontSize: 20),
                                      overflow: TextOverflow.fade),
                                ),
                              ),
                              Container(
                                width: 200,
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
                                width: 150,
                                child: Text(
                                  "PART_NM",
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Container(
                                width: 200,
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
                                width: 150,
                                child: Text(
                                  "PART_NO",
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Container(
                                width: 200,
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
                                width: 150,
                                child: Text(
                                  "CHARG",
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Container(
                                width: 200,
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
                                width: 150,
                                child: Text(
                                  "CUST_LOT",
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Container(
                                width: 200,
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
                                width: 150,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "STATUS",
                                    // style: TxtStylePOP(fontSize: 20)
                                  ),
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                  ': ' + data.f07,
                                  // style: TxtStylePOP(fontSize: 20)
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
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
                          Container(width: 350, height: 300, child: con)
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

class WattingItem extends StatelessWidget {
  const WattingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 15, end: 15, top: 10),
              child: Container(
                // color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Center(child: Text("Check")),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Center(child: Text("10")),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Center(child: Text("pcs/lot")),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.yellow,
                            ),
                            child: Center(child: Text("WAIT")),
                          ),
                        ))
                  ],
                ),
              ),
            )),
        Expanded(
          flex: 1,
          child: Padding(
            padding:
                EdgeInsetsDirectional.only(start: 8, end: 8, top: 4, bottom: 0),
            child: Container(
                // color: Colors.red,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text("Has custommer confirmed ?"),
                )),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        // color: Colors.red,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Text("CONFIRM"),
                        )),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text("NO"),
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NormalCheck extends StatelessWidget {
  const NormalCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 15, end: 15, top: 10),
              child: Container(
                // color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Center(child: Text("Check")),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Center(child: Text("10")),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Center(child: Text("pcs/lot")),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: confirmPass ? Colors.green : Colors.white,
                            ),
                            child: Center(
                                child: confirmPass ? Text("PASS") : Text("-")),
                          ),
                        ))
                  ],
                ),
              ),
            )),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 15, end: 5, top: 10, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        if (confirmPass) {
                          BlocProvider.of<BlocPageRebuild>(contexttable)
                              .rebuildPage();
                        } else {
                          // confirmPass = true;
                          // Navigator.pop(contexttable);
                          ITEMstatusNow = '';
                          ITEMspecialAccStatusNow = '';
                          ITEMspecialAccCOMMENTNow = '';
                          ITEMspecialAccPicNow = '';

                          ITEMstatusNow = 'GOOD';
                          // maintablecontext
                          //     .read<CallDropdowndata_INCM>()
                          //     .add(calldropdownrequrst_INCM.set02_1);
                          maintablecontext
                              .read<CallDropDownDataS_INCM_Bloc>()
                              .add(CallDropDownDataS_INCM_Pressed_02());
                          onLoadingType01(
                              context,
                              // maintablecontext
                              //     .read<CallDropdowndata_INCM>()
                              //     .add(calldropdownrequrst_INCM.set01_1),
                              maintablecontext
                                  .read<CallDropDownDataS_INCM_Bloc>()
                                  .add(CallDropDownDataS_INCM_Pressed_01()),
                              BlocProvider.of<BlocPageRebuild>(context)
                                  .rebuildPage());
                          // BlocProvider.of<BlocPageRebuild>(contexttable)
                          //     .rebuildPage();
                        }
                      },
                      child: Container(
                        // color: Colors.pink,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: confirmPass ? Colors.grey : Colors.green,
                        ),
                        child: Center(
                          child: Text("GOOD"),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 5, end: 15, top: 10, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        if (confirmPass) {
                        } else {
                          nogood = true;
                          SpacialAccText = '';
                          constatus = 0;
                          BlocProvider.of<BlocPageRebuild>(contexttable)
                              .rebuildPage();
                        }
                      },
                      child: Container(
                        // color: Colors.yellow,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: confirmPass ? Colors.grey : Colors.red,
                        ),
                        child: Center(
                          child: Text("NO GOOD"),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class NoGoodConfirm extends StatelessWidget {
  const NoGoodConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                // color: Colors.red,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text("Sending for special accept confirm ?"),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.blue,
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            constatus = 1;
                            BlocProvider.of<BlocPageRebuild>(contexttable)
                                .rebuildPage();
                          },
                          child: Container(
                            // color: Colors.amberAccent,

                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              // color: Colors.white,
                              color:
                                  constatus == 1 ? Colors.black : Colors.white,
                            ),
                            child: Center(
                              child: Text("YES",
                                  style: constatus == 1
                                      ? TxtStyleBlackBG()
                                      : TxtStyleWhiteBG()),
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            constatus = 2;
                            BlocProvider.of<BlocPageRebuild>(contexttable)
                                .rebuildPage();
                          },
                          child: Container(
                            // color: Colors.amberAccent,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color:
                                  constatus == 2 ? Colors.black : Colors.white,
                            ),
                            child: Center(
                              child: Text("NO",
                                  style: constatus == 2
                                      ? TxtStyleBlackBG()
                                      : TxtStyleWhiteBG()),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.green,
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          // color: Colors.amber,
                          child: ComInputText(
                            isContr: undercontroltap1,
                            fnContr: (input) {
                              undercontroltap1 = input;
                            },
                            sValue: SpacialAccText,
                            returnfunc: (String s) {
                              SpacialAccText = s;
                            },
                          ),
                        ),
                      )),
                  // Expanded(flex: 1, child: Container(
                  //   height: 40,
                  //   color: Colors.amberAccent,))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 0, end: 0, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  // nextItem(contexttable);
                  if (constatus == 1) {
                    nogood = false;
                    ITEMstatusNow = '';
                    ITEMspecialAccStatusNow = '';
                    ITEMspecialAccCOMMENTNow = '';
                    ITEMspecialAccPicNow = '';

                    ITEMstatusNow = 'WAIT';
                    ITEMspecialAccStatusNow = 'waitting for specialaccept';
                    maintablecontext
                        .read<CallDropDownDataS_INCM_Bloc>()
                        .add(CallDropDownDataS_INCM_Pressed_02());
                    onLoadingType01(
                        maintablecontext,
                        // maintablecontext
                        //     .read<CallDropdowndata_INCM>()
                        //     .add(calldropdownrequrst_INCM.set01_1),
                        maintablecontext
                            .read<CallDropDownDataS_INCM_Bloc>()
                            .add(CallDropDownDataS_INCM_Pressed_01()),
                        BlocProvider.of<BlocPageRebuild>(context)
                            .rebuildPage());
                  } else {
                    nogood = false;
                    BlocProvider.of<BlocPageRebuild>(contexttable)
                        .rebuildPage();
                  }

                  // BlocProvider.of<BlocPageRebuild>(contexttable).rebuildPage();
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.greenAccent,
                  ),
                  child: Center(
                    child: Text("FINISH"),
                  ),
                  // color: Colors.orange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
