  import 'package:hive/hive.dart';
  import 'package:movie_search/domain/entity/hive/movie_hive/movie_hive.dart';
  import 'package:movie_search/util/constants.dart';

  class HiveService {
    final String _boxName = kMovieBox; // Имя бокса (хранилища данных)

    Future<Box<MovieHive>> get _box async =>
        await Hive.openBox<MovieHive>(_boxName); // Геттер для открытия бокса

    Future<List<MovieHive>> getAllMovies() async {
      var box = await _box; // Ожидание открытия бокса
      return box.values
          .toList(); // Возвращение всех объектов из бокса в виде списка
    }

    Future<void> updateDeck(int index, MovieHive movieHive) async {
      var box = await _box; // Ожидание открытия бокса
      await box.putAt(
          index, movieHive); // Обновление объекта по указанному индексу
    }

    // ИДЕТ ВМЕСТЕ:
    // ДОБАВЛЕНИЕ через put(dynamic key, E value) чтоб удалить
    // УДАЛЕНИЕ через delete(movieId) нужна проверка на наличие через
    // ПРОВЕРКА НАЛИЧИЯ ПО КЛЮЧУ containsKey(movieId);

    Future<void> addMovie(MovieHive movieHive) async {
      var box = await _box; // Ожидание открытия бокса
      // Добавление с УСТАНОВКОЙ ID автоматом от "0" через метод add(E value)
      // await box.add(movieHive);

      // Добавление с УСТАНОВКОЙ ID вручную через метод put(dynamic key, E value)
      await box.put(movieHive.id, movieHive);
    }

    Future<void> deleteMovie(int movieId) async {
      var box = await _box;
      await box.delete(movieId);
    }

    Future<bool> containsMovie(int movieId) async {
      var box = await _box;
      return box.containsKey(movieId);
    }
  }
