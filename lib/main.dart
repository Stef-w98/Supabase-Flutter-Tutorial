import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_auth/screens/dashboard.dart';
import 'package:supabase_auth/screens/sign_in_screen.dart';
import 'package:supabase_auth/screens/sign_up_screen.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  const supabaseUrl = 'https://zyyttgrfyefxxlgesoke.supabase.co';
  const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp5eXR0Z3JmeWVmeHhsZ2Vzb2tlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njg2OTY5NDksImV4cCI6MTk4NDI3Mjk0OX0.Dl7Gfm9KQvATcZyx7KkMffWLbfQC0DrM1KCLglJDM0U';
  final supabase = SupabaseClient(supabaseUrl, supabaseKey);

  // query data
  final data = await supabase.from('Temperature').select('id');
  print(data);
//-----------------------------------------------
  var headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp5eXR0Z3JmeWVmeHhsZ2Vzb2tlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njg2OTY5NDksImV4cCI6MTk4NDI3Mjk0OX0.Dl7Gfm9KQvATcZyx7KkMffWLbfQC0DrM1KCLglJDM0U',
  };

  var params = {
    'select': 'TemperaturesInCelcius',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse(
      'https://zyyttgrfyefxxlgesoke.supabase.co/rest/v1/Temperature?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200)
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  print(res.body);
//-----------------------------------------------
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://zyyttgrfyefxxlgesoke.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp5eXR0Z3JmeWVmeHhsZ2Vzb2tlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njg2OTY5NDksImV4cCI6MTk4NDI3Mjk0OX0.Dl7Gfm9KQvATcZyx7KkMffWLbfQC0DrM1KCLglJDM0U',
      authCallbackUrlHostname: 'login-callback', // optional
      debug: true // optional
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SignInScreen(),
        '/signup': (_) => const SignUpScreen(),
        '/dashboard': (_) => const DashboardScreen(),
      },
    );
  }
}
