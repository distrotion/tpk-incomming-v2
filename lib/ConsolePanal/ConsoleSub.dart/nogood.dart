import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:image/image.dart' as IMG;

import '../../MainBody.dart';
import '../../bloc/Rebuild/cubit.dart';
import '../../bloc/bloc-data01/EventTable01.dart';
import '../../styles/TextStyle.dart';
import '../../witget/ComInputText.dart';
import '../../witget/Loading.dart';
import '../ConsoleBox.dart';

int NoGoodPage = 1;
String PiecesDropdownSelected = '1';

class NoGoodConfirm extends StatelessWidget {
  const NoGoodConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget outpage = WaittingP1();
    if (NoGoodPage == 1) {
      outpage = WaittingP1();
    } else if (NoGoodPage == 2) {
      outpage = WaittingP2();
    }
    return outpage;
  }
}

class WaittingP1 extends StatelessWidget {
  const WaittingP1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        yesno = 1;
                        BlocProvider.of<BlocPageRebuild>(contexttable)
                            .rebuildPage();
                      },
                      child: Container(
                        // color: Colors.amberAccent,

                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          // color: Colors.white,
                          color: yesno == 1 ? Colors.black : Colors.white,
                        ),
                        child: Center(
                          child: Text("YES",
                              style: yesno == 1
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
                        yesno = 2;
                        BlocProvider.of<BlocPageRebuild>(contexttable)
                            .rebuildPage();
                      },
                      child: Container(
                        // color: Colors.amberAccent,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: yesno == 2 ? Colors.black : Colors.white,
                        ),
                        child: Center(
                          child: Text("NO",
                              style: yesno == 2
                                  ? TxtStyleBlackBG()
                                  : TxtStyleWhiteBG()),
                        ),
                      ),
                    ),
                  ))
            ],
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
          flex: 1,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        attper = 1;
                        BlocProvider.of<BlocPageRebuild>(contexttable)
                            .rebuildPage();
                      },
                      child: Container(
                        // color: Colors.amberAccent,

                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          // color: Colors.white,
                          color: attper == 1 ? Colors.black : Colors.white,
                        ),
                        child: Center(
                          child: Text("QA/QC Engineer",
                              style: attper == 1
                                  ? const TxtStyleBlackBG()
                                  : const TxtStyleWhiteBG()),
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
                        attper = 2;
                        BlocProvider.of<BlocPageRebuild>(contexttable)
                            .rebuildPage();
                      },
                      child: Container(
                        // color: Colors.amberAccent,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: attper == 2 ? Colors.black : Colors.white,
                        ),
                        child: Center(
                          child: Text("Perchase",
                              style: attper == 2
                                  ? const TxtStyleBlackBG()
                                  : const TxtStyleWhiteBG()),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Amount", style: const TxtStyleWhiteBG()),
                PiecesDropdown(),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: 0, end: 0, top: 10, bottom: 10),
            child: InkWell(
              onTap: () {
                if (yesno == 1) {
                  NoGoodPage = 2;
                  BlocProvider.of<BlocPageRebuild>(contexttable).rebuildPage();
                } else {
                  nogood = false;
                  BlocProvider.of<BlocPageRebuild>(contexttable).rebuildPage();
                }
              },
              child: Container(
                // height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.greenAccent,
                ),
                child: Center(
                  child: yesno == 1 ? const Text("NEXT") : const Text("Back"),
                ),
                // color: Colors.orange,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WaittingP2 extends StatelessWidget {
  const WaittingP2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FileUploadButton01(),
              PicShow01(base64: base64pic01),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FileUploadButton02(),
              PicShow01(base64: base64pic02),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FileUploadButton03(),
              PicShow01(base64: base64pic03),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FileUploadButton04(),
              PicShow01(base64: base64pic04),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FileUploadButton05(),
              PicShow01(base64: base64pic05),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 0, end: 0, top: 10, bottom: 10),
                  child: InkWell(
                    onTap: () {
                      NoGoodPage = 1;
                      BlocProvider.of<BlocPageRebuild>(contexttable)
                          .rebuildPage();
                    },
                    child: Container(
                      // height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.blueGrey,
                      ),
                      child: const Center(
                        child: Text("Back"),
                      ),
                      // color: Colors.orange,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: finishfunction(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FileUploadButton01 extends StatefulWidget {
  @override
  State<FileUploadButton01> createState() => _FileUploadButton01State();
}

class _FileUploadButton01State extends State<FileUploadButton01> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('UPLOAD FILE'),
      onPressed: () async {
        var picked = await FilePicker.platform.pickFiles();
        Uint8List? imageByte;
        Uint8List? resizedData;

        if (picked != null) {
          imageByte = picked.files.first.bytes;
          IMG.Image? img = IMG.decodeImage(imageByte!);
          // IMG.Image? img2 = IMG.copyResize(img!, width: 500);
          resizedData = IMG.encodeJpg(img!) as Uint8List?;
          base64pic01 = base64.encode(resizedData!);
          BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
        }
      },
    );
  }
}

