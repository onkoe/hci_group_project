import 'package:flutter/material.dart';

void main() {
  runApp(const SpotifyDesktopApp());
}

class SpotifyDesktopApp extends StatelessWidget {
  const SpotifyDesktopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Desktop',
      debugShowCheckedModeBanner: false,
      home: const SpotifyHomePage(),
    );
  }
}

class SpotifyHomePage extends StatelessWidget {
  const SpotifyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                Sidebar(),
                Expanded(child: MainContent()),
              ],
            ),
          ),
          MiniPlayer(),
        ],
      ),
    );
  }
}


class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.black87,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SidebarItem(icon: Icons.home, label: 'Home'),
          SidebarItem(icon: Icons.search, label: 'Search'),
          SidebarItem(icon: Icons.library_music, label: 'Library'),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const SidebarItem({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar( // Adds a scrollbar for desktop visibility
      thumbVisibility: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SectionTitle('Recently Played'),
            HorizontalAlbumList(),
            SectionTitle('Made for You'),
            HorizontalAlbumList(),
            SectionTitle('New Releases'),
            HorizontalAlbumList(),
            SectionTitle('Top Picks'),
            HorizontalAlbumList(),
            SectionTitle('Podcasts'),
            HorizontalAlbumList(),
          ],
        ),
      ),
    );
  }
}

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.grey[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.grey[700],
            ),
            const SizedBox(width: 10),
            const Text("Track Title", style: TextStyle(color: Colors.white)),
          ]),
          Row(
            children: const [
              Icon(Icons.skip_previous, color: Colors.white),
              SizedBox(width: 20),
              Icon(Icons.play_arrow, color: Colors.white),
              SizedBox(width: 20),
              Icon(Icons.skip_next, color: Colors.white),
            ],
          ),
          Icon(Icons.volume_up, color: Colors.white),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}

class HorizontalAlbumList extends StatelessWidget {
  const HorizontalAlbumList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 5),
                Text('Playlist $index', style: const TextStyle(color: Colors.white)),
              ],
            ),
          );
        },
      ),
    );
  }
}



