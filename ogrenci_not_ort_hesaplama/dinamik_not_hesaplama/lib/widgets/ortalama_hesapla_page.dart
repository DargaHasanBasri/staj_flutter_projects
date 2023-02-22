import 'package:dinamik_not_hesaplama/constants/app_constants.dart';
import 'package:dinamik_not_hesaplama/helper/data_helper.dart';
import 'package:dinamik_not_hesaplama/model/ders.dart';
import 'package:dinamik_not_hesaplama/widgets/ders_listesi.dart';
import 'package:dinamik_not_hesaplama/widgets/harf_dropdown_widget.dart';
import 'package:dinamik_not_hesaplama/widgets/kredi_dropdown_widget.dart';
import 'package:dinamik_not_hesaplama/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    dersSayisi: DataHelper.tumEklenenDersler.length,
                    ortalama: DataHelper.ortalamaHesapla()),
              ),
            ],
          ),
          Expanded(
            child: DersListesi(
              onDismiss: (index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
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
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: HarfDropdownWidget(
                    onHarfSecildi: (harf) {
                      secilenHarfDegeri = harf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediDropdownWidget(
                    onKrediSecildi: (kredi) {
                      secilenKrediDegeri = kredi;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var eklenecekDers = Ders(
                        ad: girilenDersAdi,
                        harfDegeri: secilenHarfDegeri,
                        krediDegeri: secilenKrediDegeri);
                    DataHelper.dersEkle(eklenecekDers);
                    setState(() {});
                  }
                },
                icon: const Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.mainColor,
                iconSize: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Ders adı giriniz!';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Ders Giriniz',
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Sabitler.mainColor.shade100.withOpacity(0.3),
      ),
    );
  }
}
