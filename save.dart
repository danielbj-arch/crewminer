import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridScreen(),
  ));
}

class GridScreen extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"id": "1", "name": "Miner A1", "image": "https://via.placeholder.com/150", "th": "100 TH/s", "kw": "3.2 kW"},
    {"id": "2", "name": "Miner B2", "image": "https://via.placeholder.com/150", "th": "120 TH/s", "kw": "3.5 kW"},
    {"id": "3", "name": "Miner C3", "image": "https://via.placeholder.com/150", "th": "90 TH/s", "kw": "2.8 kW"},
    {"id": "4", "name": "Miner D4", "image": "https://via.placeholder.com/150", "th": "110 TH/s", "kw": "3.0 kW"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid View Example')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () => showDetails(context, item),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.network(item['image']!, fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(item['name']!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue.shade900)),
                          SizedBox(height: 5),
                          Text('${item['th']} • ${item['kw']}', style: TextStyle(color: Colors.grey.shade700)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
