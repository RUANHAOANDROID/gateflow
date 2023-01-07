import 'dart:convert';
import 'dart:ffi';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gateflow/models/events_page_entity.dart';
import 'package:gateflow/utils/http.dart';
import '../../../wiidget/mytoast.dart';

class PaginatedDataTablePage extends StatefulWidget {
  List<String> devices = <String>['全部设备', '青云山西门', '青云山东门', '青云山北门'];

  //EventsPageEntity pageEntity = EventsPageEntity();
  DateTime selectedDate = DateTime.now().toLocal(); //选择的时间
  PaginatedDataTablePage({super.key});

  @override
  State<StatefulWidget> createState() => _PaginatedPageState();
}

class _PaginatedPageState extends State<PaginatedDataTablePage> {
  final _key = GlobalKey<PaginatedDataTable2State>();
  int _rowsPerPage = 10;
  int currentIndex = 0;
  bool _sortAscending = true;
  String deviceName = "全部设备";
  EventsPageEntity pageEntity = EventsPageEntity();
  late SourceData _sourceData;

  String _selectDay() {
    return widget.selectedDate.toString().split(" ")[0];
  }

  //获取设备名称
  _getDevices() async {}

  //下一页
  _getEvents({int rowIndex = 0}) async {
    var requestMap = {
      'date': _selectDay(),
      'pageNo': rowIndex,
      'pageSize': _rowsPerPage,
      'deviceName': deviceName,
    };
    var json =
        await HttpUtils.post("/devices/getEvents", jsonEncode(requestMap));
    var entity = EventsPageEntity.fromJson(json);
    setState(() {
      if (entity.count > 0) {
        if (entity.data != null) {
          //_rowsPerPage = entity.data!.length;
          pageEntity = entity;
          _sourceData = SourceData(pageEntity);
        }
      }
    });
  }

  _deviceChanged(String device) {
    debugPrint("_deviceChanged :${device}");
    deviceName = device;
    _refresh();
  }

  _pageChanged(int rowIndex) {
    currentIndex = rowIndex;
    debugPrint("_pageChanged :${rowIndex}");
    _getEvents();
  }

  _dateChanged(DateTime date) {
    debugPrint("_dateChanged :${date}");
    widget.selectedDate = date;
    _refresh();
  }

  _resetFilter() {
    deviceName = widget.devices.first;
    widget.selectedDate = DateTime.now().toLocal();
    _refresh();
    FToast().init(context).showToast(child: MyToast(tip: "已重置过滤条件", ok: true));
  }

  void _refresh() {
    debugPrint(
        "_refresh:date=${_selectDay()} device=$deviceName index = $currentIndex ");
    if (currentIndex == 0) {
      _getEvents();
      return;
    }
    _key.currentState?.pageTo(0);
  }

  @override
  void initState() {
    if (deviceName == "") {
      deviceName = widget.devices.first;
    }
    _sourceData = SourceData(pageEntity);
    _getEvents();
    super.initState();
  }

