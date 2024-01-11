import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Project_uts/calculator.dart';
import 'package:flutter_application_1/Project_uts/login.dart';
import 'package:flutter_application_1/Project_uts/matauang.dart';
import 'package:flutter_application_1/Project_uts/profile.dart';
import 'package:flutter_application_1/Project_uts/splash.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';

void main() {
  runApp(start());
}

class start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenPage(),
    );
  }
}

class Myapp extends StatefulWidget {
  @override
  State<Myapp> createState() => _HomePageState();
}

class _HomePageState extends State<Myapp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabs Demo',
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              title: Text(_currentIndex == 0
                  ? 'Home'
                  : _currentIndex == 1
                      ? 'Shop'
                      : _currentIndex == 2
                          ? 'QR CODE'
                          : _currentIndex == 3
                              ? 'Calculator'
                              : 'Akun'),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                      Icons.logout), // Ganti dengan ikon logout yang sesuai
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Logout'),
                            content:
                                const Text('Apakah anda yakin ingin logout?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Tidak'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                  );
                                },
                                child: const Text('Ya'),
                              ),
                            ],
                          );
                        });
                  }, // Tambahkan logika logout di sini
                ),
              ],
            ),
            body: TabBarView(
              children: [
                Home(),
                CurrencyConversionPage(),
                const App(),
                Calculator(), //TransactionPage(),
                DeveloperIntroductionForm()
              ],
            ),
            bottomNavigationBar: TabBar(
              indicator: const BoxDecoration(
                color: Color.fromARGB(255, 11, 56, 92),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20), // Setengah lingkaran di atas
                ),
              ),
              tabs: [
                Tab(
                  icon: Container(
                    child: const Center(
                      child: Icon(
                        Icons.home,
                        size: 40.0,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                  ),
                ),
                Tab(
                  icon: Container(
                    child: const Center(
                      child: Icon(
                        Icons.shopping_bag,
                        size: 40.0,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                  ),
                ),
                Tab(
                  icon: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.qr_code_scanner,
                        size: 40.0,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                  ),
                ),
                Tab(
                  icon: Container(
                    child: const Center(
                      child: Icon(
                        Icons.calculate,
                        size: 40.0,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                  ),
                ),
                Tab(
                  icon: Container(
                    child: const Center(
                      child: Icon(
                        Icons.account_circle,
                        size: 40.0,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                  ),
                ),
              ],
              onTap: (index) {
                // Perbarui nilai _currentIndex saat tab berubah
                setState(() {
                  _currentIndex = index;
                });
              },
            )),
      ),
    );
  }
}

class CurrencyConversionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CurrencyConversionForm(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Image.asset(
                'Asset/Image/IMAKURI.png',
                height: 50.0,
              ),
            ),
            const Text(
              "Selamat datang di dunia keajaiban Jepang dengan koleksi merch terbaru kami! Dalam kumpulan ini, kami menggabungkan keindahan seni tradisional Jepang dengan sentuhan modern yang memukau. Produk-produk kami tidak hanya memperlihatkan warisan budaya yang kaya, tetapi juga menghadirkan nuansa eksklusif Jepang yang bisa Anda nikmati dalam keseharian Anda. Dari pakaian yang stylish hingga barang-barang unik yang menginspirasi, kami siap membawa Anda dalam perjalanan budaya yang tak terlupakan. Selamat berbelanja dan temukan keindahan Jepang dalam setiap detailnya!",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class AccountBoxTab extends StatefulWidget {
  AccountBoxTab({super.key});

  @override
  State<AccountBoxTab> createState() => _AccountBoxTabState();
}

class _AccountBoxTabState extends State<AccountBoxTab> {
  int a = 4;

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(
                'Asset/Image/profile_image.png'), // Ganti dengan path gambar profil Anda
          ),
          const SizedBox(height: 20),
          const Text(
            'Nama Akun',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk mengedit profil di sini
            },
            child: const Text('Edit Profil'),
          ),
        ],
      ),
    );
  }
}

class Transaction {
  final String id;
  final String description;
  final double amount;

  Transaction({
    required this.id,
    required this.description,
    required this.amount,
  });
}

