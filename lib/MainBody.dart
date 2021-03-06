import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_test/ConsolePanal/ConsoleBox.dart';
import 'package:table_test/witget/Loading.dart';

//------------------------------------

import 'ConsolePanal/ConsoleSub.dart/nogood.dart';
import 'bloc/Rebuild/cubit.dart';
import 'bloc/bloc-data01/EventTable01.dart';
import 'bloc/bloc-data01/Report.dart';
import 'data/Base64Img.dart';
import 'data/model.dart';

late BuildContext contexttable;
String _searchResult = '';

class BlocTableBody extends StatelessWidget {
  /// {@macro counter_page}
  const BlocTableBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => DataSetBloc(),
        child: BlocBuilder<DataSetBloc, List<dataset>>(
          builder: (context, data) {
            return BlocTableBodyListData(data: data);
          },
        ));
  }
}

class BlocTableBodyListData extends StatelessWidget {
  BlocTableBodyListData({Key? key, required this.data}) : super(key: key);
  List<dataset> data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => DropDownData_INCM_Bloc(),
        child: BlocBuilder<DropDownData_INCM_Bloc, DropDownData_INCM>(
          builder: (context, DD_INCM) {
            return BlocTableBodyCallData(data: data, DD_INCM: DD_INCM);
          },
        ));
  }
}

class BlocTableBodyCallData extends StatelessWidget {
  BlocTableBodyCallData({Key? key, required this.data, required this.DD_INCM})
      : super(key: key);
  List<dataset> data;
  DropDownData_INCM DD_INCM;

  @override
  Widget build(BuildContext context) {
    List<dataset> datain = data;
    if (_searchResult != '') {
      List<dataset> _data_exp = [];

      for (int i = 0; i < datain.length; i++) {
        if (datain[i].f01.toLowerCase().contains(_searchResult) ||
            datain[i].f02.toLowerCase().contains(_searchResult) ||
            datain[i].f03.toLowerCase().contains(_searchResult) ||
            datain[i].f04.toLowerCase().contains(_searchResult) ||
            datain[i].f05.toLowerCase().contains(_searchResult) ||
            datain[i].f06.toLowerCase().contains(_searchResult)) {
          _data_exp.add(datain[i]);
        }
      }

      datain = _data_exp;
    }
    return BlocProvider(
        create: (_) => CallDropDownDataS_INCM_Bloc(),
        child: BlocBuilder<CallDropDownDataS_INCM_Bloc, CallDropDownDataS_INCM>(
          builder: (context, CD_INCM) {
            return BlocReportBodyCallData(data: datain, DD_INCM: DD_INCM);
          },
        ));
  }
}

class BlocReportBodyCallData extends StatelessWidget {
  BlocReportBodyCallData({Key? key, required this.data, required this.DD_INCM})
      : super(key: key);
  List<dataset> data;
  DropDownData_INCM DD_INCM;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => Report_Bloc(),
        child: BlocBuilder<Report_Bloc, int>(
          builder: (context, nouse) {
            return TableBody(data: data, DD_INCM: DD_INCM);
          },
        ));
  }
}

class TableBody extends StatefulWidget {
  TableBody({Key? key, this.data, this.DD_INCM}) : super(key: key);
  List<dataset>? data;
  DropDownData_INCM? DD_INCM;

