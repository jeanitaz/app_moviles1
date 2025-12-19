import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: Principal()),
  );
}

const String jsonString = '''
{
    "peliculas": [
        {
            "id": 1,
            "nombre": "Jhon Wick 4",
            "descripcion": "El legendario asesino retirado vuelve a la acción impulsado por una incontrolable búsqueda de venganza. Al tener que luchar contra asesinos sedientos de sangre que le persiguen, la historia nos lleva a ver un lado más vulnerable del personaje.",
            "imagen": "https://images.justwatch.com/poster/304471076/s718/john-wick-4.jpg"
        },
        {
            "id": 2,
            "nombre": "Misión Imposible",
            "descripcion": "Ethan Hunt y su equipo del FMI se embarcan en su misión más peligrosa hasta la fecha: localizar, antes de que caiga en las manos equivocadas, una nueva y terrorífica arma que amenaza a toda la humanidad.",
            "imagen": "https://pics.filmaffinity.com/Misiaon_imposible_Sentencia_final-784079226-large.jpg"
        },
        {
            "id": 3,
            "nombre": "Fast and Furious",
            "descripcion": "La historia sigue a Brian O’Conner, un policía encubierto que se infiltra en el mundo de las carreras callejeras ilegales de Los Ángeles para investigar una serie de robos de camiones. Para lograrlo, se gana la confianza de Dominic Toretto, un carismático y respetado corredor que lidera una familia unida por la lealtad, la velocidad y el amor por los autos.",
            "imagen": "https://es.web.img2.acsta.net/pictures/14/02/25/10/54/307930.jpg"
        },
        {
            "id": 4,
            "nombre": "Dune: Part Two",
            "descripcion": "Paul Atreides se une a la tribu de los Fremen y comienza un viaje espiritual y marcial para convertirse en mesías, mientras intenta evitar el horrible pero inevitable futuro que ha presenciado.",
            "imagen": "https://filmartgallery.com/cdn/shop/files/Dune-Part-Two-Vintage-Movie-Poster-Original_6954c685.jpg?v=1762570975"
        },
        {
            "id": 5,
            "nombre": "The Dark Knight",
            "descripcion": "Cuando la amenaza conocida como el Joker causa estragos y el caos en la gente de Gotham, Batman debe aceptar una de las mayores pruebas psicológicas y físicas para luchar contra la injusticia.",
            "imagen": "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg"
        }
    ]
}
''';

class Pelicula {
  final int id;
  final String nombre;
  final String descripcion;
  final String imagen;

  Pelicula({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.imagen,
  });

  factory Pelicula.fromJson(Map<String, dynamic> json) {
    return Pelicula(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      imagen: json['imagen'],
    );
  }
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> parsedJson = jsonDecode(jsonString);
    final List<dynamic> jsonList = parsedJson['peliculas'];
    final List<Pelicula> listaPeliculas = jsonList
        .map((json) => Pelicula.fromJson(json))
        .toList();

    final List<Pelicula> peliculas80s = [
      Pelicula(
        id: 101,
        nombre: "Gladiator",
        descripcion:
            "Máximo, general de las legiones romanas, es querido por todos, incluso por el César Marco Aurelio, que antes de morir le elige como sucesor dejando de lado a su propio hijo Cómodo. Cómodo, movido por el odio, prepara una trama contra Máximo.",
        imagen:
            "https://es.web.img3.acsta.net/medias/nmedia/18/70/92/02/20149073.jpg",
      ),
      Pelicula(
        id: 102,
        nombre: "Terminator",
        descripcion:
            "Un cyborg asesino es enviado al pasado desde el año 2029 a 1984 para asesinar a Sarah Connor, cuyo hijo no nacido un día salvará a la humanidad de la extinción por parte de las máquinas.",
        imagen:
            "https://es.web.img3.acsta.net/pictures/16/02/12/15/14/218373.jpg",
      ),
      Pelicula(
        id: 103,
        nombre: "The Matrix",
        descripcion:
            "Thomas Anderson lleva una doble vida: de día es programador y de noche hacker bajo el alias de Neo. Su vida cambiará cuando Morfeo le ofrezca descubrir la verdad sobre la realidad: que el mundo tal como lo conoce es una simulación.",
        imagen:
            "https://static.wikia.nocookie.net/matrix/images/5/56/The_Matrix_digital_release_cover.jpg",
      ),
      Pelicula(
        id: 104,
        nombre: "Rambo",
        descripcion:
            "John Rambo, un veterano de la Guerra de Vietnam y ex miembro de las Fuerzas Especiales, llega a un pequeño pueblo buscando a un antiguo compañero de armas. Allí es hostigado y arrestado injustamente por el sheriff local, lo que despierta en él los traumas de la guerra que nunca logró superar.",
        imagen:
            "https://pics.filmaffinity.com/rambo_first_blood-572528533-large.jpg",
      ),
      Pelicula(
        id: 105,
        nombre: "Predator",
        descripcion:
            "Un grupo de soldados de élite liderados por Dutch (Arnold Schwarzenegger) es enviado a la selva de Centroamérica para rescatar a unos rehenes. Lo que comienza como una misión militar rutinaria pronto se convierte en una lucha por la supervivencia cuando el equipo es cazado uno por uno por una criatura extraterrestre altamente avanzada.",
        imagen:
            "https://es.web.img3.acsta.net/pictures/18/07/03/12/29/5387586.jpg",
      ),
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2A005C), Colors.black],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            // AppBar
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {},
              ),
              title: const Image(
                image: NetworkImage(
                  "https://i.postimg.cc/CMRYpVpL/Gemini-Generated-Image-45u1iq45u1iq45u1-removebg-preview.png",
                ),
                height: 80,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
              ],
              floating: true,
            ),

            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Continuar Viendo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: const Image(
                          image: NetworkImage(
                            "https://i.postimg.cc/Dy0xYCq1/imagen-2025-12-19-025635041.png",
                          ),
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.purple],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      const Text(
                        'Franquicias Taquilleras',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listaPeliculas.length,
                          itemBuilder: (context, index) {
                            final pelicula = listaPeliculas[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Sinopsis(pelicula: pelicula),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: MoviePoster(
                                  title: pelicula.nombre,
                                  imageUrl: pelicula.imagen,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        'Películas de Acción de los 80’s',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Las series que el mundo aprendió a amar están aquí!',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 16),

                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: peliculas80s.length,
                          itemBuilder: (context, index) {
                            final pelicula = peliculas80s[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Sinopsis(pelicula: pelicula),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: MoviePoster(
                                  title: pelicula.nombre,
                                  imageUrl: pelicula.imagen,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String title;
  final String imageUrl;

  const MoviePoster({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            imageUrl,
            height: 150,
            width: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 100,
                height: 150,
                color: Colors.grey[800],
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.broken_image, color: Colors.white)],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 100,
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class Sinopsis extends StatelessWidget {
  final Pelicula pelicula;

  const Sinopsis({super.key, required this.pelicula});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Image.network(
              pelicula.imagen,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Colors.grey[900]);
              },
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.9),
                    Colors.black,
                  ],
                  stops: const [0.0, 0.4, 0.7, 1.0],
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.45),

                    Text(
                      pelicula.nombre,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.0,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          label: const Text(
                            "Reproducir",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.download, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    const Text(
                      "Sinopsis",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      pelicula.descripcion,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
