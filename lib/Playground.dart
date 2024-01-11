import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Project_uts/main.dart';

class Auth {
  final FirebaseAuth _firebaseUser = FirebaseAuth.instance;
  User? get user => _firebaseUser.currentUser;
  Stream<User?> get authStateChanges => _firebaseUser.authStateChanges();
  Future<void> signInWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseUser.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signUpWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseUser.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseUser.signOut();
    } catch (e) {
      print(e);
    }
  }
}

class home extends StatelessWidget {
  home({Key? key}) : super(key: key);
  final User? user = Auth().user;
  Future<void> _signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('firebase auth');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User Email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: _signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        actions: [
          _signOutButton(),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userUid(),
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  String? errormassage = '';
  bool islogin = true;

  final TextEditingController _controlleremail = TextEditingController();
  final TextEditingController _controllerpassword = TextEditingController();

  Future<void> signInWithEmailandPassword() async {
    try {
      await Auth().signInWithEmailandPassword(
          email: _controlleremail.text, password: _controllerpassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errormassage = e.toString();
      });
    }
  }

  Future<void> signUpWithEmailandPassword() async {
    try {
      await Auth().signUpWithEmailandPassword(
          email: _controlleremail.text, password: _controllerpassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errormassage = e.toString();
      });
    }
  }

  Widget _title() {
    return const Text('firebase auth');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errormassage() {
    return Text(errormassage == '' ? '' : 'Humm? $errormassage ');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        islogin ? signInWithEmailandPassword() : signUpWithEmailandPassword();
      },
      child: Text(islogin ? 'Login' : 'Sign Up'),
    );
  }

  Widget _loginregisterbutton() {
    return TextButton(
      onPressed: () {
        setState(() {
          islogin = !islogin;
        });
      },
      child: Text(islogin ? 'Sign Up' : 'Login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('Email', _controlleremail),
            _entryField('Password', _controllerpassword),
            _errormassage(),
            _submitButton(),
          ],
        ),
      ),
    );
  }
}

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);
  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, Snapshot) {
        if (Snapshot.hasData) {
          return home();
        } else {
          return const loginpage();
        }
      },
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: WidgetTree(),
    );
  }
}
