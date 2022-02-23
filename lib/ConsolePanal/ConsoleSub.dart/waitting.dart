import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../MainBody.dart';
import '../../bloc/Rebuild/cubit.dart';
import '../../bloc/bloc-data01/EventTable01.dart';
import '../../witget/Loading.dart';
import '../ConsoleBox.dart';

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
                    onTap: () {
                      if (UserNO != 0) {
                        // nogood = false;
                        // constatus = 0;
                        // wait = false;
                        // confirmPass = true;
                        ITEMstatusNow = '';
                        ITEMspecialAccStatusNow = '';
                        ITEMspecialAccCOMMENTNow = '';
                        ITEMspecialAccPicNow = '';

                        ITEMstatusNow = 'GOOD';
                        ITEMspecialAccStatusNow = 'SpecialAccept has approved';

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
                      BlocProvider.of<BlocPageRebuild>(contexttable)
                          .rebuildPage();
                    },
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
                  child: InkWell(
                    onTap: () {
                      if (UserNO != 0) {
                        // nogood = false;
                        // constatus = 0;
                        // wait = false;
                        // confirmPass = true;
                        ITEMstatusNow = '';
                        ITEMspecialAccStatusNow = '';
                        ITEMspecialAccCOMMENTNow = '';
                        ITEMspecialAccPicNow = '';

                        ITEMstatusNow = 'reject';
                        ITEMspecialAccStatusNow = 'SpecialAccept has approved';

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
                      BlocProvider.of<BlocPageRebuild>(contexttable)
                          .rebuildPage();
                    },
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
