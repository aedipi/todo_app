import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/yapilacak_is_detay_sayfa_cubit.dart';
import 'package:todo_app/entity/yapilacaklar.dart';

class YapilacakIsDetaySayfa extends StatefulWidget {
  Yapilacaklar yapilacak;

  YapilacakIsDetaySayfa({required this.yapilacak});

  @override
  State<YapilacakIsDetaySayfa> createState() => _YapilacakIsDetaySayfaState();
}

class _YapilacakIsDetaySayfaState extends State<YapilacakIsDetaySayfa> {
  var tfYapilacakIs = TextEditingController();

  @override
  void initState() {
    super.initState();
    var yapilacak = widget.yapilacak;
    tfYapilacakIs.text = yapilacak.yapilacak_is;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yapılacak İş Detay"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfYapilacakIs,decoration: const InputDecoration(hintText: "Yapılacak İş"),),
              ElevatedButton(onPressed: (){
                context.read<YapilacakIsDetaySayfaCubit>().guncelle(widget.yapilacak.yapilacak_id, tfYapilacakIs.text);
              }, child: const Text("GÜNCELLE")),
            ],
          ),
        ),
      ),
    );
  }
}
