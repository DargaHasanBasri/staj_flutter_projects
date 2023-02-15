import 'package:burc_rehberi_app/data/strings.dart';
import 'package:burc_rehberi_app/model/burc.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar = [];
  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
    print(tumBurclar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burç Listesi'),
      ),
      body: Center(
        child: Text('Burc Listesi Buraya Gelecek'),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    // veri kaynağımızda bulunan burçları alıp listeye ekliyoruz
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarih = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];

      // burc kucuk resimlerinin isimlerini elde ediyoruz
      // koc1.png için Koc ---- koc ----- koc1.png
      var burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';

      // burc buyuk resimlerinin isimlerini elde ediyoruz
      //koc_buyuk1.png
      var burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk${i + 1}.png';

      Burc eklenecekBurc =
          Burc(burcAdi, burcTarih, burcDetay, burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    // oluşan listeyi döndürüyor yukarıda da çağırıyoruz
    return gecici;
  }
}
