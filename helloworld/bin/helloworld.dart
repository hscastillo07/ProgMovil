import 'dart:math';
//Muestra por consola
void main() {
  //1.
  saludar();
  //2.
  print("Suma: ${sum(10, 5)}");
  print("Resta: ${subtract(10, 5)}");
  print("Multiplicación: ${multiply(10, 5)}");
  print("División: ${divide(10, 5)}");
  //3.
  print("Ingrese el radio del círculo:");
  double radio =5.0;
  double area = calcularAreaCirculo(radio: radio);
  print("El área del círculo con radio $radio es: $area");
  //4.
  informacion_persona(nombre: "Juan", edad: 30, ciudad: "Ciudad de México");
  informacion_persona(nombre: "María", edad: 25, ciudad: "Buenos Aires");
  //5.
  double temperaturaCelsius = 25.0;
  double temperaturaFahrenheit = celsiusToFahrenheit(temperaturaCelsius);
  print("$temperaturaCelsius °C equivale a $temperaturaFahrenheit °F");
  //6.
  int numero = 7;
  bool esPar = verificarPar(numero);
  print("$numero es par: $esPar");
  //7.
  List<int> cuadrados = generarCuadrados();
  print("Lista de cuadrados: $cuadrados");
  //8.
  double resultado = calcularOperacion("+", 10, 5);
  print("El resultado es: $resultado");
  //9.
  int numeroFact = 5;
  int factorial = calcularFactorial(numeroFact);
  print("El factorial de $numeroFact es: $factorial");
  //10.
  double montoOriginal = 100.0;
  double porcentajeDescuento = 20.0;
  double precioFinal = calcularPrecioConDescuento(montoOriginal, porcentajeDescuento);
  print("El precio final después del descuento es: $precioFinal");
  //11.
  String cadena = "Hola, ¿cómo estás? 123";
  int cantidadLetras = contarLetras(cadena);
  print("La cantidad de letras en la cadena es: $cantidadLetras");
  //12.
  int longitud = 10;
  String contrasena = generarContrasena(longitud);
  print("Contraseña generada: $contrasena");
  //13.
  List<double> numeros = [10.0, 5.0, 20.0, 3.0, 15.0];
  var resultadoTupla = obtenerMinMax(numeros);
  print("Mínimo: ${resultadoTupla.item1}, Máximo: ${resultadoTupla.item2}");
  //14.
  List<double> calificaciones = [7.5, 6.8, 8.2, 5.0, 9.6];
  bool todasAprobadas = verificarAprobacion(calificaciones);
  
  if (todasAprobadas) {
    print("Todas las calificaciones son mayores o iguales a 5.");
  } else {
    print("No todas las calificaciones son mayores o iguales a 5.");
  }
}
//Fin de muestra por consola

//Funciones
//1.
void saludar(){
  print("Hola! Bienvenido/a");
}
//2.
double sum(double a, double b) {
  return a + b;
}
double subtract(double a, double b) {
  return a - b;
}
double multiply(double a, double b) {
  return a * b;
}
double divide(double a, double b) {
  if (b != 0) {
    return a / b;
  } else {
    throw ArgumentError("No se puede dividir por cero.");
  }
}
//3.
double calcularAreaCirculo({required dynamic radio}) {
  return 3.14159 * radio * radio;
}
//4.
void informacion_persona(
  {required String nombre, 
  required int edad, 
  required String ciudad}
) {
  print("Nombre: $nombre, Edad: $edad, Ciudad: $ciudad.");
}
//5.
double celsiusToFahrenheit(double celsius) {
  return (celsius * 9/5) + 32;
}
//6.
bool verificarPar(int numero) => numero % 2 == 0;
//7.

List<int> generarCuadrados() => List<int>.generate(10, (index) => (index + 1) * (index + 1));

//8.
double calcularOperacion(String operador, double numero1, double numero2) {
  switch (operador) {
    case "+":
      return numero1 + numero2;
    case "-":
      return numero1 - numero2;
    case "*":
      return numero1 * numero2;
    case "/":
      if (numero2 != 0) {
        return numero1 / numero2;
      } else {
        throw ArgumentError("No se puede dividir por cero.");
      }
    default:
      throw ArgumentError("Operador inválido: $operador");
  }
}

//9.
int calcularFactorial(int n) {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * calcularFactorial(n - 1);
  }
}
//10.
double calcularPrecioConDescuento(double montoOriginal, double porcentajeDescuento) {
  if (porcentajeDescuento < 0 || porcentajeDescuento > 100) {
    throw ArgumentError("El porcentaje de descuento debe estar entre 0 y 100.");
  } 
  double descuento = montoOriginal * (porcentajeDescuento / 100);
  return montoOriginal - descuento;
}
//11.
int contarLetras(String cadena) {
  int count = 0;
  for (int i = 0; i < cadena.length; i++) {    
      count++;  
  }
  return count;
}
//12.
String generarContrasena(int longitud) {
  const caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%^&*";
  Random random = Random();
  String contrasena = "";

  for (int i = 0; i < longitud; i++) {
    int index = random.nextInt(caracteres.length);
    contrasena += caracteres[index];
  }

  return contrasena;
}
//13.
Tuple<double, double> obtenerMinMax(List<double> numeros) {
  double minimo = double.infinity;
  double maximo = double.negativeInfinity;

  for (double numero in numeros) {
    if (numero < minimo) {
      minimo = numero;
    }
    if (numero > maximo) {
      maximo = numero;
    }
  }
  return Tuple(minimo, maximo);
}
class Tuple<T1, T2> {
  final T1 item1;
  final T2 item2;

  Tuple(this.item1, this.item2);
}
//14.
bool verificarAprobacion(List<double> calificaciones) {
  for (double calificacion in calificaciones) {
    if (calificacion < 5.0) {
      return false;
    }
  }
  return true;
}