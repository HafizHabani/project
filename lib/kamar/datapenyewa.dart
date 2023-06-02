import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:projectmppl/detailpenyewa.dart';
import 'package:projectmppl/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;

class DataPenyewa extends StatefulWidget {
  @override
  State<DataPenyewa> createState() => _DataPenyewaState();
}

class _DataPenyewaState extends State<DataPenyewa> {
  TextEditingController namaController = TextEditingController();
  TextEditingController nominalController = TextEditingController();
  TextEditingController nomorHPController = TextEditingController();
  bool status = false;
  DateTime? tanggalBayar;
  DateTime? tanggalMasuk;
  String imgURL = "";
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.orangeAccent[700],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => home()),
            );
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'KostKu',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(
                'Data Penyewa',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('kamar').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          QuerySnapshot kamarDocs = snapshot.data!;
          return ListView.builder(
            itemCount: kamarDocs.size,
            itemBuilder: (context, index) {
              DocumentSnapshot kamarDoc = kamarDocs.docs[index];
              return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('penyewa')
                    .where('id_kamar', isEqualTo: kamarDoc['id'])
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }

                  QuerySnapshot penyewaDocs = snapshot.data!;
                  DocumentSnapshot? penyewaDoc;

                  if (penyewaDocs.size > 0) {
                    // If there are tenants for this room, get the first tenant data
                    penyewaDoc = penyewaDocs.docs[0];
                  }

                  return GestureDetector(
                    onTap: () {
                      if (penyewaDoc != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detailpenyewa(
                              penyewaDoc: penyewaDoc!['id'],
                            ),
                          ),
                        );
                      }

                    },

                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      width: 1000,
                      decoration: BoxDecoration(
                        color: Colors.yellow[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Kamar No ${kamarDoc['id']}',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (penyewaDoc != null) ...[
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    'Nama                   : ',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '${penyewaDoc['nama']}',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    'Tanggal Masuk  : ',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    DateFormat('dd MMM yyyy').format(
                                        penyewaDoc['tanggal_masuk'].toDate()),
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    'Nomor HP           : ',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '${penyewaDoc['nomor_hp']}',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    'Status                  : ',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: penyewaDoc['status']
                                        ? Colors.green
                                        : Colors.red,
                                    // Menentukan warna berdasarkan status
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Memberikan border radius pada container
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 2.0),
                                  // Memberikan padding pada container
                                  child: Text(
                                    penyewaDoc['status']
                                        ? 'Sudah Bayar'
                                        : 'Belum Bayar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey, // Background color
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Tambah Data Penyewa',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            TextField(
                                              controller: namaController,
                                              decoration: InputDecoration(
                                                labelText: 'Nama',
                                              ),
                                            ),
                                            TextField(
                                              controller: nominalController,
                                              decoration: InputDecoration(
                                                labelText: 'Nominal',
                                              ),
                                              keyboardType:
                                              TextInputType.number,
                                            ),
                                            TextField(
                                              controller: nomorHPController,
                                              decoration: InputDecoration(
                                                labelText: 'Nomor HP',
                                              ),
                                              keyboardType:
                                              TextInputType.number,
                                            ),
                                            CheckboxListTile(
                                              title: Text('Status'),
                                              value: status,
                                              onChanged: (value) {
                                                setState(() {
                                                  status = value!;
                                                });
                                              },
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                foregroundColor: Colors.blue,
                                                elevation: 0,
                                              ),
                                              onPressed: () {
                                                tanggalBayar = DateTime.now();
                                                tanggalMasuk = DateTime.now();
                                                imgURL = "";
                                                tambahDataPenyewa(
                                                    kamarDoc['id']);
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Simpan'),
                                            ),
                                            SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: () {
                                                getImage();
                                              },
                                              child: Text('Upload Gambar'),
                                            ),
                                            SizedBox(height: 20),
                                            if (selectedImage != null) ...[
                                              Image.file(
                                                selectedImage!,
                                                height: 200,
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text('Rubah Penyewa'),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  void tambahDataPenyewa(int idKamar) async {
    try {
      String nama = namaController.text;
      int nominal = int.parse(nominalController.text);
      int nomorHP = int.parse(nomorHPController.text);

      String imageName = path.basename(selectedImage!.path);
      firebase_storage.Reference storageReference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('KTP')
          .child(imageName);

      // Upload gambar ke Firebase Storage
      await storageReference.putFile(selectedImage!);

      // Dapatkan URL gambar yang diunggah
      String imageUrl = await storageReference.getDownloadURL();
      QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('penyewa').get();
      int totalData = snapshot.size;

      Map<String, dynamic> data = {
        'id': totalData,
        'id_kamar': idKamar,
        'nama': nama,
        'nominal': nominal,
        'nomor_hp': nomorHP,
        'status': status,
        'tanggal_bayar': tanggalBayar,
        'tanggal_masuk': tanggalMasuk,
        'img': imageUrl,
      };

      await FirebaseFirestore.instance.collection('penyewa').add(data);

      setState(() {
        namaController.clear();
        nominalController.clear();
        nomorHPController.clear();
        status = false;
        imgURL = "";
      });
    } catch (e) {
      print('Error adding tenant data: $e');
    }
  }

  Future<void> getImage() async {
    final pickedImage =
    await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }
}