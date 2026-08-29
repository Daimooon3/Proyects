//Variables :}
let nombre = "Juan";
const edadd = 34;
let peso = 200
console.log(nombre, edadd, peso)

//Funciones
function saludar (nombre) {
    return "Hola" + nombre;
}

saludarr("Juan");
console.log(saludar(" Juan"))

//Condicionales
let edad = 20;
let edad2 = 16;

if (edad >= 18) {
    console.log("Eres mayor de edad");
}
else if (edad <= 18) {
    console.log("Eres menor de edad");
}

//Objetos (probablemente lo mas importante)
let personaje = {
    nombre: "Dymon",
    vida: 100,
    ataque: 30,
    defensa: 10,
    atacar() {
        console.log("haz hecho 30 de daño")
    }
}