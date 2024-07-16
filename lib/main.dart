import 'package:chat_app/ui/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/ui/login.dart';
import 'package:chat_app/ui/utils/Common_widget/bottomNavigationBar.dart';
import 'package:chat_app/ui/utils/themes/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child:MaterialApp(
        home: Login(),
        debugShowCheckedModeBanner: false,
      ),
      // designSize: const Size(375, 812),
    );
  }
}