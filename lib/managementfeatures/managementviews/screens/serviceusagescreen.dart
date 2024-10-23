import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/serviceusage.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';

import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../config/const.dart';

import '../../../widgets/cardborder.dart';
import '../../../widgets/cardswithshadow.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/textformwidget.dart';

import '../widgets/scaffolds.dart';
  List<String> d = ["InActive","Active"];
class ServiceUsageScreen extends StatefulWidget {
  const ServiceUsageScreen({super.key});

  @override
  State<ServiceUsageScreen> createState() => _ServiceUsageScreenState();
}

class _ServiceUsageScreenState extends State<ServiceUsageScreen> {
  String? serviceStatus;
  List<String> serviceActive = ["Success", "Failed", "Cancel", "Initiated"];
  List<String> d = ["InActive","Active"];
  @override
  void initState() {
    super.initState();
    Get.find<ManagementController>().getxtremer();
  }

  final TextEditingController _searchcontroller = TextEditingController();
  @override
  void dispose() {
    _searchcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  int paymentallpos = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxPageController>(builder: (pagectrl) {
      return GetBuilder<ManagementController>(builder: (managectrl) {
        return managectrl.getallpayments.isEmpty
            ? const NodataScreen(title: "ServiceUsage", desc: "No Service Usage Records")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const Text("All Members",style: TextStyle(fontSize: 20,),),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HeadingText("Service Usage"),
             
                          ],
                        ),

                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60,
                              width: MediaQuery.sizeOf(context).width <
                                      mobilescreen
                                  ? double.maxFinite
                                  : 400,
                              child: TextFieldWidget(
                                  showhint: false,
                                  hint: "Search services by phone number",
                                  controller: _searchcontroller,
                                  validator: () {},
                                  onchanged: (text) {
                                    managectrl.searchservice(text);
                                  },
                                  fieldsubmitted: () {
                                    managectrl
                                        .searchservice(_searchcontroller.text);
                                    _searchcontroller.clear();
                                  },
                                  icon: const Icon(Icons.search)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(managectrl.searchmessage!),
                          ],
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                         

                        // const Expanded(
                        //     child: Row(
                        //   children: [],
                        // )),
                        // Cardonly(
                        //   onpress: (){},
                        //   color: Theme.of(context).colorScheme.secondary,child: Text("Search",style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),),)
                      ],
                    ),
                  ),
                  managectrl.searchServicesSchedule.isEmpty
                      ? const NodataScreen(
                          title: "Service Usage", desc: "No service records"):Expanded(
                            child: SfDataGridTheme(
                                   data: SfDataGridThemeData(
                gridLineColor: Colors.grey[700],
                filterIconColor: Colors.grey[600],
                gridLineStrokeWidth: 0.5
              ),

                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: SfDataGrid(
                                    
                                                  allowTriStateSorting: true,
                                                  allowSorting: true,   
                                                  gridLinesVisibility: GridLinesVisibility.both,
                                                    footerHeight: 50,
                                                   columnWidthMode: ColumnWidthMode.fill,
                                                   
                                
                                  columns:  <GridColumn>[

                                                    GridColumn(
                                                        allowSorting: true,
                                                        maximumWidth: 180,
                                                        columnName: 'Name',
                                                      
                                                        label: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Name',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ))),
                                     GridColumn(
                                                        maximumWidth: 180,
                                                        allowSorting: false,
                                                        columnName: 'Phone',
                                                        label: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Phone',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ))),
                                                    GridColumn(
                                                        maximumWidth: 180,
                                                        allowSorting: false,
                                                        columnName: 'Service',
                                                        label: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Service',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ))),
                                                    GridColumn(
                                                        maximumWidth: 140,
                                                        allowSorting: false,
                                                        columnName: 'Date',
                                                        label: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Date',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ))),
                                      
                                                    GridColumn(
                                                        maximumWidth: 140,
                                                        columnName: 'Status',
                                                        label: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Status',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ))),
                                                    // Add the Action column
                                                    GridColumn(
                                                        maximumWidth: 200,
                                                        allowSorting: false,
                                                        columnName: 'Actions',
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
                                                  ],source: DatagridsList(managectrl: managectrl),),
                              ),
                            ),
                          ),
  
                  const SizedBox(
                    height: 40,
                  )
                ],
              );
      });
    });
  }
}


