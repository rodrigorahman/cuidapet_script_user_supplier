import 'package:dotenv/dotenv.dart';
import 'package:script/script.dart' as script;
import 'package:dotenv/dotenv.dart' as env show load;

Future<void> main(List<String> arguments) async {
  env.load();
  script.run();
}
