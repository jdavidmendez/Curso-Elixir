
IO.puts("Bienvenido al juego de piedra papel o tijeras")

eleccion_usuario = String.to_atom(String.trim(IO.gets("Ingresa piedra, papel o tijera: ")))

IO.puts("***Maquina esta seleccionando respuesta...***")
opciones = [:piedra, :papel, :tijera]
maquina_eleccion = Enum.random(opciones)
IO.puts("Maquina selecciono #{ maquina_eleccion }")

# este mapa representa los resultados para el usuario siendo el primer elemento de la tupla lo ingresado por el usuario
mapa_solucion = %{
  {:piedra, :papel} => :perdiste,
  {:piedra, :tijera} => :ganaste,
  {:piedra, :piedra} => :empataste,
  {:papel, :piedra} => :ganaste,
  {:papel, :tijera} => :perdiste,
  {:papel, :papel} => :empataste,
  {:tijera, :papel} => :ganaste,
  {:tijera, :piedra} => :perdiste,
  {:tijera, :tijera} => :empataste,
}

# comento mi respuesta anterior por falta de verificacion cuando no se encuentra la eleccion
#respuesta = mapa_solucion[{eleccion_usuario, maquina_eleccion}]
#uso un Map.get/3 para verificar si el usuario usa una respuesta no valida en caso de no estar en el mapa devuelve :error
respuesta = Map.get(mapa_solucion,{eleccion_usuario, maquina_eleccion},:error)

#un poco largo y enrredado de visualizar, y tambien cambiare el enfoque para la respuesta usando atomos
#mensajeAlentador = respuesta === "Perdiste" && " Suerte a la proxima" || respuesta === "Empataste" && " Podria mejorar" || respuesta !== :error && " Excelente resultado" || " No estamos jugando a lo mismo!!!"

#mejor estructurado y facil de leer
mensaje_alentador =
  case respuesta do
    :perdiste -> "Suerte a la próxima"
    :empataste -> "Podría mejorar"
    _ when respuesta != :error -> "Excelente resultado"
    _ -> "¡No estamos jugando a lo mismo!"
  end

IO.puts("En esta partida tu #{ respuesta === :error && :perdiste || respuesta }," <> mensaje_alentador)
IO.puts("***Intentalo de nuevo!***")
