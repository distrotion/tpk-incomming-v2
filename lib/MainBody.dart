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
            return TableBody(data: data);
          },
        ));
  }
}

class TableBody extends StatefulWidget {
  TableBody({Key? key, this.data}) : super(key: key);
  List<dataset>? data;

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
  }

  @override
  Widget build(BuildContext context) {
    contexttable = context;
    final MyData _data = MyData(context, widget.data ?? []);

    void _sort<T>(Comparable<T> Function(dataset d) getField, int columnIndex,
        bool ascending) {
      _data._sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

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

  int _selectedCount = 0;
  MyData.empty(this.context) {
    _data = [];
  }
  MyData(this.context, this.input) {
    _data = input;
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
            // _selectedCount += value! ? 1 : -1;
            // assert(_selectedCount >= 0);
            // data.selected = value;
            print(index);
            print(data.f01);
            print(data.f03);
            onLoadingType01(context, () {}, ConsoleBox(data));
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
