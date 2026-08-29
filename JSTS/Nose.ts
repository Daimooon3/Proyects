//funciones (aveces no hace falta poner el tipo solamente cuando da errores)
function jai(name: string) {
    console.log(`Hello, ${name}!`);
}

//objetos (para especificar el tipo pones {} y dentro el nombre del atributo seguido de : y el tipo)
function saludarr(persona: {nombre: string; edad: number }) {
    console.log(`hola, ${persona.nombre}! Tienes ${persona.edad} años.`);
}