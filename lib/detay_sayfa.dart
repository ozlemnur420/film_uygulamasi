import 'package:film_uygulamasi_list_view/filmler.dart';
import 'package:flutter/material.dart';

class Detay_Sayfa extends StatefulWidget {

  Filmler film;
  Detay_Sayfa({required this.film});

  @override
  State<Detay_Sayfa> createState() => _Detay_SayfaState();
}

class _Detay_SayfaState extends State<Detay_Sayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.film.film_ad),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.film.film_resim_adi}"),
            Text("${widget.film.film_fiyat} \u{20BA}",style: TextStyle(color: Colors.black,fontSize: 48),),

            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(

                child: Text("SATIN AL",style: TextStyle(color: Colors.white,fontSize: 12),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
                onPressed: (){

                  print("${widget.film.film_ad} satın alındı");

                },

              ),
            ),





          ],

        ),

      ),
    );
  }
}
