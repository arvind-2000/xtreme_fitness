import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class MessagePageDemo extends StatelessWidget {
  final List<Message> messageList = [
    Message(sl: 1, content: 'Welcome to the app!', createdDate: DateTime.now()),
    Message(
        sl: 2,
        content: 'Your profile is updated.',
        createdDate: DateTime.now().subtract(const Duration(days: 1))),
    Message(
        sl: 3,
        content: 'New message received.',
        createdDate: DateTime.now().subtract(const Duration(days: 2))),
    // Add more messages here
  ];

  MessagePageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadingText('All Message'),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: SfDataGrid(
                  allowSorting: true,
                  headerGridLinesVisibility: GridLinesVisibility.both,
                  gridLinesVisibility: GridLinesVisibility.both,
                  source: MessageDataSource(messageList),
                  columnWidthMode: ColumnWidthMode.fill,
                  columns: <GridColumn>[
                    GridColumn(
                      allowSorting: false,
                      columnWidthMode: ColumnWidthMode.fitByColumnName,
                      columnName: ' sl ',
                      label: Container(
                          color: Colors.black, // Header row background color
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: const HeadingText('SL', size: 18)),
                    ),
                    GridColumn(
                      allowSorting: false,
                      columnName: 'content',
                      label: Container(
                          color: Colors.black, // Header row background color
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: const HeadingText(
                            'Message Content',
                            size: 18,
                          )),
                    ),
                    GridColumn(
                      allowFiltering: true,
                      allowSorting: true,
                      columnWidthMode: ColumnWidthMode.auto,
                      columnName: '   createdDate            ',
                      label: Container(
                          color: Colors.black, // Header row background color
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: const HeadingText('Created Date', size: 18)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageDataSource extends DataGridSource {
  List<DataGridRow> _dataGridRows = [];

  MessageDataSource(List<Message> messages) {
    _dataGridRows = messages
        .map<DataGridRow>((Message message) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'sl', value: message.sl),
              DataGridCell<String>(
                  columnName: 'content', value: message.content),
              DataGridCell<String>(
                  columnName: 'createdDate',
                  value: DateFormat('yyyy-MM-dd').format(message.createdDate)),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(dataGridCell.value.toString()),
        );
      }).toList(),
    );
  }
}

class Message {
  final int sl;
  final String content;
  final DateTime createdDate;

  Message({required this.sl, required this.content, required this.createdDate});
}