class TransactionPage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', description: 'Pembelian Buku', amount: 29.99),
    Transaction(id: 't2', description: 'Pengisian Bensin', amount: 45.00),
    Transaction(id: 't3', description: 'Makan Malam', amount: 22.50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                child:
                    Text('\$${transactions[index].amount.toStringAsFixed(2)}'),
              ),
              title: Text(transactions[index].description),
              subtitle: Text(transactions[index].id),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  // Tambahkan logika untuk menghapus transaksi di sini
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan logika untuk menambahkan transaksi di sini
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ScanResult? scanResult;

  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');

  var _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      _numberOfCameras = await BarcodeScanner.numberOfCameras;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final scanResult = this.scanResult;
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            TextButton(onPressed: _scan, child: const Text('Start QR scan')),
            if (scanResult != null)
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Result Type'),
                      subtitle: Text(scanResult.type.toString()),
                    ),
                    ListTile(
                      title: const Text('Raw Content'),
                      subtitle: Text(scanResult.rawContent),
                    ),
                    ListTile(
                      title: const Text('Format'),
                      subtitle: Text(scanResult.format.toString()),
                    ),
                    ListTile(
                      title: const Text('Format note'),
                      subtitle: Text(scanResult.formatNote),
                    ),
                  ],
                ),
              ),
            const ListTile(
              title: Text('Camera selection'),
              dense: true,
              enabled: false,
            ),
            RadioListTile(
              onChanged: (v) => setState(() => _selectedCamera = -1),
              value: -1,
              title: const Text('Default camera'),
              groupValue: _selectedCamera,
            ),
            ...List.generate(
              _numberOfCameras,
              (i) => RadioListTile(
                onChanged: (v) => setState(() => _selectedCamera = i),
                value: i,
                title: Text('Camera ${i + 1}'),
                groupValue: _selectedCamera,
              ),
            ),
            const ListTile(
              title: Text('Button Texts'),
              dense: true,
              enabled: false,
            ),
            ListTile(
              title: TextField(
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Flash On',
                ),
                controller: _flashOnController,
              ),
            ),
            ListTile(
              title: TextField(
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Flash Off',
                ),
                controller: _flashOffController,
              ),
            ),
            ListTile(
              title: TextField(
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Cancel',
                ),
                controller: _cancelController,
              ),
            ),
            if (Platform.isAndroid) ...[
              const ListTile(
                title: Text('Android specific options'),
                dense: true,
                enabled: false,
              ),
              ListTile(
                title: Text(
                  'Aspect tolerance (${_aspectTolerance.toStringAsFixed(2)})',
                ),
                subtitle: Slider(
                  min: -1,
                  value: _aspectTolerance,
                  onChanged: (value) {
                    setState(() {
                      _aspectTolerance = value;
                    });
                  },
                ),
              ),
              CheckboxListTile(
                title: const Text('Use autofocus'),
                value: _useAutoFocus,
                onChanged: (checked) {
                  setState(() {
                    _useAutoFocus = checked!;
                  });
                },
              ),
            ],
            const ListTile(
              title: Text('Other options'),
              dense: true,
              enabled: false,
            ),
            CheckboxListTile(
              title: const Text('Start with flash'),
              value: _autoEnableFlash,
              onChanged: (checked) {
                setState(() {
                  _autoEnableFlash = checked!;
                });
              },
            ),
            const ListTile(
              title: Text('Barcode formats'),
              dense: true,
              enabled: false,
            ),
            ListTile(
              trailing: Checkbox(
                tristate: true,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: selectedFormats.length == _possibleFormats.length
                    ? true
                    : selectedFormats.isEmpty
                        ? false
                        : null,
                onChanged: (checked) {
                  setState(() {
                    selectedFormats = [
                      if (checked ?? false) ..._possibleFormats,
                    ];
                  });
                },
              ),
              dense: true,
              enabled: false,
              title: const Text('Detect barcode formats'),
              subtitle: const Text(
                'If all are unselected, all possible '
                'platform formats will be used',
              ),
            ),
            ..._possibleFormats.map(
              (format) => CheckboxListTile(
                value: selectedFormats.contains(format),
                onChanged: (i) {
                  setState(
                    () => selectedFormats.contains(format)
                        ? selectedFormats.remove(format)
                        : selectedFormats.add(format),
                  );
                },
                title: Text(format.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _scan() async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': _cancelController.text,
            'flash_on': _flashOnController.text,
            'flash_off': _flashOffController.text,
          },
          restrictFormat: selectedFormats,
          useCamera: _selectedCamera,
          autoEnableFlash: _autoEnableFlash,
          android: AndroidOptions(
            aspectTolerance: _aspectTolerance,
            useAutoFocus: _useAutoFocus,
          ),
        ),
      );
      setState(() => scanResult = result);
    } on PlatformException catch (e) {
      setState(() {
        scanResult = ScanResult(
          type: ResultType.Error,
          rawContent: e.code == BarcodeScanner.cameraAccessDenied
              ? 'The user did not grant the camera permission!'
              : 'Unknown error: $e',
        );
      });
    }
  }
}
