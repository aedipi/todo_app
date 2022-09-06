import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/entity/yapilacaklar.dart';
import 'package:todo_app/repo/yapilacaklardao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yapilacaklar>> {
  AnasayfaCubit():super(<Yapilacaklar>[]);

  var yrepo = YapilacaklarDaoRepository();

  Future<void> yapilacaklariYukle() async {
    var liste = await yrepo.tumYapilacaklariAl();
    emit(liste);
  }

  Future<void> sil(int yapilacak_id) async {
    await yrepo.yapilacakSil(yapilacak_id);
    await yapilacaklariYukle();
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await yrepo.yapilacakAra(aramaKelimesi);
    emit(liste);
  }

}