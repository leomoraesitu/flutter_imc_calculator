
//classe
class Pessoa{

  //atributos
  String _nome = "";
  double _peso = 0;
  double _altura = 0;

  //metodo construtor
  Pessoa(String nome, double peso, double altura){
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }

  //getters and setters (encapsulamento)
  String getNome(){
    return _nome;
  }

  void setNome(String nome){
    _nome = nome;
  }

  double getPeso(){
    return _peso;
  }

  void setPeso(double peso){
    _peso = peso;
  }

  double getAltura(){
    return _altura;
  }

  void setAltura(double altura){
    _altura = altura;
  }
}