import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class MessagePageDemo extends StatelessWidget {
  const MessagePageDemo({super.key});

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
                  // onCellTap: (DataGridCellTapDetails details) {
                  //   // Handle row tap event
                  //   if (details.rowColumnIndex.rowIndex != 0) {
                  //     // Exclude the header row
                  //     final int rowIndex = details.rowColumnIndex.rowIndex - 1;
                  //     _viewMessage(messageList[rowIndex], context);
                  //   }
                  // },
                  headerGridLinesVisibility: GridLinesVisibility.both,
                  gridLinesVisibility: GridLinesVisibility.both,
                  source: MessageDataSource(messageList, context),
                  columnWidthMode: ColumnWidthMode.fill,
                  columns: <GridColumn>[
                    GridColumn(
                      allowFiltering: false,
                      allowSorting: false,
                      columnWidthMode: ColumnWidthMode.fitByColumnName,
                      columnName: 'sl',
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
                      columnWidthMode: ColumnWidthMode.fitByColumnName,
                      columnName: '    createdDate      ',
                      label: Container(
                          color: Colors.black, // Header row background color
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: const HeadingText('Created Date', size: 18)),
                    ),
                    GridColumn(
                      columnWidthMode: ColumnWidthMode.auto,
                      allowSorting: false,
                      columnName: 'action',
                      label: Container(
                          color: Colors.black, // Header row background color
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: const HeadingText('Action', size: 18)),
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
  final BuildContext context;
  List<DataGridRow> _dataGridRows = [];

  MessageDataSource(List<Message> messages, this.context) {
    _dataGridRows = messages
        .map<DataGridRow>((Message message) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'sl', value: message.sl),
              DataGridCell<String>(
                  columnName: 'content', value: message.content),
              DataGridCell<String>(
                  columnName: 'createdDate',
                  value: DateFormat('yyyy-MM-dd').format(message.createdDate)),
              DataGridCell<Widget>(
                  columnName: 'action',
                  value: TextButton(
                      onPressed: () {
                        _viewMessage(message, context);
                      },
                      child: const Text(
                        'View',
                        style: TextStyle(color: Colors.white),
                      )))
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    int rowIndex = _dataGridRows.indexOf(row);

    return DataGridRowAdapter(
      color: messageList[rowIndex].sl == 1
          ? const Color.fromARGB(255, 54, 0, 13).withOpacity(0.3)
          : const Color.fromARGB(255, 0, 46, 5).withOpacity(0.3),
      cells: row.getCells().map<Widget>((dataGridCell) {
        if (dataGridCell.columnName == 'action') {
          // Render the TextButton for the "Action" column
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: dataGridCell.value,
          );
        } else {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              dataGridCell.value.toString(),
              textAlign: TextAlign.center,
            ),
          );
        }
      }).toList(),
    );
  }
}

void _viewMessage(Message message, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color.fromARGB(255, 67, 67, 67)),
            borderRadius: BorderRadius.circular(5)),
        alignment: const Alignment(0.22, -0.5),
        title: const Column(
          children: [
            HeadingText(
              'Message Details',
              size: 20,
            ),
            Divider(),
          ],
        ),
        content: SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                children: [
                  Text(
                    'Sender Name : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Longjam Surajkumar',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    'Contact number : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '+91 3435353294',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const HeadingText(
                'Message Content',
                size: 16,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                textAlign: TextAlign.justify,
                message.content,
                style: const TextStyle(fontStyle: FontStyle.italic),
                softWrap: true,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

final List<Message> messageList = [
  Message(sl: 1, content: 'Welcome to the app!', createdDate: DateTime.now()),
  Message(
      sl: 2,
      content: 'Your profile is updated.',
      createdDate: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      sl: 3,
      content:
          'With this implementation, you can trigger any action (like opening a dialog or navigating to a new screen) when a user taps on a row.',
      createdDate: DateTime.now().subtract(const Duration(days: 2))),
  // Add more messages here
];

class Message {
  final int sl;
  final String content;
  final DateTime createdDate;

  Message({required this.sl, required this.content, required this.createdDate});
}
