import 'package:flutter/material.dart';

import '../constants.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int?  percentage;
  final String? numOfFiles;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "磁盘状态",
    numOfFiles: "160GB",
    svgSrc: "assets/icons/ssd.svg",
    totalStorage: "250GB",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "CPU使用率",
    numOfFiles: "2.1Mhz",
    svgSrc: "assets/icons/cpu.svg",
    totalStorage: "2.9Mhz",
    color: Color(0xFFFFA113),
    percentage: 60,
  ),
  CloudStorageInfo(
    title: "内存状态",
    numOfFiles: "11GB",
    svgSrc: "assets/icons/mmy.svg",
    totalStorage: "16GB",
    color: Color(0xFFA4CDFF),
    percentage: 70,
  ),
  CloudStorageInfo(
    title: "日志量",
    numOfFiles: "0.1GB",
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "1GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
