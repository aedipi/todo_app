import 'package:todo_app/entity/yapilacaklar.dart';
import 'package:todo_app/sqlite/veritabani_yardimcisi.dart';

class YapilacaklarDaoRepository {
  Future<void> yapilacakKayit(String yapilacak_is) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["yapilacak_is"] = yapilacak_is;
    await db.insert("yapilacaklar", bilgiler);
  }

  Future<List<Yapilacaklar>> tumYapilacaklariAl() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar");

    return List.generate(maps.length, (index){
      var satir = maps[index];
      return Yapilacaklar(yapilacak_id: satir["yapilacak_id"], yapilacak_is: satir["yapilacak_is"]);
    });

  }
  
  Future<void> yapilacakGuncelle(int yapilacak_id, String yapilacak_is) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["yapilacak_is"] = yapilacak_is;
    await db.update("yapilacaklar", bilgiler, where: "yapilacak_id = ?",whereArgs: [yapilacak_id]);
  }

  Future<void> yapilacakSil(int yapilacak_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("yapilacaklar",where: "yapilacak_id = ?",whereArgs: [yapilacak_id]);
  }

  Future<List<Yapilacaklar>> yapilacakAra(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM yapilacaklar WHERE yapilacak_is LIKE '%$aramaKelimesi%'");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Yapilacaklar(yapilacak_id: satir["yapilacak_id"],
          yapilacak_is: satir["yapilacak_is"]);
    });
  }
}