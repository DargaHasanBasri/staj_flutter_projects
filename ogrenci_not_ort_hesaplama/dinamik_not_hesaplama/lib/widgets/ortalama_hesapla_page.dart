import 'package:dinamik_not_hesaplama/constants/app_constants.dart';
import 'package:dinamik_not_hesaplama/helper/data_helper.dart';
import 'package:dinamik_not_hesaplama/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenDeger = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.titleText,
            style: Sabitler.titleStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              const Expanded(
                flex: 1,
                child: OrtalamaGoster(ortalama: 4.21313, dersSayisi: 2),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: const Text('Liste buraya gelecek'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildHarfler(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_box),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_box),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Matematik',
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
        ),
        filled: true,
        fillColor: Sabitler.mainColor.shade100.withOpacity(0.3),
      ),
    );
  }

  Container _buildHarfler() {
    return Container(
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.mainColor.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        underline: Container(),
        elevation: 16,
        iconEnabledColor: Sabitler.mainColor.shade200,
        value: secilenDeger,
        items: DataHelper.tumDerslerinHarfleri(),
        onChanged: (deger) {
          setState(() {
            secilenDeger = deger!;
          });
        },
      ),
    );
  }
}
