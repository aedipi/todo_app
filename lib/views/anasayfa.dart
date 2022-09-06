import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/anasayfa_cubit.dart';
import 'package:todo_app/entity/yapilacaklar.dart';
import 'package:todo_app/views/yapilacak_is_detay_sayfa.dart';
import 'package:todo_app/views/yapilacak_is_kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().yapilacaklariYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(decoration: const InputDecoration(hintText: "Ara"),
          onChanged:(aramaSonucu){
            context.read<AnasayfaCubit>().ara(aramaSonucu);
          } ,)
            : const Text("Yapılacaklar"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
            });
            context.read<AnasayfaCubit>().yapilacaklariYukle();
          }, icon:const Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon:const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<Yapilacaklar>>(
        builder: (context,yapilacaklar){
          if (yapilacaklar.isNotEmpty){
            return ListView.builder(
              itemCount: yapilacaklar.length,
              itemBuilder: (context,index){
                var yapilacak = yapilacaklar[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => YapilacakIsDetaySayfa(yapilacak: yapilacak)))
                        .then((value) {context.read<AnasayfaCubit>().yapilacaklariYukle();});
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(yapilacak.yapilacak_is),
                        ),
                        const Spacer(),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${yapilacak.yapilacak_is} silinsin mi"),
                              action: SnackBarAction(
                                label: "EVET",
                                onPressed: (){
                                  context.read<AnasayfaCubit>().sil(yapilacak.yapilacak_id);
                                },
                              ),
                            ),
                          );
                        }, icon: Icon(Icons.delete_outline_rounded)),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const YapilacakIsKayitSayfa()))
              .then((value) { context.read<AnasayfaCubit>().yapilacaklariYukle(); } );
        },
      ),
    );
  }
}
