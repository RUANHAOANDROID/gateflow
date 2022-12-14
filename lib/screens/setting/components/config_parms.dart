import 'package:flutter/material.dart';
import 'package:gateflow/models/config_respons_entity.dart';
import 'package:gateflow/screens/setting/components/row_form.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class ParamsConfig extends StatefulWidget {
  const ParamsConfig({
    Key? key,
    this.config,
    required this.saved,
    required this.formKey,
  }) : super(key: key);
  final ValueChanged<ConfigResponsData?> saved;
  final ConfigResponsData? config;
  final GlobalKey<FormState> formKey;

  @override
  State<StatefulWidget> createState() => _ConfigParams();
}

class _ConfigParams extends State<ParamsConfig> {
  @override
  Widget build(BuildContext context) {
    print("config parms build");
    print(widget.config);
    final TextEditingController f1Controller =
        TextEditingController(text: widget.config?.manufacturerId1);
    final TextEditingController f2Controller =
        TextEditingController(text: widget.config?.manufacturerId2);

    final TextEditingController cUrlController =
        TextEditingController(text: widget.config?.checkUrl);
    final TextEditingController vUrlController =
        TextEditingController(text: widget.config?.writeOffUrl);

    final TextEditingController tipNormalController =
        TextEditingController(text: widget.config?.deTrueVoice?.normal);
    final TextEditingController tipOtherController =
        TextEditingController(text: widget.config?.deTrueVoice?.other);

    final TextEditingController tipYear1Controller =
        TextEditingController(text: widget.config?.deTrueVoice?.yearCard1);
    final TextEditingController tipYear2Controller =
        TextEditingController(text: widget.config?.deTrueVoice?.yearCard2);

    final TextEditingController tipInvalidController =
        TextEditingController(text: widget.config?.deFalseVoice?.invalid);
    final TextEditingController tipUsedController =
        TextEditingController(text: widget.config?.deFalseVoice?.used);

    final TextEditingController tipErrorController =
        TextEditingController(text: widget.config?.deFalseVoice?.error);
    final TextEditingController tipOtherErrController =
        TextEditingController(text: widget.config?.deFalseVoice?.other);

    var container = Card(
        child: Padding(
      padding: defaultPaddingAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "???????????? ",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding / 2),
            child: Column(
              children: [
                RowFormField(
                  hite1: "????????????1",
                  hite2: "????????????2",
                  vc1: (value) {},
                  vc2: (value) {},
                  teController1: f1Controller,
                  teController2: f2Controller,
                ),
                RowFormField(
                  hite1: "????????????",
                  hite2: "????????????",
                  vc1: (value) {},
                  vc2: (value) {},
                  teController1: cUrlController,
                  teController2: vUrlController,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: Text(
              "  ???????????????????????? ",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding / 2),
            child: Column(
              children: [
                RowFormField(
                  hite1: "???????????????",
                  hite2: "???????????????",
                  vc1: (value) {
                    widget.config?.deTrueVoice?.normal = value;
                  },
                  vc2: (value) {
                    widget.config?.deTrueVoice?.other = value;
                  },
                  teController1: tipNormalController,
                  teController2: tipOtherController,
                ),
                RowFormField(
                  hite1: "??????1??????",
                  hite2: "??????2??????",
                  vc1: (value) {
                    widget.config?.deTrueVoice?.yearCard1 = value;
                  },
                  vc2: (value) {
                    widget.config?.deTrueVoice?.yearCard2 = value;
                  },
                  teController1: tipYear1Controller,
                  teController2: tipYear2Controller,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding / 2),
            child: Text(
              "  ???????????????????????? ",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding / 2),
            child: Column(
              children: [
                RowFormField(
                  hite1: "???????????????",
                  hite2: "???????????????",
                  vc1: (value) {
                    widget.config?.deFalseVoice?.invalid = value;
                  },
                  vc2: (value) {
                    widget.config?.deFalseVoice?.used = value;
                  },
                  teController1: tipInvalidController,
                  teController2: tipUsedController,
                ),
                RowFormField(
                  hite1: "????????????",
                  hite2: "????????????",
                  vc1: (value) {
                    widget.config?.deFalseVoice?.error = value;
                  },
                  vc2: (value) {
                    widget.config?.deFalseVoice?.other = value;
                  },
                  teController1: tipErrorController,
                  teController2: tipOtherErrController,
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                widget.saved(widget.config);
              },
              icon: const Icon(Icons.save),
              label: const Text("????????????"),
            ),
          ),
        ],
      ),
    ));
    return Form(key: widget.formKey, child: container);
  }
}
