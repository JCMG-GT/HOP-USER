import 'package:hopapp/src/pages/share_prefs/preferencias_usuario.dart';

export 'validator_mutations.dart';

class QueryMutation {
  final _prefs = new PreferenciasUsuario();

  String loginUs() {
    return '''
      mutation login(\$input: inputLogin){
        login(input:\$input){
            id
            nombre
            email
            celular
            url
        }
      }
      ''';
  }

  String getAllPais() {
    return '''
      query{
        getAllPais{
          descripcion
          id
        }
      }
      ''';
  }

  String getAllGender() {
    return '''
      query{
        getAllGenero{        
          id
          descripcion
        }
      }
      ''';
  }

  String insertUser() {
    return '''
            mutation intoUsuarios(\$input: inputUsuario){
              intoUsuarios(input: \$input){
                id
                nombre
                email
              }
            }
          ''';
  }

  String insertCard() {
    return '''
            mutation intoTargeta(\$input: inputTarjeta){
              intoTargeta(input: \$input){
                id
                numero
              }
            }
          ''';
  }

  String grabarGeo() {
    return '''
           mutation intoGeo(\$input:inputGeo){
            intoGeo(input:\$input){
              mensaje
            }
          }
          ''';
  }

  String getAllLocation() {
    return '''
      query{
            getAllEstable{
              id
              latitud
              longitud
              nombre
              dir1
              pais
              ciudad
                          }
           }
      ''';
  }

  String geoLocations(String latitud, String longitud, String idUsr) {
    return '''
    mutation {
              getGeo(input: {geopos: "$latitud,$longitud", idusr: "$idUsr"}) {
                amigos
                google
                lat
                name
                lng
                place_id
              }
            }
    ''';
  }

  String getInfoBar() {
    return '''
  mutation estableInfo(\$input:inputID){
      estableInfo(input:\$input){
        ID
        nombre
        dir1
        horario
        line
        vip
        cover
        mesa
        descuento
        url
        megusta
        friends
      }
    }
    ''';
  }

  String likeBar() {
    return '''
      mutation meGusta(\$input:inputMegusta){
        meGusta(input:\$input){
          megusta
        }
      }
    ''';
  }

  String baresFavoritos(String id) {
    return '''
     mutation { 
       barfavorito(input: {id: "$id"}) {
        id
        nombre
        url
        megusta
    }
    }
    ''';
  }

  String getFriends() {
    return '''
     mutation getFriends(\$input:inputID){
  getFriends(input:\$input){
    id
    id_amig
    nombre
    url
    latitud
    longitud
    email
  }
}
    ''';
  }

  String getRequest() {
    return '''
     mutation solicitud(\$input:inputID){
  solicitud(input:\$input){
    idusr
    nombre
    url
    celular
    email
    latitud
    longitud
    fec_nac
  }
}
    ''';
  }

  String getAlluser() {
    return '''
     mutation  allUser(\$input:inputID){
        allUser(input:\$input){
        id
        nombre
        url
        email
        estado
        fec_nac
        celular
        latitud
        longitud
     }
    }
    ''';
  }

  String inviteFriend() {
    return '''
      mutation invite(\$input:inputMegusta){
        invite(input:\$input){
          mensaje
        }
      }
    ''';
  }

  String deleteAmigo(String iduser, String idamigo) {
    return '''
    mutation {
              eliminarAmigo(input: {idusrs: "$iduser",idamigo:"$idamigo"}) {
                id
              }
            }
    ''';
  }

  String pagoStripe(int idest, String desc, double precio) {
    var idusr = _prefs.id;
    var result = '''
                  mutation {
                    usCompra(input: {idus: $idusr , idest: $idest, desc: "$desc", pre: $precio}) {
                      idtran
                    }
                  }
                ''';
    return result;
  }

  String informationVIPBar(String idBar) {
    var result = '''
                  mutation {
                  infoProducto(input: {idest: "$idBar", descrip: ""}) {
                    descripcion
                    id
                    idcategoria
                    idestable
                    precio
                  }
                  descripProd(input: {idest: "$idBar", descrip: ""}) {
                    descripcategoria
                    descripproducto
                  }
                }
                 ''';
    return result;
  }

  String validEmail(String email) {
    return '''
      mutation {
        validEmail(input: {email:  "$email"}) {
          id
        }
      }
    ''';
  }

  String validUser(String user) {
    return '''
    mutation {
              validUser(input: {usuario: "$user"}) {
                id
              }
            }
    ''';
  }

  String promoEstable() {
    return r'''
    {
        getPromocion {
          horario
          idestable
          nombre
          url
        }
      }
  ''';
  }

  String barFavorito() {
    return r'''
    mutation {
        barfavorito(input: {id: "1"}) {
          nombre
          url
          totalfriends
        }
      }
    ''';
  }

  String estableResumen(String id) {
    return '''
    mutation {
          establetipProd(input: {id: "$id"}) {
            nombre
            url
          }
    }
    ''';
  }

  String tarjetaUsuaio(String id) {
    return '''
          mutation {
              tarjetaUs(input: {id: "$id"}) {
                Notarjeta
              }
            }
     ''';
  }

  String historialCompra(String id) {
    return '''
      mutation {
            histCompra(input: {id: "$id"}) {
              compra
              nombre
              precio
            }
          }
    ''';
  }

  String friendsInBar(String? latitud, String? longitud, String idUsr) {
    return '''
    mutation {
          geoamigosbar(input: {lat: "$latitud", lng: "$longitud", idusr: "$idUsr"}) {
            DISTANCE
            id_amig
            latitud
            longitud
            nombre
            url
          }
        }
    ''';
  }
}
