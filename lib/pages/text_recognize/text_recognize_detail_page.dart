import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/text_recognize/text_recognize_controller.dart';

class TextRecognizeDetailPage extends StatelessWidget {
  const TextRecognizeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (!TextRecognizeController.to.cameraController.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Column(
        children: [
          const Text('data'),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedOverflowBox(
                size: const Size(400, 300), // aspect is 1:1
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                  ),
                  child: CameraPreview(
                      TextRecognizeController.to.cameraController),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
Dari banyaknya jenis flora,
malangnya aku lahir sebagai putri malu

Tidak mempesona seperti mawar
Tidak menarik seperti matahari
Tidak seharum bunga melati

Ada yang benci dengan keberadaanku,
karena tak sengaja duriku melukainya

Ada yang menyukai kedatanganku,
karena asik untuk dipermainkan

Ada yang caranya mengelus
Ada pula yang caranya menginjak

Namun, beruntungnya aku
bisa tumbuh dimana saja

Persetan dengan suhu dan deerah
Apa aku terlalu kuat? atau terlalu liar?

Entahlah, yang jelas
Aku tidak perlu bergantung pada manusia
Untuk menyiramiku setiap hari
Aku masih tetap tumbuh,
dengan air hujan
yang datang sesekali


--- Mimosa by Kev'

*/