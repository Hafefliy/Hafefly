import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hafefly/firebase_options.dart';
import 'package:hafefly/models/user.dart';
import 'package:hafefly/screens/wrapper.dart';
import 'package:hafefly/services/auth.dart';
import 'package:hafefly/services/database.dart';
import 'package:hafefly/services/locator.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupServices();
  runApp(MultiProvider(providers: [
    Provider(
        create: (_) =>
            DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userr?>.value(
        value: AuthService().user,
        initialData: Userr(uid: null),
        child: MaterialApp(
          debugShowCheckedModeBanner: newMethod,
          home: const Wrapper(),
        ));
  }

  bool get newMethod => false;
}
