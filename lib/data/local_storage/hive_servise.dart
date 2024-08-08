import 'package:hive/hive.dart';
import 'package:movie_search/domain/entity/hive/movie_hive/movie_hive.dart';
import 'package:movie_search/util/constants.dart';

class HiveService {
  final String _boxName = kMovieBox; // Имя бокса (хранилища данных)

  Future<Box<MovieHive>> get _box async =>
      await Hive.openBox<MovieHive>(_boxName); // Геттер для открытия бокса

  // Создание
  Future<void> addMovie(MovieHive movieHive) async {
    var box = await _box; // Ожидание открытия бокса
    print('addMovie');
    //await box.add(movieHive); // Добавление объекта movieHive в бокс
    await box.put(movieHive.id, movieHive);
  }

  // Чтение
  Future<List<MovieHive>> getAllMovies() async {
    var box = await _box; // Ожидание открытия бокса
    return box.values
        .toList(); // Возвращение всех объектов из бокса в виде списка
  }

  // Обновление
  Future<void> updateDeck(int index, MovieHive movieHive) async {
    var box = await _box; // Ожидание открытия бокса
    await box.putAt(
        index, movieHive); // Обновление объекта по указанному индексу
  }

  //здесь ПОСЛЕДНЯЯ ТОЧКА ИЗМЕНЕНИЙ

  // Удаление
  Future<void> deleteMovie(int movieId) async {
    var box = await _box; // Ожидание открытия бокса
    print('deleteMovie');
    await box.delete(movieId); // Удаление объекта по указанному индексу
  }

  Future<bool> containsMovie(int movieId) async {
    var box = await _box;
    print('containsMovie');
    return box.containsKey(movieId);
  }
}
