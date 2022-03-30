import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget{

 @override
 Widget build(BuildContext context){
   return Scaffold(
     appBar: AppBar(
       elevation: 0,
       title: Text('Historial'),
       actions:[
         IconButton(
           icon: Icon(Icons.delete_forever),
           onPressed: (){} 
         )
       ],
     ),
     body: _HamePageBody(),
     bottomNavigationBar: CustomNavigationBar(),
     floatingActionButton: ScanButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   );
 }

}

class _HamePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    //Cambiar para mostrar pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    //temporal leer base la base de datos
    /*final tempScan = new ScanModel(valor: 'http://google.com');*/
    DBProvider.db.deleteAllScans().then(print);

    

    switch(currentIndex){

        case 0:
          return MapasPage(); 

        case 1:
          return DireccionesPage(); 

        default:
          return MapasPage();
    }
  }
}
