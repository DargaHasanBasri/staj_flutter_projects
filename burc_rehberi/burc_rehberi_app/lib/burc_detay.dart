import 'package:burc_rehberi_app/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({super.key, required this.secilenBurc});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRenk = Colors.pink;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    // performans artışı için yani bu projede buildlerin çakışmaması için kullanırız
    // bu projedeki işlem önce build yapsın çalışıyorsa bittikten sonra appBar için baskın renk bulur
    WidgetsBinding.instance.addPostFrameCallback((_) => appBarRenkBul());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          backgroundColor: appBarRenk,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("${widget.secilenBurc.burcAdi} Burcu ve Özellikleri"),
            centerTitle: true,
            background: Image.asset(
              'images/${widget.secilenBurc.burcBuyukResim}',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Text(
                widget.secilenBurc.burcDetayi,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        )
      ],
    ));
  }

  void appBarRenkBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage("images/${widget.secilenBurc.burcBuyukResim}"),
    );
    appBarRenk = _generator.dominantColor!.color;
    setState(() {});
  }
}
