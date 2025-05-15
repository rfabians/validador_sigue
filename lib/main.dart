import 'package:fluent_ui/fluent_ui.dart';
import 'package:validador_sigue/src/infraestructure/dependencias/ejecutable_gdal.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/pagina_inicio.dart';



void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: 'Validador SIGUE',
      home: PaginaInicio(),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async{
    setState(() {
      _counter++;
      String ruta_gdb = 'D:/OneDrive - Acueducto de Bogota/07. Actividades RFSO/2025/10ValidacionCatastroRedesV2/01Acueducto/250212_CONSOLIDADA_ACUEDUCTO_EAAB_V3.gdb';
      GdalHandler test =GdalHandler(ruta_gdb);
      test.getLayersGDB().then((onValue){
        if (onValue){
         GdalLayers().getLayersGdal().then((listLayers){
           for (String layer in listLayers){
             print(layer);
           }
         });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}*/
