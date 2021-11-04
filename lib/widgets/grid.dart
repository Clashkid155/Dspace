import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class GridList extends StatelessWidget {
  final DataGridSource datasource;
  const GridList({Key? key, required this.datasource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      columnWidthMode: ColumnWidthMode.fill,
      source: datasource,
      columns: [
        GridColumn(
            columnWidthMode: ColumnWidthMode.fitByColumnName,
            columnName: 'id',
            label: const Center(child: Text('ID'))),
        GridColumn(
            allowSorting: true,
            columnName: 'File Name',
            label: const Center(child: Text('File Name'))),
        GridColumn(
            columnName: 'Size', label: const Center(child: Text('Size'))),
        GridColumn(
            columnName: 'Action', label: const Center(child: Text('Action'))),
      ],
    );
  }
}
