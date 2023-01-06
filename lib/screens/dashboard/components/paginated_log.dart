import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../wiidget/mytoast.dart';

class PaginatedDataTablePage extends StatefulWidget {
  List<String> devices = <String>['全部设备', '青云山西门', '青云山东门', '青云山北门'];
  DateTime _selectedDate = DateTime.now().toLocal(); //选择的时间
  PaginatedDataTablePage({super.key});

  @override
  State<StatefulWidget> createState() => _PaginatedPageState();
}

class _PaginatedPageState extends State<PaginatedDataTablePage> {
  SourceData _sourceData = SourceData();
  var _rowsPerPage = 10;
  bool _sortAscending = true;
  String dropdownValue = "";

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.devices.first;
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
            widget._selectedDate = value;
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
          label: Text("时间(${widget._selectedDate.toString().split(" ")[0]})"),
          onPressed: () async {
            _showDatePicker();
          },
        ),
        DropdownButton<String>(
          value: dropdownValue,
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
            dropdownValue = value!;
            setState(() {
              dropdownValue = value!;
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
              widget._selectedDate = DateTime.now().toLocal();
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
      onPageChanged: (i) => print('onPageChanged -> $i'),
      availableRowsPerPage: [10, 20, 50, 100],
      onRowsPerPageChanged: (value) => setState(() => _rowsPerPage = value!),
      sortAscending: _sortAscending,
      //sortColumnIndex: 1,
      //showCheckboxColumn: true,
      onSelectAll: (state) => setState(() => _sourceData.selectAll(state!)),
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
  int _selectCount = 0; //当前选中的行数
  final List<Map<String, dynamic>> _sourceData = List.generate(
      1000,
      (index) => {
            "id": "青云山西门${(index + 1)}",
            "name": "验票 ${(index + 1)}",
            "address": (index % 3 == 1)
                ? '\$F384605470533333459544638111/@10932800515276<MjAwMDAwMTkyNDIwMjMtMDEtMDQyMDIzLTAxLTA0>\@\$E\n\$F384605470533333459544638111/@10932800515276<MjAwMDAwMTkyNDIwMjMtMDEtMDQyMDIzLTAxLTA0>\@\$E'
                : (index % 3 == 2)
                    ? 'New York'
                    : 'Los Angeles',
            "selected": false
          });

  bool get isRowCountApproximate => false;

  int get rowCount => _sourceData.length; //总行数

  int get selectedRowCount => _selectCount; //选中的行数

  DataRow getRow(int index) => DataRow.byIndex(index: index,
          //selected: _sourceData[index]["selected"],
          // onSelectChanged: (selected) {
          //   _sourceData[index]["selected"] = selected;
          //   notifyListeners();
          // },
          cells: [
            DataCell(Text("2021-01-05 11:19:02:33"), placeholder: true),
            DataCell(Text(_sourceData[index]['id'].toString()),
                placeholder: true),
            DataCell(Text(_sourceData[index]['name']), placeholder: true),
            DataCell(Text(_sourceData[index]['address'].toString()),
                placeholder: true)
          ]);

  //数据排序
  void sortData<T>(Comparable<T> getField(Map<String, dynamic> map), bool b) {
    _sourceData.sort((Map<String, dynamic> map1, Map<String, dynamic> map2) {
      if (!b) {
        //两个项进行交换
        final Map<String, dynamic> temp = map1;
        map1 = map2;
        map2 = temp;
      }
      final Comparable<T> s1Value = getField(map1);
      final Comparable<T> s2Value = getField(map2);
      return Comparable.compare(s1Value, s2Value);
    });
    notifyListeners();
  }

  void selectAll(bool checked) {
    _sourceData.forEach((data) => data["selected"] = checked);
    _selectCount = checked ? _sourceData.length : 0;
    notifyListeners(); //通知监听器去刷新
  }
}
