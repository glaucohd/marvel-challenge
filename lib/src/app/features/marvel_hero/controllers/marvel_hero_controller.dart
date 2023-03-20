import 'package:flutter/material.dart';
import '../../../../core/routes.dart';
import '../../../../domain/entities/characters_entity.dart';
import '../../../../domain/entities/data_entity.dart';
import '../../../../domain/entities/thumbnail_entity.dart';

import '../../../../domain/usecases/get_characters_usecase.dart';
import '../vo/hero_vo.dart';

class MarvelHeroController extends ChangeNotifier {
  final GetCharactersUseCase getListCharacters;

  HeroVO heroVO = HeroVO();
  CharactersVO detailHero = CharactersVO();
  TextEditingController textController = TextEditingController();

  int totalPages = 0;
  int groupSize = 3;
  int itemsPerPage = 4;
  int currentPage = 1;
  int groupStart = 0;
  int groupEnd = 0;
  bool isLoading = false;

  MarvelHeroController({
    required this.getListCharacters,
  });

  Future<void> init() async {
    isLoading = true;
    final dataEntity = await getListCharacters(numberPage: 0);
    heroVO = dataEntityToVO(dataEntity: dataEntity);
    totalPages = ((heroVO.total ?? 0) / 4).ceil();
    isLoading = false;
    notifyListeners();
  }

  HeroVO dataEntityToVO({DataEntity? dataEntity}) {
    final hero = HeroVO(
        count: dataEntity?.count,
        limit: dataEntity?.limit,
        offset: dataEntity?.offset,
        total: dataEntity?.total,
        listCharacters: listEntityTolIstVo(
          listCharacters: dataEntity?.listCharacters,
        ));
    return hero;
  }

  List<CharactersVO>? listEntityTolIstVo({
    List<CharactersEntity>? listCharacters,
  }) {
    final listHero = listCharacters?.map((e) {
      return CharactersVO(
        description: e.description,
        id: e.id,
        name: e.name,
        thumbnailEntity: e.thumbnailEntity,
        pathImage: generatorPahtImg(thumbnailEntity: e.thumbnailEntity),
      );
    }).toList();

    return listHero ?? [];
  }

  String? generatorPahtImg({ThumbnailEntity? thumbnailEntity}) {
    String? path = thumbnailEntity?.path;
    String? extension = thumbnailEntity?.extension;
    return '$path.$extension';
  }

  Future<void> getHeroByLetter() async {
    var letterHero = textController.text;
    DataEntity dataEntity = DataEntity();

    if (letterHero.isNotEmpty) {
      dataEntity = await getListCharacters(
        name: letterHero,
        numberPage: 0,
      );
    } else {
      dataEntity = await getListCharacters(numberPage: 0);
    }

    heroVO = dataEntityToVO(dataEntity: dataEntity);
    currentPage = 1;

    notifyListeners();
  }

  Future<void> getHeroByOffset({required int numberPage}) async {
    isLoading = true;
    notifyListeners();
    final offset = numberPage - 1;

    DataEntity dataEntity = DataEntity();

    var letterHero = textController.text;
    if (letterHero.isNotEmpty) {
      dataEntity = await getListCharacters(
        numberPage: offset,
        name: letterHero,
      );
    } else {
      dataEntity = await getListCharacters(
        numberPage: offset,
      );
    }

    heroVO = dataEntityToVO(dataEntity: dataEntity);
    totalPages = ((heroVO.total ?? 0) / 4).ceil();
    isLoading = false;
    notifyListeners();
  }

  void startBottonNavigator() {
    totalPages = ((heroVO.total ?? 0) / itemsPerPage).ceil();
    groupStart = ((currentPage - 1) ~/ groupSize) * groupSize + 1;
    groupEnd = groupStart + groupSize - 1;
  }

  void navigateGotoDetailPage({
    required CharactersVO hero,
    required BuildContext context,
  }) {
    detailHero = CharactersVO(
      description: hero.description,
      name: hero.name,
      pathImage: hero.pathImage,
    );
    Navigator.pushNamed(
      context,
      Routes.detail,
    );
  }

  void increment() {
    currentPage++;
    notifyListeners();
  }

  void decrement() {
    currentPage--;
    notifyListeners();
  }

  void changePage({required int index}) {
    currentPage = index;
    getHeroByOffset(numberPage: index);
    notifyListeners();
  }
}
