defmodule MiModulo do
  # Función para buscar y marcar el mapa
  def buscar_y_marcar(mapa, tupla1, tupla2) do
    {numero1, _} = tupla1
    {numero2, _} = tupla2

    mapa
    |> Enum.map(fn
      {{a, b}, {c1, c2, :consonante, :notfound}} when a in [numero1, numero2] and b in [numero1, numero2] ->
        {{a, b}, {c1, c2, :consonante, :found}}
      {clave, valor} ->
        {clave, valor}
    end)
    |> Map.new()
  end
end
