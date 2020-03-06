class Movie{
  final int id;
  final String image;
  final String title;
  final double rating;  
  final String directorName;
  final String movieCountry;

    Movie({this.id, this.image, this.title, this.rating, this.directorName, this.movieCountry});
    
    

    Future<List<Movie>> getFilmes() async {
    try {
      List<Movie> listFilmes = List();
      return listFilmes;
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }

}

List<Movie> movies = [
  Movie(
    id: 1,
    image: "images/dragonheart_vengeance.jpg",
    title: "Dragonheart: Vengeance",
    rating: 6,
    directorName: "Ivan Silvestrini",
    movieCountry: "United States"
  ),
  Movie(
    id: 2,
    image: "images/sonic.jpg",
    title: "Sonic: O Filme",
    rating: 7.2,
    directorName: "Jeff Fowler",
    movieCountry: "United States"
  ),
  Movie(
    id: 3,
    image: "images/aves_de_rapina.jpg",
    title: "Aves de Rapina",
    rating: 6,
    directorName: "Cathy Yan",
    movieCountry: "United States"
  ),
  Movie(
    id: 4,
    image: "images/o_homem_invisivel.jpg",
    title: "O Homem Invisível",
    rating: 7.5,
    directorName: "Leigh Whannell",
    movieCountry: "United States"
  ),    
  Movie(
    id: 5,
    image: "images/chamado_da_floresta.jpg",
    title: "O Chamado da Floresta",
    rating: 5.9,
    directorName: "Chris Sanders",
    movieCountry: "United States"
  )                      
];