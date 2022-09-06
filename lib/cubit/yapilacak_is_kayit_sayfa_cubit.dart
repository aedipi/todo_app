import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/repo/yapilacaklardao_repository.dart';

class YapilacakIsKayitSayfaCubit extends Cubit<void> {
  YapilacakIsKayitSayfaCubit():super(0);

  var yrepo = YapilacaklarDaoRepository();

  Future<void> kayit(String yapilacak_is) async {
    await yrepo.yapilacakKayit(yapilacak_is);
  }
}