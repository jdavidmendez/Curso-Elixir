
IO.puts("Bienvenido al juego de pares o nones")

eleccion_usuario = String.to_atom(String.downcase(String.trim(IO.gets("Ingresa pares o nones: "))))


if eleccion_usuario != :pares && eleccion_usuario != :nones do
  IO.puts("Opción no válida. Debes elegir 'pares' o 'nones'.")
else
  IO.puts("Ingresa un número del 1 al 5: ")
  numero_jugador = String.trim(IO.gets("numero: ")) |> String.to_integer()
  eleccion_maquina  = :rand.uniform(5) + 1
  IO.puts("Maquina dijo: #{eleccion_maquina}")
  suma = numero_jugador + eleccion_maquina;

  par_none = if rem(suma, 2) == 0, do: :pares, else: :nones

  if eleccion_usuario === par_none do
    IO.puts("Usuario ganó con #{eleccion_usuario}")
  else
    IO.puts("Usuario perdió con #{eleccion_usuario}")
  end


end
