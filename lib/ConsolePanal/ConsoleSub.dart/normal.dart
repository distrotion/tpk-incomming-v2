import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../MainBody.dart';
import '../../bloc/Rebuild/cubit.dart';
import '../../bloc/bloc-data01/EventTable01.dart';
import '../../witget/Loading.dart';
import '../ConsoleBox.dart';

class NormalCheck extends StatelessWidget {
  const NormalCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color col = Colors.white;
    if (confirmPass) {
      //statusNow reject
      if (statusNow == 'reject') {
        col = Colors.red;
      } else {
        col = Colors.green;
      }
    } else {
      col = Colors.white;
    }
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
                              // color: confirmPass ? Colors.green : Colors.white,
                              color: col,
                            ),
                            child: Center(
                                child:
                                    confirmPass ? Text(PassText) : Text("-")),
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
                        } else if (UserNO != 0) {
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
                          yesno = 0;
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
