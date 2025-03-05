import 'package:flutter/material.dart';
import 'package:security_app/constant.dart';

class MonitorView extends StatefulWidget {
  const MonitorView({super.key});

  @override
  State<MonitorView> createState() => _MonitorViewState();
}

class _MonitorViewState extends State<MonitorView> {
  bool isMonitoring = false;

  void toggleMonitoring() {
    setState(() {
      isMonitoring = !isMonitoring;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Live Monitoring",
          style: TextStyle(color: kPrimaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, color: kPrimaryColor),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // مستطيل لعرض الفيديو (هيتم ربطه بالموديل لاحقًا)
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(
                  Icons.videocam,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // زر تشغيل/إيقاف المراقبة
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isMonitoring ? Colors.red : Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                onPressed: toggleMonitoring,
                child: Text(
                  isMonitoring ? "Stop Monitoring" : "Start Monitoring",
                  style: const TextStyle(fontSize: 18, color: kPrimaryColor),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Placeholder للنتائج
            const Text(
              "Detection Results:",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "No data available",
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