  @override
  void dispose() {
    _sourceData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _showDatePicker() async {
      await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2022),
              lastDate: DateTime(2025),
              locale: Locale("zh"))
          .then((value) {
        if (value != null) {
          _dateChanged(value);
        }
      });
    }

    var titleActions = [
      TextButton.icon(
        icon: Icon(Icons.access_time),
        label: Text("时间(${_selectDay()})"),
        onPressed: () async {
          _showDatePicker();
        },
      ),
      DropdownButton<String>(
        value: deviceName,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.blue,
        ),
        elevation: 16,
        style: const TextStyle(color: Colors.blue),
        underline: Container(
          height: 0,
          color: Colors.white12,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          _deviceChanged(value!);
          deviceName = value!;
          setState(() {
            deviceName = value!;
          });
        },
        items: widget.devices.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
      TextButton.icon(
        icon: Icon(Icons.refresh),
        label: Text("重置过滤条件"),
        onPressed: () {
          _resetFilter();
        },
      ),
      TextButton.icon(
        icon: Icon(Icons.clear),
        label: Text("关闭"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ];
    var paginatedDataTable = PaginatedDataTable2(
      key: _key,
      source: _sourceData,
      header: Text('事件'),
      actions: titleActions,
      headingRowHeight: 50.0,
      dataRowHeight: 60.0,
      rowsPerPage: _rowsPerPage,
      onPageChanged: (rowIndex) {
        debugPrint("onPageChanged:$rowIndex");
        _pageChanged(rowIndex!);
      },
      availableRowsPerPage: [10, 20, 50],
      onRowsPerPageChanged: (value) {
        debugPrint("onRowsPerPageChanged:$value");
        _rowsPerPage = value!;
      },
      sortAscending: _sortAscending,
      //sortColumnIndex: 1,
      //showCheckboxColumn: true,
      //onSelectAll: (state) => setState(() => _sourceData.selectAll(state!)),
      columns: [
        DataColumn2(
            label: Container(
          child: Text('ID'),
        )),
        DataColumn2(label: Text('时间')),
        DataColumn2(
          label: Text('点位'),
          // onSort: (index, sortAscending) {
          //   setState(() {
          //     _sortAscending = sortAscending;
          //     _sourceData.sortData((map) => map['id'], sortAscending);
          //   });
          // },
        ),
        DataColumn2(label: Text('事件')),
        DataColumn2(label: Text('内容')),
      ],
      empty: const Center(child: Text('暂无数据')),
      // showFirstLastButtons: true,
      initialFirstRowIndex: 0,
      showCheckboxColumn: false,
      columnSpacing: 0,
      horizontalMargin: 5,
      wrapInCard: false,
    );
    return paginatedDataTable;
  }
}

class SourceData extends DataTableSource {
  final EventsPageEntity pageEntity;

  SourceData(this.pageEntity);

  int _selectCount = 0; //当前选中的行数

  bool get isRowCountApproximate => false;

  int get rowCount => pageEntity.count; //总行数

  int get selectedRowCount => _selectCount; //选中的行数

  //数据排序
  void sortData<T>(Comparable<T> getField(Map<String, dynamic> map), bool b) {
    // _sourceData.sort((Map<String, dynamic> map1, Map<String, dynamic> map2) {
    //   if (!b) {
    //     //两个项进行交换
    //     final Map<String, dynamic> temp = map1;
    //     map1 = map2;
    //     map2 = temp;
    //   }
    //   final Comparable<T> s1Value = getField(map1);
    //   final Comparable<T> s2Value = getField(map2);
    //   return Comparable.compare(s1Value, s2Value);
    // });
    // notifyListeners();
  }

  void selectAll(bool checked) {
    // _sourceData.forEach((data) => data["selected"] = checked);
    // _selectCount = checked ? _sourceData.length : 0;
    // notifyListeners(); //通知监听器去刷新
  }

  @override
  DataRow? getRow(int index) {
    EventsPageData? item;
    try {
      item = pageEntity.data?[index % 10];
    } catch (e) {
      print(e);
    }
    if (item == null) return null;
    return DataRow(cells: [
      DataCell(Text("${item?.id}"), placeholder: true),
      DataCell(Text("${item?.time}"), placeholder: true),
      DataCell(Text("${item?.deviceName}"), placeholder: true),
      DataCell(Text("${item?.tag}"), placeholder: true),
      DataCell(Text("${item?.content}"), placeholder: true)
    ]);
  }
// DataRow getRow(int index) => DataRow.byIndex(index: index,
//     //selected: _sourceData[index]["selected"],
//     // onSelectChanged: (selected) {
//     //   _sourceData[index]["selected"] = selected;
//     //   notifyListeners();
//     // },
//     cells: [
//       DataCell(Text("${pageEntity.data?[index].time}"), placeholder: true),
//       DataCell(Text("${pageEntity.data?[index].deviceName}"), placeholder: true),
//       DataCell(Text("${pageEntity.data?[index].tag}"), placeholder: true),
//       DataCell(Text("${pageEntity.data?[index].content}"), placeholder: true)
//     ]);
}
