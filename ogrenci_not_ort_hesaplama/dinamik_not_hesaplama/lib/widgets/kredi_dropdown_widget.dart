import 'package:dinamik_not_hesaplama/constants/app_constants.dart';
import 'package:dinamik_not_hesaplama/helper/data_helper.dart';
import 'package:flutter/material.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropdownWidget({super.key, required this.onKrediSecildi});

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenKrediDegeri = 1;
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
        value: secilenKrediDegeri,
        items: DataHelper.tumDerslerinKredileri(),
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri = deger!;
            widget.onKrediSecildi(deger);
          });
        },
      ),
    );
  }
}
