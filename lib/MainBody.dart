import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_test/ConsoleBox.dart';
import 'package:table_test/witget/Loading.dart';

//------------------------------------

import 'bloc/bloc-data01/event.dart';
import 'data/model.dart';

late BuildContext contexttable;

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
    return BlocProvider(
        create: (_) => CallDropDownDataS_INCM_Bloc(),
        child: BlocBuilder<CallDropDownDataS_INCM_Bloc, CallDropDownDataS_INCM>(
          builder: (context, CD_INCM) {
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
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

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
    DropDownData_INCM _DD_INCM = widget.DD_INCM ?? zeroDropDownData_MR;
    final MyData _data = MyData(context, widget.data ?? [], _DD_INCM.list01);

    void _sort<T>(Comparable<T> Function(dataset d) getField, int columnIndex,
        bool ascending) {
      _data._sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

    // print('------->' + '${_DD_INCM.list01}');

    return SingleChildScrollView(
      child: Column(
        children: [
          // FloatingActionButton(
          //   child: const Icon(Icons.add),
          //   onPressed: () {
          //     print("hi bloc");
          //     context.read<DataSetBloc>().add(GetDataPressed());
          //   },
          // ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: 1200,
              child: PaginatedDataTable(
                source: _data,
                header: const Text('Table Master'),
                columns: [
                  DataColumn(
                      label: const Text('ID'),
                      onSort: (int columnIndex, bool ascending) => _sort<num>(
                          (dataset d) => d.id, columnIndex, ascending)),
                  DataColumn(
                      label: Text('Field01'),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>(
                              (dataset d) => d.f01, columnIndex, ascending)),
                  DataColumn(
                      label: Text('Field02'),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>(
                              (dataset d) => d.f02, columnIndex, ascending)),
                  DataColumn(
                      label: Text('Field03'),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>(
                              (dataset d) => d.f03, columnIndex, ascending)),
                  DataColumn(
                      label: Text('Field04'),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>(
                              (dataset d) => d.f04, columnIndex, ascending)),
                  DataColumn(
                      label: Text('Field05'),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>(
                              (dataset d) => d.f05, columnIndex, ascending)),
                ],
                columnSpacing: 100,
                horizontalMargin: 10,
                rowsPerPage: 5,
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                showCheckboxColumn: false,
              ),
            ),
          ),
        ],
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

  int _selectedCount = 0;
  MyData.empty(this.context) {
    _data = [];
  }
  MyData(this.context, this.input, this.list01) {
    _data = input;
    _list01 = list01;
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
    return DataRow.byIndex(
        index: index,
        selected: data.selected,
        onSelectChanged: (value) {
          if (data.selected != value) {
            //-----------
            // confirmPass = false;
            stepindex = 0;
            itemMax = 0;
            constatus = 0;
            wait = false;
            SpacialAccText = '';
            nogood = false;
            //-----------
            // _selectedCount += value! ? 1 : -1;
            // assert(_selectedCount >= 0);
            // data.selected = value;
            print(index);
            print(data.f01);
            print(data.f03);

            onLoadingType01(
                context,
                context
                    .read<DropDownData_INCM_Bloc>()
                    .add(DropDownData_INCM_Pressed()),
                ConsoleBox(data, _list01));
            notifyListeners();
          }
        },
        cells: [
          DataCell(Text(data.id.toString()), onTap: () {
            print(data.f01);
          }),
          DataCell(Text(data.f01)),
          DataCell(Text(data.f02)),
          DataCell(Text(data.f03)),
          DataCell(Text(data.f04)),
          DataCell(Text(data.f05)),
        ]);
  }
}
