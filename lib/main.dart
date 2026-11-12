import 'package:flutter/material.dart';

void main() {
  runApp(const VeAiApp());
}

class VeAiApp extends StatelessWidget {
  const VeAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VêAí',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF101010),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pagina = 0;
  final busca = TextEditingController();

  final videos = [
    'Conheça o mundo do VêAí!',
    'Os vídeos mais legais estão aqui',
    'Diversão para todos',
    'Novidades e entretenimento',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF101010),
        title: const Row(
          children: [
            Icon(Icons.play_circle_fill, color: Colors.red, size: 32),
            SizedBox(width: 8),
            Text(
              'VêAí',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: VideoSearch(videos),
              );
            },
          ),
          const Icon(Icons.account_circle, size: 30),
          const SizedBox(width: 12),
        ],
      ),
      body: IndexedStack(
        index: pagina,
        children: [
          inicio(),
          explorar(),
          publicar(),
          perfil(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pagina,
        onTap: (i) => setState(() => pagina = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF202020),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explorar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Publicar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Widget inicio() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        const Text(
          'Bem-vindo ao VêAí!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Assista, descubra e compartilhe vídeos.',
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 20),
        ...videos.map((video) => videoCard(video)),
      ],
    );
  }

  Widget explorar() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Explorar vídeos',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        ...videos.map((video) => videoCard(video)),
      ],
    );
  }

  Widget videoCard(String titulo) {
    return Card(
      color: const Color(0xFF252525),
      margin: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 190,
            width: double.infinity,
            color: const Color(0xFF333333),
            child: const Icon(
              Icons.play_circle_fill,
              color: Colors.red,
              size: 75,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Canal VêAí • Vídeo demonstrativo',
                  style: TextStyle(color: Colors.white60),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up_alt_outlined),
                    ),
                    const Text('Curtir'),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_outlined),
                    ),
                    const Text('Comentar'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget publicar() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.video_call, color: Colors.red, size: 75),
          SizedBox(height: 15),
          Text(
            'Publique seus vídeos',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Entre na sua conta para publicar.',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget perfil() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_circle, size: 85, color: Colors.red),
          SizedBox(height: 15),
          Text(
            'Meu canal VêAí',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('Seu espaço de vídeos começa aqui!'),
        ],
      ),
    );
  }
}

class VideoSearch extends SearchDelegate<String> {
  final List<String> videos;

  VideoSearch(this.videos);

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, ''),
      );

  @override
  Widget buildResults(BuildContext context) {
    return resultados();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return resultados();
  }

  Widget resultados() {
    final encontrados = videos
        .where((v) => v.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: encontrados
          .map((v) => ListTile(
                leading: const Icon(Icons.play_circle_fill, color: Colors.red),
                title: Text(v),
              ))
          .toList(),
    );
  }
} 
