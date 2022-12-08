import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "人次总览",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            svgSrc: "assets/icons/passed.svg",
            title: "青云山主山门",
            amountOfFiles: "500",
            numOfFiles: "在线",
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/passed.svg",
            title: "青云山东门",
            amountOfFiles: "400",
            numOfFiles: "在线",
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/passed.svg",
            title: "青云山西门",
            amountOfFiles: "234",
            numOfFiles: "在线",
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/passed.svg",
            title: "青云山北门",
            amountOfFiles: "100",
            numOfFiles: "在线",
          ),
        ],
      ),
    );
  }
}
