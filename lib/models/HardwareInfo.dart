import 'dart:ui';
import '../constants.dart';

class HardwareInfo {
  final String? svgSrc, title;
  String? total;
  int? percentage;
  String? used;
  final Color? color;

  HardwareInfo({
    this.svgSrc,
    this.title,
    this.total,
    this.used,
    this.percentage,
    this.color,
  });
}

List<HardwareInfo> hardwareInfoList = [
  HardwareInfo(
    title: "磁盘状态",
    used: "160GB",
    svgSrc: "assets/icons/ssd.svg",
    total: "250GB",
    color: primaryColor,
    percentage: 35,
  ),
  HardwareInfo(
    title: "CPU使用率",
    used: "2.1Mhz",
    svgSrc: "assets/icons/cpu.svg",
    total: "2.9Mhz",
    color: Color(0xFFFFA113),
    percentage: 24,
  ),
  HardwareInfo(
    title: "内存状态",
    used: "11GB",
    svgSrc: "assets/icons/mmy.svg",
    total: "16GB",
    color: Color(0xFFA4CDFF),
    percentage: 70,
  ),
  HardwareInfo(
    title: "日志量",
    used: "0.1GB",
    svgSrc: "assets/icons/drop_box.svg",
    total: "1GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
