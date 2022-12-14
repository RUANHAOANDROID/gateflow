import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/HardwareInfo.dart';
import '../../../models/MyFiles.dart';
import '../../../responsive.dart';
import 'file_info_card.dart';

class MyFiles extends StatefulWidget {
  final List<HardwareInfo> hardwares;

  const MyFiles({
    Key? key,
    required this.hardwares,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyFiles();
}

class _MyFiles extends State<MyFiles> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
            hardwares: widget.hardwares,
          ),
          tablet: FileInfoCardGridView(
            hardwares: widget.hardwares,
          ),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
            hardwares: widget.hardwares,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatefulWidget {
  final List<HardwareInfo> hardwares;

  FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
    required this.hardwares,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  State<StatefulWidget> createState() => _FileInfoCardGridView();
}

class _FileInfoCardGridView extends State<FileInfoCardGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: widget.childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          FileInfoCard(info: widget.hardwares[index]),
    );
  }
}
