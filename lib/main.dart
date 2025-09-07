import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Actividad Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Lista de lenguajes con título, imagen y descripción
  final List<Map<String, String>> lenguajesInfo = [
    {
      "nombre": "Python",
      "imagen": "https://cdn.iconscout.com/icon/free/png-256/python-2-226051.png",
      "descripcion":
          "Python es un lenguaje de alto nivel, fácil de aprender y muy usado en IA, ciencia de datos y desarrollo web."
    },
    {
      "nombre": "Java",
      "imagen": "https://cdn.iconscout.com/icon/free/png-256/java-60-1174953.png",
      "descripcion":
          "Java es un lenguaje orientado a objetos, muy popular en aplicaciones empresariales y móviles (Android)."
    },
    {
      "nombre": "C++",
      "imagen": "https://cdn.iconscout.com/icon/free/png-256/c-4-226082.png",
      "descripcion":
          "C++ es potente para videojuegos, sistemas operativos y software de alto rendimiento."
    },
    {
      "nombre": "C#",
      "imagen": "https://cdn.iconscout.com/icon/free/png-256/csharp-1-1175241.png",
      "descripcion":
          "C# es usado principalmente en el ecosistema de Microsoft y en el desarrollo de videojuegos con Unity."
    },
    {
      "nombre": "JavaScript",
      "imagen":
          "https://cdn.iconscout.com/icon/free/png-256/javascript-1-225993.png",
      "descripcion":
          "JavaScript es el lenguaje de la web, usado para crear aplicaciones interactivas en navegadores."
    },
    {
      "nombre": "TypeScript",
      "imagen":
          "https://cdn.iconscout.com/icon/free/png-256/typescript-1174965.png",
      "descripcion":
          "TypeScript es un superconjunto de JavaScript que añade tipado estático y mejora la mantenibilidad del código."
    },
    {
      "nombre": "PHP",
      "imagen": "https://cdn.iconscout.com/icon/free/png-256/php-27-226042.png",
      "descripcion":
          "PHP es muy usado para el desarrollo de aplicaciones web dinámicas y gestión de servidores."
    },
    {
      "nombre": "Kotlin",
      "imagen": "https://cdn.iconscout.com/icon/free/png-256/kotlin-283155.png",
      "descripcion":
          "Kotlin es el lenguaje oficial para el desarrollo de aplicaciones Android, moderno y seguro."
    },
    {
      "nombre": "Swift",
      "imagen": "https://cdn.iconscout.com/icon/free/png-256/swift-13-555610.png",
      "descripcion":
          "Swift es el lenguaje de Apple para crear aplicaciones en iOS y macOS."
    },
    {
      "nombre": "Dart",
      "imagen":
          "https://cdn.iconscout.com/icon/free/png-256/flutter-2038877-1720090.png",
      "descripcion":
          "Dart es el lenguaje detrás de Flutter, ideal para crear aplicaciones multiplataforma con una sola base de código."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actividad Flutter"),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Presionaste el botón de información")),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Presionaste el botón de ajustes")),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menú de Navegación",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              title: Text("Ver Lista"),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Ver CardView"),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _selectedIndex == 0 ? _buildLista() : _buildCardView(),
    );
  }

  // Vista de la lista simple con nombres de lenguajes
  Widget _buildLista() {
    return ListView.builder(
      itemCount: lenguajesInfo.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.code),
          title: Text(lenguajesInfo[index]["nombre"]!),
        );
      },
    );
  }

  // Vista de las cards con imagen, título y descripción
  Widget _buildCardView() {
    return ListView.builder(
      itemCount: lenguajesInfo.length,
      itemBuilder: (context, index) {
        final lenguaje = lenguajesInfo[index];
        return Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Image.network(lenguaje["imagen"]!, height: 80),
                SizedBox(height: 10),
                Text(
                  lenguaje["nombre"]!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  lenguaje["descripcion"]!,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