  @override
  _TableBodyState createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  int _sortColumnIndex = 5;
  bool _sortAscending = true;

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<DataSetBloc>().add(GetDataPressed());
    // context.read<DropDownData_INCM_Bloc>().add(DropDownData_INCM_Pressed());
  }

  @override
  Widget build(BuildContext context) {
    contexttable = context;
    maintablecontext = context;

    List<dataset> datain = widget.data ?? [];

    // if (_searchResult != '') {
    //   List<dataset> _data_exp = [];

    //   for (int i = 0; i < datain.length; i++) {
    //     if (datain[i].f01.toLowerCase().contains(_searchResult) ||
    //         datain[i].f02.toLowerCase().contains(_searchResult) ||
    //         datain[i].f03.toLowerCase().contains(_searchResult) ||
    //         datain[i].f04.toLowerCase().contains(_searchResult) ||
    //         datain[i].f05.toLowerCase().contains(_searchResult) ||
    //         datain[i].f06.toLowerCase().contains(_searchResult)) {
    //       _data_exp.add(datain[i]);
    //     }
    //   }

    //   datain = _data_exp;
    // }

    DropDownData_INCM _DD_INCM = widget.DD_INCM ?? zeroDropDownData_MR;
    MyData _data = MyData(context, datain, _DD_INCM.list01);

    void _sort<T>(Comparable<T> Function(dataset d) getField, int columnIndex,
        bool ascending) {
      _data._sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

    // print('------->' + '${_DD_INCM.list01}');

    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: 1200,
          child: Column(
            children: [
              // FloatingActionButton(
              //   child: const Icon(Icons.add),
              //   onPressed: () {
              //     print("hi bloc");
              //     context.read<DataSetBloc>().add(GetDataPressed());
              //   },
              // ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.search),
                  title: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                      onChanged: (value) {
                        // setState(() {
                        //   _searchResult = value;
                        // });
                        _searchResult = value;
                        BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                      }),
                  trailing: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        controller.clear();
                        _searchResult = '';
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: 1200,
                  child: PaginatedDataTable(
                    source: _data,
                    header: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('INCOMING LIST'),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                onLoadingType02(
                                    context,
                                    context
                                        .read<DataSetBloc>()
                                        .add(FlushITDataPressed()));
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              child: const Text("FLUSH"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                onLoadingType02(
                                    context,
                                    context
                                        .read<DataSetBloc>()
                                        .add(GetDataPressed()));
                              },
                              child: const Icon(
                                Icons.refresh,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    columns: [
                      DataColumn(
                          label: Text('ID'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>(
                                  (dataset d) => d.id, columnIndex, ascending)),
                      DataColumn(
                          label: Text('MATCP'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f01, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('CUST NAME'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f02, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('PART NAME'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f03, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('PART NO'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f04, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('CHARG'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f05, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('CUST LOT'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f06, columnIndex,
                                  ascending)),
                    ],
                    columnSpacing: 25,
                    horizontalMargin: 10,
                    rowsPerPage: 10,
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _sortAscending,
                    showCheckboxColumn: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data
  final BuildContext context;
  late List<dataset> _data;
  late List<dataset> input;
  late List list01;
  late List _list01;
  List<dataset> _data_exp = [];

  int _selectedCount = 0;
  MyData.empty(this.context) {
    _data = [];
  }
  MyData(this.context, this.input, this.list01) {
    _data = input;
    _list01 = list01;
    // _data_exp = [];

    // _data = _data_exp;
  }

  void _sort<T>(Comparable<T> Function(dataset d) getField, bool ascending) {
    _data.sort((dataset a, dataset b) {
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    final dataset data = _data[index];
    String for_Rust = data.f25;
    String for_Scratch = data.f26;
    return DataRow.byIndex(
        index: index,
        selected: for_Rust != '-' || for_Scratch != '-',
        color: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected) &&
              for_Rust == 'GOOD' &&
              for_Scratch == 'GOOD') {
            return Colors.green;
          } else if (states.contains(MaterialState.selected) &&
              (for_Rust == 'reject' || for_Scratch == 'reject')) {
            return Colors.red;
          } else if (states.contains(MaterialState.selected) &&
              (for_Rust == 'WAIT' || for_Scratch == 'WAIT')) {
            return Colors.orange;
          }

          return null; // Use the default value.
        }),
        onSelectChanged: (value) {
          // if (data.selected != value) {
          //   _selectedCount += value! ? 1 : -1;
          //   assert(_selectedCount >= 0);
          //   data.selected = value;
          // }
          // data.selected = true;
          //-----------
          // confirmPass = false;

          // print(data.f01);

          // if (data.f01 == '24000001') {
          //   data.selected = true;
          // }
          stepindex = 0;
          itemMax = 0;
          wait = false;
          SpacialAccText = '';

          //-----------

          base64pic01 = imgw;
          base64pic02 = imgw;
          base64pic03 = imgw;
          base64pic04 = imgw;
          base64pic05 = imgw;

          nogood = false;
          yesno = 0;
          attper = 0;
          NoGoodPage = 1;
          PiecesDropdownSelected = '1';
          //-----------
          // _selectedCount += value! ? 1 : -1;
          // assert(_selectedCount >= 0);
          // data.selected = value;
          // print(index);
          // print(data.f01);
          // print(data.f03);

          onLoadingType01(
              context,
              context
                  .read<DropDownData_INCM_Bloc>()
                  .add(DropDownData_INCM_Pressed()),
              ConsoleBox(data, _list01));
          notifyListeners();
        },
        cells: [
          DataCell(Text(
            data.id.toString(),
          )),
          DataCell(Text(data.f01)),
          DataCell(Text(data.f02)),
          DataCell(Text(data.f03)),
          DataCell(Text(data.f04)),
          DataCell(Text(data.f05)),
          DataCell(Text(data.f06)),
        ]);
  }
}
