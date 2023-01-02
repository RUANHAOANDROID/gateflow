import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/HardwareInfo.dart';
import '../../../responsive.dart';
import 'hardware_info_card.dart';

class HardwareList extends StatefulWidget {
  final List<HardwareInfo> hardwares;

  const HardwareList({
    Key? key,
    required this.hardwares,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HardwareList();
}

class _HardwareList extends State<HardwareList> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: HardwareInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
            hardwares: widget.hardwares,
          ),
          tablet: HardwareInfoCardGridView(
            hardwares: widget.hardwares,
          ),
          desktop: HardwareInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
            hardwares: widget.hardwares,
          ),
        ),
      ],
    );
  }
}

class HardwareInfoCardGridView extends StatefulWidget {
  final List<HardwareInfo> hardwares;

  HardwareInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
    required this.hardwares,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  State<StatefulWidget> createState() => _HardwareInfoCardGridView();
}

class _HardwareInfoCardGridView extends State<HardwareInfoCardGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: hardwareInfoList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: widget.childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          HardwareInfoCard(info: widget.hardwares[index]),
    );
  }
}
