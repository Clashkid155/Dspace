import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class FilesEntry extends DataGridSource {
  FilesEntry(List data) {
    // Map x = {}.
    _rowdata = data
        .map<DataGridRow>((e) => DataGridRow(cells: [
              const DataGridCell<String>(
                columnName: 'id',
                value: '*',
              ),
              DataGridCell<String>(
                columnName: 'File Name',
                value: e['Directory'],
              ),
              DataGridCell<String>(
                columnName: 'Size',
                value: e['Size'].toString(),
              ),
              DataGridCell(
                columnName: 'Action',
                value: e['Size'].toString(),
              ),
            ]))
        .toList();
  }
  List<DataGridRow> _rowdata = [];
// Id/no
// File name
// Size
// Actions
  @override
  List<DataGridRow> get rows => _rowdata;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: Colors.red,
        cells: row.getCells().map((dataGridCell) {
          //print(dataGridCell.columnName);

          Card(
            child: Center(child: Text(dataGridCell.value.toString())),
          );
          /*if (dataGridCell.columnName == 'Size') {
        x = filesize(dataGridCell.value.toString());
      }*/
          return GestureDetector(
            onTap: () {
              // Navigate to the next screen

              print(dataGridCell.value);
            },
            child: Card(
              child: Center(child: Text(dataGridCell.value.toString())),
            ),
          ); /*Container(
        //width: double.infinity,
        //color: Colors.green,
        padding: const EdgeInsets.only(left: 20),
        alignment: (dataGridCell.columnName == 'File Nmae' ||
                dataGridCell.columnName == 'Action')
            ? Alignment.centerLeft
            : Alignment.center,
        child: Center(child: Text(dataGridCell.value.toString())),
      );*/
        }).toList());
  }
}
