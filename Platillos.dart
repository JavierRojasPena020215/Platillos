import 'dart:io';
class Menu{
  var menu={};
  Menu(){
    this.menu;
  }
  String agregar(String? nombre,int? precio){
    this.menu[nombre]=precio;
    return "Agregado con exito";
  }
  String buscar(String? nombre){
    return this.menu.containsKey(nombre)?"Platillo: ${nombre}\nPrecio: ${this.menu[nombre]}":"No se encuentra este platillo";
  }
  String actualizarPlatillo(String? nombre, int? precio){
    if(this.menu.containsKey(nombre)){
      this.menu[nombre]=precio;
      return "Platillo: ${nombre}\nPrecio: ${this.menu[nombre]}";
    }
    return "No se encuentra este platillo";
  }
  String mostrarMenu(){
    String platillos="";
    for(var platillo in this.menu.entries){
      platillos+="Platillo: ${platillo.key} Precio: ${platillo.value}\n";
    }
    return platillos;
  }
}
void main() {
  var menu=Menu();
  String? nombre;
  int? precio;
  bool ciclo=true;
  while(ciclo){
    print("""
    ¿Que desea realizar?
    1.-Agregar
    2.-Mostrar Menu
    3.-Buscar
    4.-Modificar precio
    5.-Salir
    """);
    int? opcion=int.parse(stdin.readLineSync()!);
    switch(opcion){
      case 1:
        print("Ingrese el nombre del platillo:");
        nombre=stdin.readLineSync();
        print("Ingrese el precio del platillo:");
        precio=int.parse(stdin.readLineSync()!);
        print(menu.agregar(nombre, precio));
      case 2:
        print(menu.mostrarMenu());
      case 3:
        print("Ingrese el nombre del platillo a buscar:");
        nombre=stdin.readLineSync();
        print(menu.buscar(nombre));
      case 4:
        print("Ingrese el nombre del platillo a modificar:");
        nombre=stdin.readLineSync();
        print("Ingrese el nuevo precio del platillo:");
        precio=int.parse(stdin.readLineSync()!);
        print(menu.actualizarPlatillo(nombre, precio));
      case 5:
        print("Saliendo...");
        ciclo=false;
      
    }
  }
}