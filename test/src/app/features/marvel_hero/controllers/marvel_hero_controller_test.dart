import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_challenge/src/app/features/marvel_hero/controllers/marvel_hero_controller.dart';
import 'package:marvel_challenge/src/app/features/marvel_hero/vo/hero_vo.dart';
import 'package:marvel_challenge/src/domain/entities/data_entity.dart';
import 'package:marvel_challenge/src/domain/entities/thumbnail_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockMarvelHeroController extends Mock implements MarvelHeroController {}

void main() {
  late MarvelHeroController controller;

  setUp(() {
    controller = MockMarvelHeroController();
  });

  test('Converte um objeto entity para um View Object', () {
    final dataEntity = DataEntity(
      count: 4,
      limit: 4,
      offset: 0,
      total: 100,
    );
    when(() => controller.dataEntityToVO(dataEntity: dataEntity)).thenReturn(
      HeroVO(
        count: 4,
        limit: 4,
        offset: 0,
        total: 100,
      ),
    );
    final heroData = controller.dataEntityToVO(dataEntity: dataEntity);
    expect(heroData.count, 4);
  });

  test('concatena duas Strings para formar uma url válida', () {
    final thumbnailEntity = ThumbnailEntity(
        extension: 'jpg',
        path:
            'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available');

    when(() =>
        controller.generatorPahtImg(
            thumbnailEntity: thumbnailEntity)).thenReturn(
        'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg');
    final url = controller.generatorPahtImg(thumbnailEntity: thumbnailEntity);
    expect(url,
        'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg');
  });
}
