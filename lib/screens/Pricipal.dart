import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:app_moviles1/screens/ReproductorScreen.dart';
import 'perfil.dart';

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
            "imagen": "https://images.justwatch.com/poster/304471076/s718/john-wick-4.jpg",
            "videoUrl": "https://www.dropbox.com/scl/fi/3xewfli4129ar3uy8ff3x/peliculajhonwick.mp4?rlkey=wdfqa164ikdpvpdm7ofkuk5ii&st=wfq1yckr&raw=1",
            "trailerUrl": "https://www.dropbox.com/scl/fi/ff9l5nv5u40ekbr7e1eq5/trailerJhonWick.mp4?rlkey=3vw8q34xc28pzn6mtom4in0fh&st=8tdvn6xa&raw=1",
            "anio": "2023",
            "duracion": "2h 49m",
            "genero": "Acción",
            "reparto": [
                {"nombre": "Keanu Reeves", "foto": "https://i.postimg.cc/8PXTrTxm/imagen-2025-12-31-040752835.png"},
                {"nombre": "Donnie Yen", "foto": "https://i.postimg.cc/pdxcWFkj/imagen-2025-12-31-041047966.png"},
                {"nombre": "Bill Skarsgård", "foto": "https://i.postimg.cc/4N9Wp5SS/imagen-2025-12-31-041133917.png"},
                {"nombre": "Lance Reddick", "foto": "https://i.postimg.cc/7PCFQSRC/imagen-2025-12-31-041224086.png"},
                {"nombre": "Ian McShane", "foto": "https://i.postimg.cc/CKQvjQS7/imagen-2025-12-31-041408973.png"}
            ]
        },
        {
            "id": 2,
            "nombre": "Misión Imposible",
            "descripcion": "Ethan Hunt y su equipo del FMI se embarcan en su misión más peligrosa hasta la fecha: localizar, antes de que caiga en las manos equivocadas, una nueva y terrorífica arma que amenaza a toda la humanidad.",
            "imagen": "https://pics.filmaffinity.com/Misiaon_imposible_Sentencia_final-784079226-large.jpg",
            "videoUrl": "https://www.dropbox.com/scl/fi/rrbvnq3egxv03vbtsd3km/misionimposiblepelicula.mp4?rlkey=v2ntnztz9r4hqsnlbltomq3ks&st=ugsazzcs&raw=1",
            "trailerUrl": "https://www.dropbox.com/scl/fi/onhahnfm8lovz8qvel0i3/misionimposibletrailer.mp4?rlkey=01kwlngffnjdhqoaowaqugdth&st=ulrix1l6&raw=1",
            "anio": "2023",
            "duracion": "2h 43m",
            "genero": "Espionaje",
            "reparto": [
                {"nombre": "Tom Cruise", "foto": "https://i.postimg.cc/TwxKHRdm/imagen-2025-12-31-041638109.png"},
                {"nombre": "Hayley Atwell", "foto": "https://i.postimg.cc/9MyGr8MG/imagen-2025-12-31-041539839.png"},
                {"nombre": "Ving Rhames", "foto": "https://i.postimg.cc/KjJ3MdyT/imagen-2025-12-31-041611397.png"}
            ]
        },
        {
            "id": 3,
            "nombre": "Fast and Furious",
            "descripcion": "La historia sigue a Brian O’Conner, un policía encubierto que se infiltra en el mundo de las carreras callejeras ilegales de Los Ángeles para investigar una serie de robos de camiones. Para lograrlo, se gana la confianza de Dominic Toretto.",
            "imagen": "https://es.web.img2.acsta.net/pictures/14/02/25/10/54/307930.jpg",
            "videoUrl": "https://www.dropbox.com/scl/fi/4wrwdarbes2lmpoyh3gct/rapidosyfuriosospelicula.mp4?rlkey=4uz6m8hl0g5uhrtdraogiitda&st=09dt9f0c&raw=1",
            "trailerUrl": "https://www.dropbox.com/scl/fi/wmver35lavw28ez5yn1jb/rapidosyfuriosostrailer.mp4?rlkey=bfmox89ok0jfis0sw18nkr20k&st=dr8vj348&raw=1",
            "anio": "2001",
            "duracion": "1h 46m",
            "genero": "Carreras",
            "reparto": [
                {"nombre": "Vin Diesel", "foto": "https://i.postimg.cc/wMGTHHpk/imagen-2025-12-31-041734133.png"},
                {"nombre": "Paul Walker", "foto": "https://i.postimg.cc/YCgqcJyW/imagen-2025-12-31-041800926.png"},
                {"nombre": "Michelle Rodriguez", "foto": "https://i.postimg.cc/T3rGNnpk/imagen-2025-12-31-041842789.png"}
            ]
        },
        {
            "id": 4,
            "nombre": "Dune: Part Two",
            "descripcion": "Paul Atreides se une a la tribu de los Fremen y comienza un viaje espiritual y marcial para convertirse en mesías, mientras intenta evitar el horrible pero inevitable futuro que ha presenciado.",
            "imagen": "https://filmartgallery.com/cdn/shop/files/Dune-Part-Two-Vintage-Movie-Poster-Original_6954c685.jpg?v=1762570975",
            "videoUrl": "https://www.dropbox.com/scl/fi/e3v3rcecqyp2hvnn4rrgf/duna2pelicula.mp4?rlkey=6px8z5c5kmnyuiyrekuyu56ve&st=k0rve6eu&raw=1",
            "trailerUrl": "https://www.dropbox.com/scl/fi/yygw6ikgpsiwd133humw6/duna2trailer.mp4?rlkey=vwr410u8mk7azozdhzopn3uom&st=hyfhu6yq&raw=1",
            "anio": "2024",
            "duracion": "2h 46m",
            "genero": "Sci-Fi",
            "reparto": [
               {"nombre": "Timothée Chalamet", "foto": "https://i.postimg.cc/PNs91FbF/imagen-2025-12-31-041944453.png"},
               {"nombre": "Zendaya", "foto": "https://i.postimg.cc/sD5DqkL2/imagen-2025-12-31-041954460.png"},
               {"nombre": "Rebecca Ferguson", "foto": "https://i.postimg.cc/J0ZMwXp8/imagen-2025-12-31-042036669.png"}
            ]
        },
        {
            "id": 5,
            "nombre": "The Dark Knight",
            "descripcion": "Cuando la amenaza conocida como el Joker causa estragos y el caos en la gente de Gotham, Batman debe aceptar una de las mayores pruebas psicológicas y físicas para luchar contra la injusticia.",
            "imagen": "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg",
            "videoUrl": "https://www.dropbox.com/scl/fi/p1xoad0g1iwur6ild1r0m/thedarkpelicula.mp4?rlkey=bwkx2xul2lrf7jzpr7qmvjogl&st=k1nvjwt2&raw=1",
            "trailerUrl": "https://www.dropbox.com/scl/fi/k8sm1eopehovy5o5u437h/thedarktrailer.mp4?rlkey=f8gdkalvp74p0zdfwjjsspay4&st=4rwvcnrh&raw=1",
            "anio": "2008",
            "duracion": "2h 32m",
            "genero": "Crimen",
            "reparto": [
                {"nombre": "Christian Bale", "foto": "https://i.postimg.cc/C5GTrgKK/imagen-2025-12-31-042127950.png"},
                {"nombre": "Heath Ledger", "foto": "https://i.postimg.cc/QxDr9H69/imagen-2025-12-31-042139053.png"},
                {"nombre": "Gary Oldman", "foto": "https://i.postimg.cc/jSd0cB0G/imagen-2025-12-31-042147228.png"}
            ]
        }
    ]
}
''';

class Actor {
  final String nombre;
  final String foto;

  Actor({required this.nombre, required this.foto});

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      nombre: json['nombre'] ?? "Actor",
      foto: json['foto'] ?? "",
    );
  }
}

class Pelicula {
  final int id;
  final String nombre;
  final String descripcion;
  final String imagen;
  final String videoUrl;
  final String trailerUrl;
  final String anio;
  final String duracion;
  final String genero;
  final List<Actor> reparto;

  Pelicula({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.imagen,
    this.videoUrl = "",
    this.trailerUrl = "",
    this.anio = "2024",
    this.duracion = "2h 00m",
    this.genero = "Acción",
    this.reparto = const [],
  });

  factory Pelicula.fromJson(Map<String, dynamic> json) {
    var list = json['reparto'] as List? ?? [];
    List<Actor> repartoList = list.map((i) => Actor.fromJson(i)).toList();

    return Pelicula(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      imagen: json['imagen'],
      videoUrl: json['videoUrl'] ?? "",
      trailerUrl: json['trailerUrl'] ?? "",
      anio: json['anio'] ?? "202X",
      duracion: json['duracion'] ?? "N/A",
      genero: json['genero'] ?? "General",
      reparto: repartoList,
    );
  }
}

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _paginaActual = 0;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> parsedJson = jsonDecode(jsonString);
    final List<dynamic> jsonList = parsedJson['peliculas'];
    final List<Pelicula> listaPeliculas =
        jsonList.map((json) => Pelicula.fromJson(json)).toList();

    final Pelicula peliculaDestacada =
        listaPeliculas.length > 3 ? listaPeliculas[3] : listaPeliculas[0];

    final List<Pelicula> peliculas80s = [
      Pelicula(
        id: 101,
        nombre: "Gladiator",
        anio: "2000",
        duracion: "2h 35m",
        genero: "Épico",
        descripcion: "Máximo, general de las legiones romanas...",
        imagen:
            "https://es.web.img3.acsta.net/medias/nmedia/18/70/92/02/20149073.jpg",
        videoUrl:
            "https://www.dropbox.com/scl/fi/3cswfoa17huep5eum2p4x/gladiatorpelicula.mp4?rlkey=lx4wuax2fkphmv8mvv4xa8cyx&st=wo0cdfnz&raw=1",
        trailerUrl:
            "https://www.dropbox.com/scl/fi/98spujs11vww6zd3bjqg6/gladiatortrailer.mp4?rlkey=ghi0j6b88f386n1xy476hrgpp&st=rjxlmyhk&raw=1",
        reparto: [
          Actor(
              nombre: "Russell Crowe",
              foto:
                  "https://i.postimg.cc/3JqCfDPX/imagen-2025-12-31-042459454.png"),
          Actor(
              nombre: "Joaquin Phoenix",
              foto:
                  "https://i.postimg.cc/YSKNMBrV/imagen-2025-12-31-042508518.png"),
          Actor(
              nombre: "Richard Harris",
              foto:
                  "https://i.postimg.cc/0NYYNXrf/imagen-2025-12-31-042516918.png")
        ],
      ),
      Pelicula(
        id: 102,
        nombre: "Terminator",
        anio: "1984",
        duracion: "1h 47m",
        genero: "Sci-Fi",
        descripcion: "Un cyborg asesino es enviado al pasado...",
        imagen:
            "https://es.web.img3.acsta.net/pictures/16/02/12/15/14/218373.jpg",
        videoUrl:
            "https://www.dropbox.com/scl/fi/ki7n9j6o8qqg7f5bnedc6/terminatorpelicula.mp4?rlkey=ahr30v592dm1mwt4buxp254z7&st=del8c2lf&raw=1",
        trailerUrl:
            "https://www.dropbox.com/scl/fi/9f8glewa6rd42ldnfq8oe/terminatortrailer.mp4?rlkey=jsea8acr5fyg643peaeg8gr4h&st=2x8lil4r&raw=1",
        reparto: [
          Actor(
              nombre: "Arnold S.",
              foto:
                  "https://i.postimg.cc/2yb313T9/imagen-2025-12-31-042719638.png"),
          Actor(
              nombre: "Linda Hamilton",
              foto:
                  "https://i.postimg.cc/PJgJYhRJ/imagen-2025-12-31-042726558.png"),
          Actor(
              nombre: "Michael B. Jordan",
              foto:
                  "https://i.postimg.cc/4NcmZ7Yf/imagen-2025-12-31-042734293.png")
        ],
      ),
      Pelicula(
        id: 103,
        nombre: "The Matrix",
        anio: "1999",
        duracion: "2h 16m",
        genero: "Sci-Fi",
        descripcion: "Thomas Anderson lleva una doble vida...",
        imagen:
            "https://static.wikia.nocookie.net/matrix/images/5/56/The_Matrix_digital_release_cover.jpg",
        videoUrl:
            "https://www.dropbox.com/scl/fi/ki7n9j6o8qqg7f5bnedc6/terminatorpelicula.mp4?rlkey=ahr30v592dm1mwt4buxp254z7&st=ykxaj0rl&raw=1",
        trailerUrl:
            "https://www.dropbox.com/scl/fi/9f8glewa6rd42ldnfq8oe/terminatortrailer.mp4?rlkey=jsea8acr5fyg643peaeg8gr4h&st=5u8h5imr&raw=1",
        reparto: [
          Actor(
              nombre: "Keanu Reeves",
              foto:
                  "https://i.postimg.cc/8PXTrTxm/imagen-2025-12-31-040752835.png"),
          Actor(
              nombre: "L. Fishburne",
              foto:
                  "https://i.postimg.cc/ZntC2pr6/imagen-2025-12-31-043134599.png"),
          Actor(
              nombre: "Carrie-Anne Moss",
              foto:
                  "https://i.postimg.cc/8CYFdqcb/imagen-2025-12-31-043125646.png")
        ],
      ),
      Pelicula(
        id: 104,
        nombre: "Rambo",
        anio: "1982",
        duracion: "1h 33m",
        genero: "Acción",
        descripcion: "John Rambo, un veterano de la Guerra de Vietnam...",
        imagen:
            "https://pics.filmaffinity.com/rambo_first_blood-572528533-large.jpg",
        videoUrl:
            "https://www.dropbox.com/scl/fi/i19sprdwsd27kdu4i2mwf/rambopelicula.mp4?rlkey=3zkjqcc8dzf2s6cvmbmusld7r&st=3s19x36g&raw=1",
        trailerUrl:
            "https://www.dropbox.com/scl/fi/jy1k4x2kq26ronaa3o15t/rambotrailer.mp4?rlkey=u3if5jp28tflwaxev9l4wqaai&st=bzdynehp&raw=1",
        reparto: [
          Actor(
              nombre: "S. Stallone",
              foto:
                  "https://i.postimg.cc/3RHhHBcK/imagen-2025-12-31-043510255.png"),
          Actor(
              nombre: "Buzz Feitshans",
              foto:
                  "https://i.postimg.cc/PxzjfwgN/imagen-2025-12-31-043517982.png"),
          Actor(
              nombre: "Richard Crenna",
              foto:
                  "https://i.postimg.cc/ZRFSYdGc/imagen-2025-12-31-043524494.png")
        ],
      ),
      Pelicula(
        id: 105,
        nombre: "Predator",
        anio: "1987",
        duracion: "1h 47m",
        genero: "Acción",
        descripcion: "Un grupo de soldados de élite liderados por Dutch...",
        imagen:
            "https://es.web.img3.acsta.net/pictures/18/07/03/12/29/5387586.jpg",
        videoUrl:
            "https://www.dropbox.com/scl/fi/d1w9l4z65qreldf22duwb/depredadorpelicula.mp4?rlkey=lppx4i3mt0u53bhmufnsnb41w&st=lyvmsbqd&raw=1",
        trailerUrl:
            "https://www.dropbox.com/scl/fi/6g2qgqt7oczjzzgrpwmx4/depredadortrailer.mp4?rlkey=5t54zynwncipncths643r17r4&st=ao0v3f5k&raw=1",
        reparto: [
          Actor(
              nombre: "Boyd Holbrook",
              foto:
                  "https://i.postimg.cc/vHP6Hgy0/imagen-2025-12-31-044452070.png"),
          Actor(
              nombre: "Olivia Munn",
              foto:
                  "https://i.postimg.cc/rwKRdVFp/imagen-2025-12-31-044501070.png"),
          Actor(
              nombre: "Jacob Tremblay",
              foto:
                  "https://i.postimg.cc/cJ3KmFnz/imagen-2025-12-31-044509943.png")
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black.withOpacity(0.0), Colors.black],
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black.withOpacity(0.9),
          selectedItemColor: const Color(0xFF8B5CF6),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: _paginaActual,
          onTap: (index) {
            if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            } else {
              setState(() => _paginaActual = index);
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.download), label: "Descargas"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black.withOpacity(0.5),
            floating: true,
            pinned: false,
            snap: true,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                "https://i.postimg.cc/CMRYpVpL/Gemini-Generated-Image-45u1iq45u1iq45u1-removebg-preview.png",
                fit: BoxFit.contain,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _textoMenu("Series"),
                _textoMenu("Películas"),
                _textoMenu("Categorías"),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.cast, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: _BannerDestacado(pelicula: peliculaDestacada),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              _TituloSeccion(titulo: "Franquicias Taquilleras"),
              _ListaHorizontal(peliculas: listaPeliculas),
              const SizedBox(height: 30),
              _TituloSeccion(titulo: "Top 10 en Ecuador hoy"),
              _ListaTop10(peliculas: listaPeliculas),
              const SizedBox(height: 30),
              _TituloSeccion(titulo: "Acción Clásica de los 80's"),
              _ListaHorizontal(peliculas: peliculas80s),
              const SizedBox(height: 100),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _textoMenu(String texto) {
    return Text(
      texto,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        shadows: [Shadow(color: Colors.black, blurRadius: 4)],
      ),
    );
  }
}

class _TituloSeccion extends StatelessWidget {
  final String titulo;
  const _TituloSeccion({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Text(
        titulo,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _BannerDestacado extends StatelessWidget {
  final Pelicula pelicula;
  const _BannerDestacado({required this.pelicula});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 500,
          width: double.infinity,
          child: Image.network(
            pelicula.imagen,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        Container(
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.2),
                Colors.black,
              ],
              stops: const [0.5, 0.8, 1.0],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                pelicula.genero.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white70,
                    letterSpacing: 2,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BotonVertical(icon: Icons.add, label: "Mi Lista"),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Sinopsis(pelicula: pelicula)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                    ),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text("Reproducir",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  _BotonVertical(
                    icon: Icons.info_outline,
                    label: "Info",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Sinopsis(pelicula: pelicula)),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BotonVertical extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _BotonVertical({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 5),
          Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    );
  }
}

class _ListaHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  const _ListaHorizontal({required this.peliculas});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: peliculas.length,
        itemBuilder: (context, index) {
          final pelicula = peliculas[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Sinopsis(pelicula: pelicula)));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              width: 110,
              child: Hero(
                tag: 'poster_${pelicula.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    pelicula.imagen,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(color: Colors.grey[900]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ListaTop10 extends StatelessWidget {
  final List<Pelicula> peliculas;
  const _ListaTop10({required this.peliculas});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: peliculas.length > 10 ? 10 : peliculas.length,
        itemBuilder: (context, index) {
          final pelicula = peliculas[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Sinopsis(pelicula: pelicula)));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 150,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    width: 110,
                    child: Hero(
                      tag: 'poster_top10_${pelicula.id}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          pelicula.imagen,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -10,
                    bottom: -20,
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(offset: Offset(2, 2), color: Colors.white),
                          Shadow(offset: Offset(-2, -2), color: Colors.white),
                          Shadow(offset: Offset(2, -2), color: Colors.white),
                          Shadow(offset: Offset(-2, 2), color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
    return Material(
      color: Colors.transparent,
      child: Column(
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
      ),
    );
  }
}

class Sinopsis extends StatefulWidget {
  final Pelicula pelicula;
  const Sinopsis({super.key, required this.pelicula});

  @override
  State<Sinopsis> createState() => _SinopsisState();
}

class _SinopsisState extends State<Sinopsis> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.pelicula.trailerUrl.isNotEmpty) {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.pelicula.trailerUrl),
      )..initialize().then((_) {
          setState(() {});
          _controller?.setLooping(true);
          _controller?.setVolume(0);
          _controller?.play();
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

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
            child: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: 'poster_${widget.pelicula.id}',
                  child: Image.network(
                    widget.pelicula.imagen,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: Colors.grey[900]);
                    },
                  ),
                ),
                if (_controller != null && _controller!.value.isInitialized)
                  FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller!.value.size.width,
                      height: _controller!.value.size.height,
                      child: VideoPlayer(_controller!),
                    ),
                  ),
              ],
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                    ),
                    Text(
                      widget.pelicula.nombre,
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
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          widget.pelicula.anio,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            "HD",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          widget.pelicula.duracion,
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          widget.pelicula.genero,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (widget.pelicula.videoUrl.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReproductorScreen(
                                  videoUrl: widget.pelicula.videoUrl,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Video no disponible"),
                              ),
                            );
                          }
                        },
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
                          minimumSize: const Size(double.infinity, 45),
                        ),
                      ),
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
                      widget.pelicula.descripcion,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _botonAccion(Icons.add, "Mi Lista"),
                        _botonAccion(Icons.thumb_up_alt_outlined, "Calificar"),
                        _botonAccion(Icons.share, "Compartir"),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 20),
                    const Text(
                      "Reparto",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.pelicula.reparto.length,
                        itemBuilder: (context, index) {
                          final actor = widget.pelicula.reparto[index];
                          return Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 80,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white10,
                                  backgroundImage: actor.foto.isNotEmpty
                                      ? NetworkImage(actor.foto)
                                      : null,
                                  child: actor.foto.isEmpty
                                      ? Text(
                                          actor.nombre[0],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : null,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  actor.nombre,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          );
                        },
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

  Widget _botonAccion(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}