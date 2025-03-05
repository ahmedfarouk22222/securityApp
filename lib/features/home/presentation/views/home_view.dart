import 'package:flutter/material.dart';
import 'package:security_app/constant.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Vioguard",
          style: TextStyle(color: kPrimaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: kPrimaryColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // تحذيرات العنف
            Card(
              color: Colors.white,
              child: ListTile(
                leading: const Icon(Icons.warning, color: Colors.red),
                title: const Text("No active alerts",
                    style: TextStyle(color: Colors.red)),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh, color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // زر بدء المراقبة
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                onPressed: () {
                  // هنا هنضيف الانتقال لصفحة المراقبة لاحقًا
                },
                child: const Text("Start Monitoring",
                    style: TextStyle(fontSize: 18, color: kPrimaryColor)),
              ),
            ),
            const SizedBox(height: 20),

            // الإحصائيات
            const Text("Statistics",
                style: TextStyle(fontSize: 18, color: Colors.white)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildStatCard(
                  "Detections",
                  "5",
                ),
                buildStatCard("Monitoring Time", "12h"),
                buildStatCard("Alerts Sent", "3"),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xff6300A4),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: kPrimaryColor,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history, color: kPrimaryColor),
              label: "History"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: kPrimaryColor), label: "Profile"),
        ],
      ),
    );
  }

  Widget buildStatCard(String title, String value,
      {Color color = Colors.white}) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(fontSize: 14, color: kPrimaryColor)),
            const SizedBox(height: 5),
            Text(value,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor)),
          ],
        ),
      ),
    );
  }
}
