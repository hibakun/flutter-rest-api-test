import 'package:flutter/material.dart';
import 'package:rest_api_test/services/remote_service.dart';
import 'package:rest_api_test/widgets/item_siswa.dart';
import '../models/siswa.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Siswa? siswa;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<void> getData() async {
    siswa = await RemoteService().getData();
    if (siswa != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest API"),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: siswa?.data.length,
          itemBuilder: (context, index) {
            return ItemSiswa(nama: siswa!.data[index].namaPanjang, kota: siswa!.data[index].asal);
          },
        ),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
