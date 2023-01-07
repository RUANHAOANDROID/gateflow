import 'dart:convert';
import 'dart:ffi';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gateflow/models/devices_entity.dart';
import 'package:gateflow/models/events_page_entity.dart';
import 'package:gateflow/utils/http.dart';
import '../../../constants.dart';
import '../../../wiidget/mytoast.dart';

class PaginatedDataTablePage extends StatefulWidget {
  //EventsPageEntity pageEntity = EventsPageEntity();
  DateTime selectedDate = DateTime.now().toLocal(); //选择的时间
  PaginatedDataTablePage({super.key});

  @override
  State<StatefulWidget> createState() => _PaginatedPageState();
}

class _PaginatedPageState extends State<PaginatedDataTablePage> {
  final _key = GlobalKey<PaginatedDataTable2State>();
  List<String> _devices = List.empty(growable: true);
  List<String> eventTypes = ["事件", "验票", "过闸", "核销"];
  var _eventType = "事件";
  int _rowsPerPage = 10;
  int _currentIndex = 0;
  String _deviceName = "全部设备";
  EventsPageEntity _pageEntity = EventsPageEntity();

  String _selectDay() {
    return widget.selectedDate.toString().split(" ")[0];
  }

  //获取设备名称
  _getDevices() async {
    debugPrint("_getDevices async");
    try {
      var response = await HttpUtils.post("/devices/list", "");

      var myDevices = DevicesEntity.fromJson(response).data!;
      debugPrint("_getDevices : ${myDevices}");
      var data = myDevices.map((e) => e.tag!).toList();
      print(data);
      _devices.clear();
      _devices.add(_deviceName);
      _devices.addAll(data);
      setState(() {
        //devices.clear();
        //devices=data;
        print("setState _getDevices :$_devices");
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //下一页
  _getEvents({int rowIndex = 0}) async {
    var requestMap = {
      'date': _selectDay(),
      'type': _eventType,
      'pageNo': rowIndex,
      'pageSize': _rowsPerPage,
      'deviceName': _deviceName,
    };
    var json =
        await HttpUtils.post("/devices/getEvents", jsonEncode(requestMap));
    var entity = EventsPageEntity.fromJson(json);

    setState(() {
      _pageEntity = entity;
      //_sourceData.pageEntity.count = _pageEntity.count;
      //_sourceData.pageEntity.data = _pageEntity.data;
    });
  }

  _deviceChanged(String device) {
    debugPrint("_deviceChanged :${device}");
    _deviceName = device;
    _refresh();
  }

  _eventTypeChanged(String type) {
    debugPrint("_eventTypeChanged :${type}");
    _eventType = type;
    _refresh();
  }

  _pageChanged(int rowIndex) {
    _currentIndex = rowIndex;
    debugPrint("_pageChanged :${rowIndex}");
    _getEvents();
  }

  _dateChanged(DateTime date) {
    debugPrint("_dateChanged :${date}");
    widget.selectedDate = date;
    _refresh();
  }

  _resetFilter() {
    _deviceName = _devices.first;
    _eventType = eventTypes.first;
    widget.selectedDate = DateTime.now().toLocal();
    _refresh();
    //FToast().init(context).showToast(child: MyToast(tip: "已重置过滤条件", ok: true));
  }

  void _refresh() {
    debugPrint(
        "_refresh:date=${_selectDay()} device=$_deviceName index = $_currentIndex ");
    if (_currentIndex == 0) {
      _getEvents();
      return;
    }
    _key.currentState?.pageTo(0);
  }

  @override
  void initState() {
    _getEvents();
    _getDevices();
    super.initState();
  }

  @override
  void dispose() {
    //_sourceData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    SourceData _sourceData = SourceData(context,_pageEntity);

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

    // device title
    Widget _deviceSelectorButton() {
      if (_devices.isEmpty) {
        return TextButton.icon(
          icon: Icon(Icons.access_time),
          label: Text("设备(${_selectDay()})"),
          onPressed: () async {
            FToast()
                .init(context)
                .showToast(child: const MyToast(tip: "没有更多设备", ok: false));
          },
        );
      }
      return DropdownButton<String>(
        value: _deviceName,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.blue,
        ),
        //elevation: 16,
        style: const TextStyle(color: Colors.blue),
        underline: Container(
          height: 0,
          color: Colors.white12,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          _deviceChanged(value!);
          _deviceName = value!;
          setState(() {
            _deviceName = value!;
          });
        },
        items: _devices.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    }

    //事件类型
    Widget _eventTypeButton() {
      if (eventTypes.isEmpty) return Text("事件");
      return DropdownButton<String>(
        value: _eventType,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.blue,
        ),
        //elevation: 16,
        style: const TextStyle(color: Colors.blue),
        underline: Container(
          height: 0,
          color: Colors.white12,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          _eventTypeChanged(value!);
          _eventType = value!;
          setState(() {
            _eventType = value!;
          });
        },
        items: eventTypes.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    }

    var titleActions = [
      // TextButton.icon(
      //   icon: Icon(Icons.access_time),
      //   label: Text("时间(${_selectDay()})"),
      //   onPressed: () async {
      //     _showDatePicker();
      //   },
      // ),
      //_deviceSelectorButton(),
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
      availableRowsPerPage: const [10, 20, 50],
      onRowsPerPageChanged: (value) {
        debugPrint("onRowsPerPageChanged:$value");
        _rowsPerPage = value!;
      },
      sortAscending: true,
      columns: [
        DataColumn2(
          label: _deviceSelectorButton(),
          // onSort: (index, sortAscending) {
          //   setState(() {
          //     _sortAscending = sortAscending;
          //     _sourceData.sortData((map) => map['id'], sortAscending);
          //   });
          // },
        ),
        DataColumn2(
            label: TextButton.icon(
          icon: Icon(Icons.access_time),
          label: Text("时间(${_selectDay()})"),
          onPressed: () async {
            _showDatePicker();
          },
        )),
        DataColumn2(label: _eventTypeButton()),
        DataColumn2(label: Text('内容')),
      ],
      empty: const Center(child: Text('暂无数据')),
      showFirstLastButtons: true,
      initialFirstRowIndex: 0,
      showCheckboxColumn: false,
      columnSpacing: 0,
      horizontalMargin: 20,
      //sortColumnIndex: 1,
      //onSelectAll: (state) => setState(() => _sourceData.selectAll(state!)),
    );
    return paginatedDataTable;
  }
}

class SourceData extends DataTableSource {
  final EventsPageEntity pageEntity;
  final BuildContext context;

  SourceData(this.context,this.pageEntity);

  final int _selectCount = 0; //当前选中的行数

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
    void _showLogContextInfo(text) {
      showDialog(
        context: context,
        //barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: secondaryColor,
            child: Container(
              width: 600,
              height: 300,
              padding:
              const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              color: bgColor,
              child: SelectableText(text),
            ),
          );
        },
      );
    }
    return DataRow(cells: [
      DataCell(Text("${item?.deviceName}"), placeholder: true),
      DataCell(Text("${item?.time}"), placeholder: true),
      DataCell(Text("${item?.tag}"), placeholder: true),
      DataCell(Text("${item?.content}"), placeholder: true,onTap: (){
        _showLogContextInfo("${item?.content}");
      })
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
