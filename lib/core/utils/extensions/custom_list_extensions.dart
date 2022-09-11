import 'dart:math';
extension CustomListExtensions on List{

  int randomIndex() => Random().nextInt(length);

  dynamic randomItem() => isNotEmpty ? this[Random().nextInt(length)] : null;

  RandomModel random(){
    int index = randomIndex();

    return RandomModel(index: index,item: this[index]);
  }
}

class RandomModel {
  int? index;
  dynamic item;

  RandomModel({this.index,this.item});

}

