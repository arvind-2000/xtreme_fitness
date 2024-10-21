import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/xtremer.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/xtremerwithsubs.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';

class XtremerTableWidget extends StatelessWidget {
  final AddMemberController addmemberctrl;
  final GetxPageController pagectrl;
  final ManagementController managectrl;
  List<DataGridRow> _xtremerRows = [];
  Xtremer? _user;
  void changeuser(Xtremer us) {
    _user = us;
  }

  XtremerTableWidget(
      {super.key,
      required this.addmemberctrl,
      required this.pagectrl,
      required this.managectrl});

  datasorce(List<XtremerWithSubscription> xtremers) {
    _xtremerRows = xtremers
        .map<DataGridRow>((xtremer) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'firstName', value: xtremer.firstName),
              DataGridCell<String>(
                  columnName: 'mobileNumber', value: xtremer.mobileNumber),
              DataGridCell<DateTime>(
                  columnName: 'startDate', value: xtremer.startDate),
              DataGridCell<DateTime>(
                  columnName: 'endDate', value: xtremer.endDate),
              DataGridCell<String>(
                  columnName: 'category', value: xtremer.category),
              DataGridCell<Widget>(
                  columnName: 'action', value: buildActionButtons(xtremer))
            ]))
        .toList();
  }

  List<DataGridRow> get rows => _xtremerRows;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (context) {
      return SfDataGrid(
        source: datasorce(managectrl.getsearchXtremer),
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'firstName',
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
          GridColumn(
              columnName: 'mobileNumber',
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Mobile',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
          GridColumn(
              columnName: 'startDate',
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Start Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
          GridColumn(
              columnName: 'endDate',
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'End Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
          GridColumn(
              columnName: 'category',
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Category',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
          // Add the Action column
          GridColumn(
              columnName: 'action',
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Action',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
        ],
      );
    });
  }

  // Helper function to build action buttons
  Widget buildActionButtons(XtremerWithSubscription xtremer) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            pagectrl.changerenewal(true);
            addmemberctrl.addxtremersrenewaledit(xtremer);
          },
          child: const Text("Renewal", style: TextStyle(fontSize: 14)),
        ),
        const SizedBox(width: 5),
        IconButton(
          onPressed: () {
            pagectrl.changeeditform(true);
            addmemberctrl.addxtremersedit(xtremer);
          },
          icon: const Icon(Icons.edit, size: 14),
          tooltip: "Edit",
        ),
        const SizedBox(width: 5),
        IconButton(
          onPressed: () {
            changeuser(xtremer);
            pagectrl.changeviewprofile(true);
          },
          icon: const Icon(Icons.person, size: 14),
          tooltip: "View Profile",
        ),
      ],
    );
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        if (dataGridCell.columnName == 'action') {
          return dataGridCell.value as Widget; // Return action buttons
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: (dataGridCell.columnName == 'mobileNumber' ||
                  dataGridCell.columnName == 'category')
              ? Alignment.centerLeft
              : Alignment.center,
          child: dataGridCell.columnName == 'startDate' ||
                  dataGridCell.columnName == 'endDate'
              ? Text(
                  '${(dataGridCell.value as DateTime).day}/${(dataGridCell.value as DateTime).month}/${(dataGridCell.value as DateTime).year}',
                  style: const TextStyle(fontSize: 14),
                )
              : Text(
                  dataGridCell.value.toString(),
                  style: const TextStyle(fontSize: 14),
                ),
        );
      }).toList(),
    );
  }
}

// In your widget tree, add the new "Action" column
// ignore: non_constant_identifier_names

