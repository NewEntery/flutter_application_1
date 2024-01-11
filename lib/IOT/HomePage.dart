import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(runapp());
}

runapp() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

int tes = 7;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  final List<Widget> _fragments = [
    const GreenHouseFragment(),
    const GrafikFragment(),
    const SensorSwitchFragment(),
    const DeveloperInfoFragment(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentIndex == 0
            ? 'Green House'
            : _currentIndex == 1
                ? 'Grafik'
                : _currentIndex == 2
                    ? 'Sensor Switch'
                    : 'Developer Info'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        children: _fragments,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.spa),
            label: 'Green House',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Grafik',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Sensor Switch',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Developer Info',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          });
        },
      ),
    );
  }
}

class GreenHouseFragment extends StatelessWidget {
  const GreenHouseFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Greenhouse atau rumah kaca merupakan sebuah bangunan tempat tanaman ditanam. Bangunan ini dapat berupa bangunan kecil atau bangunan yang ukurannya juga cukup besar. Konsep di balik rumah kaca berasal dari zaman Romawi ketika Kaisar Tiberius menuntut makan mentimun Armenia setiap hari, serta tukang kebunnya harus menggunakan sistem yang mirip dengan rumah kaca modern untuk memastikan dirinya memiliki mentimun setiap hari.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Image.network(
                'https://cdns.klimg.com/merdeka.com/i/w/news/2023/06/14/1560232/540x270/mengenal-smart-green-house-sistem-pertanian-modern-tanpa-kenal-musim.jpg',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 10),
              Image.network(
                'https://produsenrumahkaca.files.wordpress.com/2016/11/gambarq.jpg',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 10),
              Image.network(
                'https://housing.com/news/wp-content/uploads/2022/11/industrial-greenhouse-interior.-Hydroponic-indoor-vegetable-plant-factory.jpg',
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GrafikFragment extends StatefulWidget {
  const GrafikFragment({Key? key}) : super(key: key);

  @override
  _GrafikFragmentState createState() => _GrafikFragmentState();
}

class _GrafikFragmentState extends State<GrafikFragment> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class SensorSwitchFragment extends StatefulWidget {
  const SensorSwitchFragment({Key? key}) : super(key: key);

  @override
  _SensorSwitchFragmentState createState() => _SensorSwitchFragmentState();
}

class _SensorSwitchFragmentState extends State<SensorSwitchFragment> {
  bool _dht22Switch = false;
  bool _lightSwitch = false;
  bool _humiditySwitch = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSensorCard(
                sensorName: 'DHT22',
                switchValue: _dht22Switch,
                onSwitchChanged: (value) {
                  setState(() {
                    _dht22Switch = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildSensorCard(
                sensorName: 'Light Sensor',
                switchValue: _lightSwitch,
                onSwitchChanged: (value) {
                  setState(() {
                    _lightSwitch = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildSensorCard(
                sensorName: 'Humidity Sensor',
                switchValue: _humiditySwitch,
                onSwitchChanged: (value) {
                  setState(() {
                    _humiditySwitch = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSensorCard({
    required String sensorName,
    required bool switchValue,
    required ValueChanged<bool> onSwitchChanged,
  }) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sensorName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Switch(
              value: switchValue,
              onChanged: onSwitchChanged,
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

String selectedProfile = 'Facebook';

class DeveloperInfoFragment extends StatefulWidget {
  const DeveloperInfoFragment({Key? key}) : super(key: key);

  @override
  _DeveloperInfoFragmentState createState() => _DeveloperInfoFragmentState();
}

class _DeveloperInfoFragmentState extends State<DeveloperInfoFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: AssetImage('Asset/Image/photo.jpg'),
              radius: 80.0,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Muhammad Rizki Herdian\n',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'NRP 152021006',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const Text(
              'Kuliah di ITENAS ',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 30.0),
            DropdownButton<String>(
              value: selectedProfile,
              onChanged: (String? newValue) {
                setState(() {
                  selectedProfile = newValue!;
                });
              },
              items: <String>['Facebook', 'Instagram', 'GitHub']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton.icon(
              onPressed: () {
                _launchProfile(selectedProfile);
              },
              icon: selectedProfile == 'Facebook'
                  ? const Icon(Icons.facebook)
                  : selectedProfile == 'Instagram'
                      ? const FaIcon(FontAwesomeIcons.instagram)
                      : const FaIcon(FontAwesomeIcons.github),
              label: Text(selectedProfile),
            ),
          ],
        ),
      ),
    );
  }

  _launchProfile(String selectedProfile) async {
    final Map<String, String> profileUrls = {
      'Facebook': 'https://www.facebook.com/twins.ext.7/',
      'Instagram': 'https://www.instagram.com/mr.herdian1/',
      'GitHub': 'https://github.com/NewEntery',
    };

    final String selectedProfileURL = profileUrls[selectedProfile]!;
    // ignore: deprecated_member_use
    if (await canLaunch(selectedProfileURL)) {
      await launch(selectedProfileURL);
    } else {
      throw 'Tidak dapat membuka $selectedProfileURL';
    }
  }
}
