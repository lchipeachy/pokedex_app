import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  static initEnvironment() async {
    await dotenv.load(fileName: ".env");
  } 

  static String pokeApiUrl = dotenv.env['POKE_API_URL'] ?? 'No existe el environment';
}