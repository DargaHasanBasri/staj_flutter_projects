import 'package:dinamik_not_hesaplama/constants/app_constants.dart';
import 'package:dinamik_not_hesaplama/helper/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropdownWidget({super.key, required this.onHarfSecildi});

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarfDegeri = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.mainColor.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        underline: Container(),
        elevation: 16,
        iconEnabledColor: Sabitler.mainColor.shade200,
        value: secilenHarfDegeri,
        items: DataHelper.tumDerslerinHarfleri(),
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!;
            widget.onHarfSecildi(secilenHarfDegeri);
          });
        },
      ),
    );
  }
}
