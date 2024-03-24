import 'package:film_uygulamasi_list_view/detay_sayfa.dart';
import 'package:film_uygulamasi_list_view/filmler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Filmler>>filmleri_getir() async{
    
    var filmler_listesi=<Filmler>[];

    var f1=Filmler(1,"Anadoloda","anadoluda.png", 32.65);
    var f2=Filmler(2,"Django","django.png", 23.15);
    var f3=Filmler(3,"Inception","inception.png", 52.10);
    var f4=Filmler(4,"Interstealler","interstellar.png", 50.0);
    var f5=Filmler(5,"The Hateful Eight","thehatefuleight.png", 32.65);
    var f6=Filmler(6,"The Pianist","thepianist.png", 62.39);

    filmler_listesi.add(f1);
    filmler_listesi.add(f2);
    filmler_listesi.add(f3);
    filmler_listesi.add(f4);
    filmler_listesi.add(f5);
    filmler_listesi.add(f6);

    return filmler_listesi;
    
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("FİLMLER"),
      ),
      body: FutureBuilder<List<Filmler>>(

        future: filmleri_getir(),
        builder: (context,snapshot) {

          if(snapshot.hasData){
            var filmler_listesi=snapshot.data;
            return GridView.builder(

              itemCount: filmler_listesi !.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.5,
              ),

              itemBuilder: (context,indeks){

                var film=filmler_listesi[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Detay_Sayfa(film: film)));
                  },
                  child: Card(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("resimler/${film.film_resim_adi}"),
                        ),
                        Text(film.film_ad,style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${film.film_fiyat} \u{20BA}",style: TextStyle(color: Colors.black,fontSize: 16),),
                      ],
                    ),

                  ),
                );

              },

            );
          }
          else{
            return Center();
          }

        },
      ),
    );
  }
}
