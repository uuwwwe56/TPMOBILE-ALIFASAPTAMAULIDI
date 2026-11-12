import 'package:flutter/material.dart';
import 'package:tugas6/detailPage.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> travelData;

  const HomePage({super.key, required this.travelData});

  // Fungsi untuk membuka halaman detail
  void bukaDetail(BuildContext context, Map<String, String> item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(item: item)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Katalog Wisata'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.view_agenda), text: 'ListView'),
              Tab(icon: Icon(Icons.grid_view), text: 'Grid View'),
            ],
          ),
        ),

        body: TabBarView(children: [buildListView(), buildGridView()]),
      ),
    );
  }

  // LIST VIEW
  Widget buildListView() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: travelData.length,
      itemBuilder: (context, index) {
        final item = travelData[index];

        return Card(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(10),

            leading: ClipRRect(
              child: Image.network(
                item['gambar']!,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
            ),

            title: Text(item['nama']!),
            subtitle: Text(item['lokasi']!),
            trailing: Icon(Icons.chevron_right_sharp),

            onTap: () {
              bukaDetail(context, item);
            },
          ),
        );
      },
    );
  }

  // GRID VIEW
  Widget buildGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: travelData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),

      itemBuilder: (context, index) {
        final item = travelData[index];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,

          child: InkWell(
            onTap: () {
              bukaDetail(context, item);
            },

            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(item['gambar']!, fit: BoxFit.cover),

                Positioned(
                  bottom: 12,
                  left: 12,
                  right: 12,
                  child: Text(
                    item['nama']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
