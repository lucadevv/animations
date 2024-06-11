import 'package:flutter/material.dart';

class StarScreen extends StatefulWidget {
  const StarScreen({super.key});

  @override
  _StarScreenState createState() => _StarScreenState();
}

class _StarScreenState extends State<StarScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STAR'),
        backgroundColor: Colors.teal[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
                'https://example.com/your_image_url.jpg'), // Replace with your image URL
            SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              children: [
                _buildGridItem(Icons.account_balance_wallet, 'Recargar'),
                _buildGridItem(Icons.money_off, 'Retirar'),
                _buildGridItem(Icons.help, 'Ayuda'),
                _buildGridItem(Icons.group, 'Equipo'),
                _buildGridItem(Icons.download, 'Descargar aplicación'),
                _buildGridItem(Icons.history, 'Actividad'),
                _buildGridItem(Icons.people, 'Cooperación de agentes'),
                _buildGridItem(Icons.person_add, 'Invitar a amigos'),
              ],
            ),
            SizedBox(height: 20),
            _buildInfoCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Hogar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: 'Cuantificar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'Servicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'A mí',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 50),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildInfoCard() {
    return Card(
      color: Colors.teal[900],
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Comercio cuantitativo',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            SizedBox(height: 8),
            Text('Ingresos eficientes y estables',
                style: TextStyle(color: Colors.white70)),
            SizedBox(height: 20),
            Text('Invitar a amigos',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            SizedBox(height: 8),
            Text('Obtener ingresos', style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
