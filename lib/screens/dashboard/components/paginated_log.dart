import 'dart:convert';
import 'dart:ffi';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gateflow/models/events_page_entity.dart';
import 'package:gateflow/utils/http.dart';
import '../../../wiidget/mytoast.dart';

EventsPageEntity pageEntity = EventsPageEntity();

class PaginatedDataTablePage extends StatefulWidget {
  List<String> devices = <String>['全部设备', '青云山西门', '青云山东门', '青云山北门'];

  //EventsPageEntity pageEntity = EventsPageEntity();
  DateTime selectedDate = DateTime.now().toLocal(); //选择的时间
  PaginatedDataTablePage({super.key});

  @override
  State<StatefulWidget> createState() => _PaginatedPageState();
}

class _PaginatedPageState extends State<PaginatedDataTablePage> {
  var _rowsPerPage = 10;
  bool _sortAscending = true;
  String deviceName = "全部设备";
  SourceData _sourceData = SourceData(pageEntity);

  String _selectDay() {
    return widget.selectedDate.toString().split(" ")[0];
  }

  //获取设备名称
  _getDevices() async {}

  //下一页
  _getEvents(String day, int pageNo, int pageSize) async {
    // var lastIndex = pageSize * pageNo;
    // var dataIndex = pageSize;
    // if (pageEntity.count < lastIndex) {
    //   dataIndex = pageEntity.count;
    // }
    var requestMap = {
      'date': day,
      'pageNo': pageNo,
      'pageSize': pageSize,
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

  _pageChanged(pageNo) {
    print(pageNo);
    _getEvents(_selectDay(), pageNo, _rowsPerPage);
  }

  _dateChanged() {
    _getEvents(_selectDay(), 1, _rowsPerPage);
  }

  _resetFilter() {
    deviceName = widget.devices.first;
    widget.selectedDate = DateTime.now().toLocal();
    pageEntity.count = 0;
    pageEntity.data?.clear();
    _getEvents(_selectDay(), 1, _rowsPerPage);
  }

  @override
  void initState() {
    if (deviceName == "") {
      deviceName = widget.devices.first;
    }
    _getEvents(_selectDay(), 0, _rowsPerPage);
    super.initState();
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
          setState(() {
            widget.selectedDate = value;
          });
        }
      });
    }

    var paginatedDataTable = PaginatedDataTable2(
      source: _sourceData,
      header: Text('事件'),
      actions: [
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
            setState(() {
              widget.selectedDate = DateTime.now().toLocal();
              FToast()
                  .init(context)
                  .showToast(child: MyToast(tip: "已重置过滤条件", ok: true));
            });
          },
        ),
        TextButton.icon(
          icon: Icon(Icons.clear),
          label: Text("关闭"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      headingRowHeight: 50.0,
      dataRowHeight: 60.0,
      rowsPerPage: _rowsPerPage,
      onPageChanged: (i) => _pageChanged(i),
      availableRowsPerPage: [10, 20, 50, 100],
      onRowsPerPageChanged: (value) => setState(() => _rowsPerPage = value!),
      sortAscending: _sortAscending,
      //sortColumnIndex: 1,
      //showCheckboxColumn: true,
      //onSelectAll: (state) => setState(() => _sourceData.selectAll(state!)),
      columns: [
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
      // initialFirstRowIndex: 0,
      // columnSpacing: 0,
      // horizontalMargin: 5,
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
      item = pageEntity.data?[index%10];
    } catch (e) {
      print(e);
    }
    if(item ==null) return null;
    return DataRow(cells: [
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
