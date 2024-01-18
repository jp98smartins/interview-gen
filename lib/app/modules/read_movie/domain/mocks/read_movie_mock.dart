import 'package:marvel/app/modules/list_movies/domain/entities/movie_entity.dart';

sealed class ReadMovieMock {
  static MovieEntity get movie {
    return MovieEntity(
      genres: ["Ação", "Aventura", "Ficção científica"],
      id: 1771,
      originalTitle: "Captain America: The First Avenger",
      overview:
          "Steve Rogers é um jovem que participa de experiências visando a criação do supersoldado americano. Quando os oficiais militares conseguem transformá-lo em uma arma humana, eles percebem que não podem arriscar a vida do jovem nas batalhas de guerra.",
      poster: "/xYijVAPunk6neVW2KHKE4Lp45ZU.jpg",
      releaseDate: DateTime(2011, 07, 22),
      title: "Capitão América: O Primeiro Vingador",
      voteAverage: 7.0,
    );
  }
}
