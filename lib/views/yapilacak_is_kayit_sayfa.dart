import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/yapilacak_is_kayit_sayfa_cubit.dart';

class YapilacakIsKayitSayfa extends StatefulWidget {
  const YapilacakIsKayitSayfa({Key? key}) : super(key: key);

  @override
  State<YapilacakIsKayitSayfa> createState() => _YapilacakIsKayitSayfaState();
}

class _YapilacakIsKayitSayfaState extends State<YapilacakIsKayitSayfa> {
  var tfYapilacakIs = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yapılacak İş Kayıt"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfYapilacakIs,decoration: const InputDecoration(hintText: "Yapılacak İş"),),
              ElevatedButton(onPressed: (){
                context.read<YapilacakIsKayitSayfaCubit>().kayit(tfYapilacakIs.text);
              }, child: const Text("KAYDET")),
            ],
          ),
        ),
      ),
    );
  }
}
