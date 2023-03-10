import 'package:dinamik_not_hesaplama/constants/app_constants.dart';
import 'package:dinamik_not_hesaplama/helper/data_helper.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;
  const DersListesi({super.key, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    List tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.mainColor,
                        child: Text(
                          (tumDersler[index].harfDegeri *
                                  tumDersler[index].krediDegeri)
                              .toStringAsFixed(0),
                        ),
                      ),
                      subtitle: Text(
                          '${tumDersler[index].krediDegeri} Kredi , Not Değeri ${tumDersler[index].harfDegeri}'),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
                child: Text(
              'Lütfen Ders Ekleyin',
              style: Sabitler.titleStyle,
            )),
          );
  }
}
