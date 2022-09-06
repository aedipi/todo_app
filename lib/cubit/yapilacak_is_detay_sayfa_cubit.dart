import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/repo/yapilacaklardao_repository.dart';

class YapilacakIsDetaySayfaCubit extends Cubit<void> {
  YapilacakIsDetaySayfaCubit():super(0);

  var yrepo = YapilacaklarDaoRepository();

  Future<void> guncelle(int yapilacak_id, String yapilacak_is) async {
    await yrepo.yapilacakGuncelle(yapilacak_id, yapilacak_is);
  }

}