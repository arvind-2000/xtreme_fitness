import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/xtremer.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/xtremerwithsubs.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/scaffolds.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:xtreme_fitness/widgets/textformwidget.dart';
import 'package:syncfusion_flutter_core/theme.dart';

// ignore: must_be_immutable
class XtremerDataSource extends DataGridSource {
  // final AddMemberController addmemberctrl;
  // final GetxPageController pagectrl;
  // final ManagementController managectrl;

  List<DataGridRow> _xtremerRows = [];
  Xtremer? _user;
  void changeuser(Xtremer us) {
    _user = us;
  }

  XtremerDataSource(
      {required ManagementController mngctrl,
      required GetxPageController pagectrl,
      required AddMemberController addmemberctrl}) {
    _xtremerRows = mngctrl.getsearchXtremer
        .map<DataGridRow>((xtremer) => DataGridRow(
        
          cells: [
              DataGridCell<String>(
              
                  columnName: 'firstName', value: xtremer.firstName ?? ''),
              DataGridCell<String>(
                  columnName: 'mobileNumber',
                  value: xtremer.mobileNumber ?? ''),
              DataGridCell<DateTime>(
                  columnName: 'startDate',
                  value: xtremer.startDate ?? DateTime.now()),
              DataGridCell<DateTime>(
                  columnName: 'endDate',
                  value: xtremer.endDate ?? DateTime.now()),
              DataGridCell<String>(
                  columnName: 'category', value: xtremer.category ?? ''),
              DataGridCell<Widget>(
              
                  columnName: 'action',
                  value: buildActionButtons(
                      xtremer: xtremer,
                      pagectrl: pagectrl,
                      addmemberctrl: addmemberctrl))
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => _xtremerRows;

  Widget buildActionButtons(
      {required XtremerWithSubscription xtremer,
      required GetxPageController pagectrl,
      required AddMemberController addmemberctrl}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

                ElevatedButton(
          onPressed: () {
         TextEditingController assigncard = TextEditingController();
          Get.dialog(
            
            StatefulBuilder(
            builder: (context,state) {
              
              return Dialog(
                
                child: SizedBox(width: 400,height: 500,child: 
                CardwithShadow(
                  padding: EdgeInsets.all(MediaQuery.sizeOf(context).width<mobilescreen?16: 32),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.payment,color: Colors.grey[300],),
                          SizedBox(width: 5,),
                          const HeadingText("Assign Card"),
                        ],
                      ),
                      IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.close,size: 14,)),
                 
                    ],
                  ),
                  
                       const SizedBox(height: 20,),
                      Expanded(child: Form(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        TextFieldWidget(hint: "Assign Card", controller: assigncard),

                      ],)),
                      
                      
                      ),
                      Cardonly(
                        onpress: (){
                          
                        },
                        color: Colors.grey[800],
                        child: Center(child: Text("Add Card"),))
                  ],)
                  
                  ),
                  ),
              );
            }
          ));
          },
          child: Row(
            children: [
              Icon(Icons.qr_code_scanner, size: 14,color: Colors.grey[200],),
              const SizedBox(width:5),
              const Text("Assign Card",
                  style: TextStyle(fontSize: 14,color: Colors.grey)),
            ],
          ),
        ),
            const SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {
            pagectrl.changerenewal(true);
            addmemberctrl.addxtremersrenewaledit(xtremer);
          },
          child: const Text("Renewal",
              style: TextStyle(fontSize: 14, color: Colors.blue)),
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
           const SizedBox(width: 5),
 
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
          alignment: Alignment.center,
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

  @override
  int compare(DataGridRow? a, DataGridRow? b, SortColumnDetails sortColumn) {
    if (sortColumn.name == 'firstName') {
      final String? value1 = a
          ?.getCells()
          .firstWhereOrNull((element) => element.columnName == sortColumn.name)
          ?.value
          .toString();
      final String? value2 = b
          ?.getCells()
          .firstWhereOrNull((element) => element.columnName == sortColumn.name)
          ?.value
          .toString();

      if (value1 == null || value2 == null) {
        return 0;
      }

      if (sortColumn.sortDirection == DataGridSortDirection.ascending) {
        return value1.toLowerCase().compareTo(value2.toLowerCase());
      } else {
        return value2.toLowerCase().compareTo(value1.toLowerCase());
      }
    }

    return super.compare(a, b, sortColumn);
  }
}

class XtremerDataTableWidget extends StatefulWidget {
  const XtremerDataTableWidget({super.key, required this.controller});
  final DataGridController controller;

  @override
  State<XtremerDataTableWidget> createState() => _XtremerDataTableWidgetState();
}

class _XtremerDataTableWidgetState extends State<XtremerDataTableWidget> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxPageController>(builder: (pagectrl) {
      return GetBuilder<AddMemberController>(builder: (addmemberctrl) {
        return GetBuilder<ManagementController>(builder: (managectrl) {
          // log("Name : +${managectrl.getsearchXtremer.first.firstName}");
          return Expanded(
            child: SfDataGridTheme(
              data: SfDataGridThemeData(
                gridLineColor: Colors.grey[700],
                filterIconColor: Colors.grey[600],
                gridLineStrokeWidth: 0.5
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:  16.0),
                child: SfDataGrid(
                     selectionMode: SelectionMode.multiple,
                    // onSelectionChanged: (addedRows, removedRows){
                   
                    //     managectrl.selectedIndex(controller.selectedRows);
                 
                    // },
                  controller: widget.controller,
                  allowTriStateSorting: true,
                  allowSorting: true,   
                  gridLinesVisibility: GridLinesVisibility.both,
                    footerHeight: 50,
                    showCheckboxColumn: true,

              
                  source: XtremerDataSource(    
                    
                      mngctrl: managectrl,
                      pagectrl: pagectrl,
                      addmemberctrl: addmemberctrl),
                  columnWidthMode: ColumnWidthMode.fill,
                  columns: <GridColumn>[
                    GridColumn(
                        allowSorting: true,
                        maximumWidth: 180,
                        columnName: 'firstName',
                      
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                    GridColumn(
                        maximumWidth: 140,
                        allowSorting: false,
                        columnName: 'mobileNumber',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Mobile',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                    GridColumn(
                        maximumWidth: 140,
                        allowSorting: false,
                        columnName: 'startDate',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Start Date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                    GridColumn(
                        maximumWidth: 140,
                        columnName: 'endDate',

                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'End Date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                    GridColumn(
                        maximumWidth: 140,
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
                        allowSorting: false,
                        columnName: 'actions',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Actions',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              
                                 
                              ],
                            ))),
                  ],
                ),
              ),
            ),
          );
        });
      });
    });
  }
}

// In your widget tree, add the new "Action" column
// ignore: non_constant_identifier_names

