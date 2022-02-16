import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_test/MainBody.dart';

//------------------------------------

import 'bloc/bloc-data01/event.dart';
import 'data/model.dart';

void ConsoleBox(dataset data) {
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
                                          child: Text("_list1[stepindex]")),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      height: 40,
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: InkWell(
                                      onTap: () {},
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
                                      onTap: () {},
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