class DatagridsList extends DataGridSource{
  List<DataGridRow> _xtremerRows = [];
  final ManagementController managectrl;
  DatagridsList( {
  required this.managectrl
  }){
      _xtremerRows =  managectrl.searchServicesSchedule.map<DataGridRow>((services) => DataGridRow(
        
          cells: [
              DataGridCell<String>(
              
                  columnName: 'Name', value:managectrl.getUserbyId(services.userId)?.userName??""),
                   DataGridCell<String>(
              
                  columnName: 'Phone', value:managectrl.getUserbyId(services.userId)?.mobileNumber??""),
              DataGridCell<String>(
                  columnName: 'Service',
                  value:managectrl.getServicebyId( services.serviceId)?.name ??''),
              DataGridCell<DateTime>(
                  columnName: 'Date',
                  value: services.scheduleDate ),
            
              DataGridCell<String>(
                  columnName: 'Status', value: services.status),
              DataGridCell<Widget>(
              
                  columnName: 'Actions',
                  value:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  CardwithShadow(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    onpress: (){ 
                      
                          bool serviceStatus = services.status.toLowerCase() == "active";
                      Get.dialog(StatefulBuilder(
                        builder: (context,state) {
                          return Dialog(
                                        child: SizedBox(
                                          width: 500,
                                          height: 600,
                                          child: CardwithShadow(
                                            margin: EdgeInsets.zero,
                                            color: Colors.grey[900],
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const HeadingText(
                                                        "Edit Service"),
                                                    IconButton(
                                                        onPressed: () {
                                                         Get.back();
                                                        },
                                                        icon: const Icon(
                                                          Icons.close,
                                                          size: 16,
                                                        ))
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                                Expanded(
                                                  child: managectrl.iseditpayment
                                                      ? const Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            color:
                                                                Colors.grey
                                                          ),
                                                        )
                                                      : SingleChildScrollView(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Row(
                                                                children: [
                                                                  Text(
                                                                    "Phone",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                          
                                                                ],
                                                              ),
                                                              Text(
                                                                  "${managectrl.allUsers.firstWhereOrNull((element) => element.id==services.userId,)?.mobileNumber}"),
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                                 const Text(
                                                                "Service:",
                                                                style: TextStyle(
                                                                    fontSize: 14),
                                                              ),
                                                                
                                                              Text(
                                                                 '${managectrl.getallservices.firstWhereOrNull((element) => element.id ==services.serviceId,)?.name}'),
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                              const Text(
                                                                "Date",
                                                                style: TextStyle(
                                                                    fontSize: 14),
                                                              ),
                                                              Text(
                                                                  "${services.scheduleDate.day}/${services.scheduleDate.month}/${services.scheduleDate.year}"),
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                              const Text(
                                                                "Amount",
                                                                style: TextStyle(
                                                                    fontSize: 14),
                                                              ),
                                                              Text(
                                                                "${services.serviceId}",
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            16),
                                                              ),
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                              DropdownMenu(
                                                                  menuStyle:
                                                                      MenuStyle(
                                                                                    shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                                  backgroundColor: WidgetStateColor.resolveWith(
                                (states) => Colors.grey[800]!,
                              )),
                                                                  onSelected:
                                                                      (index) {
                                                                    state(() {
                                                                      serviceStatus = d[index!].toLowerCase()=='active';
                                                                  });
                                                                  },
                                                                                    
                                                                  hintText:
                                                                     services.status,
                                                                  dropdownMenuEntries: 
                                                                      d.asMap()
                                                                      .entries
                                                                      .map((e) => DropdownMenuEntry(
                                                                          value: e.key,
                                                                          label: e.value,
                                                                          style: ButtonStyle(
                                                                              backgroundColor: WidgetStateColor.resolveWith(
                                                                            (states) => Theme.of(context)
                                                                                .colorScheme
                                                                                .primary,
                                                                          ))))
                                                                      .toList()),
                                                          
                                                              
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                ),
                                                SizedBox(
                                                  width: double.maxFinite,
                                                  child: CardBorder(
                                                      margin: EdgeInsets.zero,
                                                      color: Colors.blue,
                                                      onpress: () async {
                                                        ServiceSchedule d = services;
                                                        d.status = serviceStatus?"Active":"InActive";
                                                        String v = await managectrl.updateserviceschedule(d);
                                                        // createAndPrintPdf(Paymententity(id: managectrl.searchServicesSchedule[i].id, userId: managectrl.searchServicesSchedule[i].userId!, amount: managectrl.searchServicesSchedule[i].amount!, discountPercentage: managectrl.searchServicesSchedule[i].discountPercentage!.toDouble(), receivedAmount: managectrl.searchServicesSchedule[i].receivedAmount, paymentDate: managectrl.searchServicesSchedule[i].paymentDate, transactionId:managectrl.searchServicesSchedule[i].transactionId!, paymentStatus: managectrl.searchServicesSchedule[i].paymentStatus!, paymentMethod:managectrl.searchServicesSchedule[i].paymentMethod!, paymentType: managectrl.searchServicesSchedule[i].paymentType!, subscriptionId: managectrl.searchServicesSchedule[i].subscriptionId, serviceUsageId: managectrl.searchServicesSchedule[i].serviceUsageId, termsAndConditions: true));
                                                       Get.back();
                                                        CustomSnackbar(
                                                          v);
                                                      },
                                                      child: const Center(
                                                          child: Text(
                                                        "Edit Service",
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ))),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                        }
                      ));},
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit,size: 14,),
                        SizedBox(width: 6,),
                        Text("Edit Service",style: TextStyle(fontSize: 14),),
                      ],
                    ))
                    ],
                  ))
            ]))
        .toList();
  }
   @override
  List<DataGridRow> get rows => _xtremerRows;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
   return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        if (dataGridCell.columnName == 'Actions') {
          return dataGridCell.value as Widget; // Return action buttons
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: dataGridCell.columnName == 'Date'
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