class FileUploadButton02 extends StatefulWidget {
  @override
  State<FileUploadButton02> createState() => _FileUploadButton02State();
}

class _FileUploadButton02State extends State<FileUploadButton02> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('UPLOAD FILE'),
      onPressed: () async {
        var picked = await FilePicker.platform.pickFiles();
        Uint8List? imageByte;
        Uint8List? resizedData;

        if (picked != null) {
          imageByte = picked.files.first.bytes;
          IMG.Image? img = IMG.decodeImage(imageByte!);
          // IMG.Image? img2 = IMG.copyResize(img!, width: 500);
          resizedData = IMG.encodeJpg(img!) as Uint8List?;
          base64pic02 = base64.encode(resizedData!);
          BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
        }
      },
    );
  }
}

class FileUploadButton03 extends StatefulWidget {
  @override
  State<FileUploadButton03> createState() => _FileUploadButton03State();
}

class _FileUploadButton03State extends State<FileUploadButton03> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('UPLOAD FILE'),
      onPressed: () async {
        var picked = await FilePicker.platform.pickFiles();
        Uint8List? imageByte;
        Uint8List? resizedData;

        if (picked != null) {
          imageByte = picked.files.first.bytes;
          IMG.Image? img = IMG.decodeImage(imageByte!);
          // IMG.Image? img2 = IMG.copyResize(img!, width: 500);
          resizedData = IMG.encodeJpg(img!) as Uint8List?;
          base64pic03 = base64.encode(resizedData!);
          BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
        }
      },
    );
  }
}

class FileUploadButton04 extends StatefulWidget {
  @override
  State<FileUploadButton04> createState() => _FileUploadButton04State();
}

class _FileUploadButton04State extends State<FileUploadButton04> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('UPLOAD FILE'),
      onPressed: () async {
        var picked = await FilePicker.platform.pickFiles();
        Uint8List? imageByte;
        Uint8List? resizedData;

        if (picked != null) {
          imageByte = picked.files.first.bytes;
          IMG.Image? img = IMG.decodeImage(imageByte!);
          // IMG.Image? img2 = IMG.copyResize(img!, width: 500);
          resizedData = IMG.encodeJpg(img!) as Uint8List?;
          base64pic04 = base64.encode(resizedData!);
          BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
        }
      },
    );
  }
}

class FileUploadButton05 extends StatefulWidget {
  @override
  State<FileUploadButton05> createState() => _FileUploadButton05State();
}

class _FileUploadButton05State extends State<FileUploadButton05> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('UPLOAD FILE'),
      onPressed: () async {
        var picked = await FilePicker.platform.pickFiles();
        Uint8List? imageByte;
        Uint8List? resizedData;

        if (picked != null) {
          imageByte = picked.files.first.bytes;
          IMG.Image? img = IMG.decodeImage(imageByte!);
          // IMG.Image? img2 = IMG.copyResize(img!, width: 500);
          resizedData = IMG.encodeJpg(img!) as Uint8List?;
          base64pic05 = base64.encode(resizedData!);
          BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
        }
      },
    );
  }
}

class PicShow01 extends StatefulWidget {
  PicShow01({Key? key, required this.base64}) : super(key: key);
  String base64 = base64pic01;
  @override
  State createState() => new PicShow01State();
}

class PicShow01State extends State<PicShow01> {
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

class finishfunction extends StatelessWidget {
  const finishfunction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 0, end: 0, top: 10, bottom: 10),
      child: InkWell(
        onTap: () {
          // UserNO
          // yesno
          // attper

          // nextItem(contexttable);

          if (yesno == 1 && UserNO != 0 && attper != 0) {
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
            onLoadingType01_long5(
                maintablecontext,
                // maintablecontext
                //     .read<CallDropdowndata_INCM>()
                //     .add(calldropdownrequrst_INCM.set01_1),
                maintablecontext
                    .read<CallDropDownDataS_INCM_Bloc>()
                    .add(CallDropDownDataS_INCM_Pressed_01()),
                BlocProvider.of<BlocPageRebuild>(context).rebuildPage());
            // nextItem(context);
          } else if (yesno == 2) {
            nogood = false;
            BlocProvider.of<BlocPageRebuild>(contexttable).rebuildPage();
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
    );
  }
}

class PiecesDropdown extends StatelessWidget {
  const PiecesDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),

      // dropdown below..
      child: DropdownButton<String>(
        value: PiecesDropdownSelected,
        onChanged: (String? newValue) {
          PiecesDropdownSelected = newValue ?? '1';
          BlocProvider.of<BlocPageRebuild>(contexttable).rebuildPage();
        },
        items: items
            .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
            .toList(),

        // add extra sugar..
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 42,
        underline: SizedBox(),
      ),
    );
    ;
  }
}
