-- Fundamentos
-- Variables = Local
-- Funciones = Function
-- Camelcase = nombre de funcion (ignorar)
-- end para marcar el final de una variable, funcion u objeto
-- nil = nada
-- Objeto = self

--ejemplo (funcion sin paramentros)
local function addOneAndTwo()
    local result = 1 + 2
    print(result)
end

addOneAndTwo() -- 3
-- Verificado

-- Parámetros
-- Son variables a disposicion de las funciones, y que se usan solo en el ambito de l a funcion.
-- Las funciones no tienen parámentros por defecto, siempre se espera una cantidad exacta de parametros.
-- Si escribís parámetros de mas, Luau ignora los parámetros adicionales
-- Si escribís de menos da Nil

-- Ejemplo
local function addNumbers(num1, num2)
    print(num1 + num2)
end

addNumbers(2,3)
addNumbers(5, 6, 7)
addNumbers(9) -- Esto da nil ya que no suma nada
-- Semi verificado, pequeño error pero funciona igual

-- Retorno (return)
-- Devuelve el resultado de un cálculo. Puede devolver múltiples valores de una funcion
-- Return termina la ejecucion de la funcion y luau espera el end siga las declaraciones return
-- Por eso da error al trabajar con estas palabras claves juntas

-- Ejemplo
local function addnumbers(num1, num2)
    local result = num1 + num2
    return result
end

print(addnumbers(1,2)) -- 3
local seven = addnumbers(3, 4)
print(seven) -- 7

-- Funcion que devuelve varios valores (funcion multiple)
local function addandsubstract(num1, num2)
    local sum = num1 + num2
    local difference = num1 - num2
    return sum, difference
end

-- Llamando a una funcion y esperando los multiples valores de return
local sum, difference = addandsubstract(2, 3)
print(sum) -- 5
print(difference) -- -1
-- Verificado

-- Metodos (Atencion)
-- Se denominan funciones que son parte de un objeto, como una clase o tabla.
-- Esperan el objeto mismo como el primer argumento.
-- Cuando se llama a un metodo se usa ":" y no "." para pasar self como primer argumento automaticamente
-- Todos los objetos tienen metodos de uso comun, por ejemplo:
-- Instance:Destroy()
-- Instance:Clone()
-- Instance:FindFirstChild()

-- Ejemplo
local Workspace = game:GetService("Workspace")

-- Destruyendo una parte con notacion de punto (funcion)
local firstPart = Instance.new ("Part")
firstPart.Parent = Workspace
print(firstPart.Parent)
firstPart.Destroy(firstPart) -- nil

-- Destruyendo una parte con notacion de dos punto (metodo)
local secondPart = Instance.new("Part")
secondPart.Parent = Workspace
print(secondPart.Parent)
secondPart:Destroy()
print(secondPart.Parent) -- nil

-- Definir metodos 
-- Para crear un metodo en una tabla. Usa el metodo como la clave y la funcion (del metodo) como valor
-- self se refiere a la table padre del metodo.
-- Se pueden definir parametros para un metodo pero se necesita listarlos despues del parametro self

-- Ejemplos
local testButton = {
	enabled = true,
	changeEnabled = function(self, isEnabled)
		self.enabled = isEnabled
		print(self.enabled)
	end
}

print(testButton.enabled) -- true
-- Llamar al método
testButton:changeEnabled(false) -- false
-- Verificado

-- Callbacks
-- Funciones que se ejecutan en respuesta a otra funcion o proceso
-- Callbacks basicos
-- Las funciones se pueden pasar a otras funciones
-- Una funcion anonima (sin nombre) se puede usar para implementar un callback que table.sort()
-- Luego usa una lista de Players de Players-GetPLayers()

-- Ejemplo
local Players = game:GetService("Players")
local sortedPlayers = Players:GetPlayers()

table.sort(sortedPlayers, function(a, b)
    -- Se usa un callback anonimo para ordenar los jugadores por nombre
    return a.Name < b.Name
)
-- Verificado

-- Manejadores de eventos
-- Se puede asiganar una funcion conocida como "manejador de eventos" para que se ejecute cuando se activa un evento
-- Por ejemplo:
-- Se puede crear una funcion llamada "onPlayerAdded()" para el evento Players.PlayerAdded para imprimir el nombre de cualquier jugaador que se una

-- Ejemplo
local Players = game:GetService("Players")

local function onPlayerAdded(player)
    print(player.Name .. " Se unio al juego :D!")
end

Players.PlayerAdded:Connect(onPlayerAdded)
-- Verficado

-- Funciones anonimas
-- Son llamadas asi porque sosn funciones sin nombre, para usar como callbacks y/o manejadores de eventos.
-- Funcionan igual que las funciones nombradas, pero no necesita la palabra local porque siempre tienen un ambito local

-- Ejemplo
-- Funcion anonima en un callback para task.delay()
task.delay(2, function(exactTimeElapsed)
    print(exactTimeElapsed)
end)

-- Funcion anonima en un manejador de enventos
local Players = game:GetService("Players")
Players.PlayersAdded:Connect(function(player)
    print(player.Name .. " Se unio al juego (otra vez) :D!")
end)

-- FUnciones en scripts de modulo
-- Se puede reutilizar funciones a traves de multiples scripts almacenadolos en "ModuleScripts". Se puede almacenar en tablas junto a otros datos
-- Funciones variadica
-- Acepta cualquier numero de argumentos.
-- Por ejemplo: Globals.LuaGlobals.print() es una funcion variadica

-- Ejemplo
print(2, "+", 2, "=", 2 + 2) -- 2 + 2 = 4
print(string.format("¡El %s es un %s!", "pastel", "mentira")) -- El pastel es una mentira
print(string.char(115, 101, 99, 114, 101, 116))

-- Definir funciones variadicas
-- Para definir una funcion variadicas se usa el token "..." como ultimo o unico paramentro
-- El token "..." solo se puede usar dentro de funcion variadicas

-- Ejemplo
local function variadic(named, ...)
    local arguments = {...} -- Empaqueta los argumentos adicionales en una tabla
    print("Argumento nombrado =", named)
    for i, value in arguments do
        print("Entrada No.", i, "=", value)
    end
end

variadic(10, "Hola", 20, "Funcion Variádica")
--[[ salida resultante:
Argumento nombrado = 10
Entrada No. 1 = Hola
Entrada No. 2 = 20
Entrada No. 3 = Funcion variadica
]]

-- Reenviar argumentos
-- Se puede definir funciones variadicas como envolturas alrededor de otras funciones para pasar, o reenviar, argumentos desde la envoltura de otras funciones

-- Ejemplo
local function printAround(functiontoPrintAround, ...)
    print("Antes")
    functionToPrintinAround(...)
    print("Despues")
end

local function addnombers(x, y, z)
    print("x =", x)
    print("y + z =", y + z)
end

printAround(addnombers, 1, 2, 3)
--[[ Salida:
Antes:
x = 1
y + z = 5
Despues:
]]

-- Llamar a una funcion variadica con arreglos
-- Si deseas pasar una tabla de valores a una funcion variadica global, como print()
-- Se puede usar la funcion global unpack() para pasar los valroes de la tabla en lugar de la misma

-- Ejemplo
local squares = {1, 4, 9, 16, 25}
print("Los primeros 5 numeros cuadrados son:", unapack(squares))
-- Los primeros 5 numeros cuadrados son 1 4 9 16 25