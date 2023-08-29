defmodule MathChallenger.Game.Hangman do
  defp select_word() do
    Enum.random(["cafetera","mariposa","lavadero","cuaderno"])
  end

  def init_game() do
    selW = select_word()
    spaces = String.duplicate("_",String.length(selW)-2)
    w_game = String.first(selW) <> spaces <> String.last(selW)
    game(w_game, selW, oport, victim)
  end

  defp game(word_game, selW, oport, drawing) do
    IO.puts("Hangman")
    IO.puts(word_game)
    ing_l = IO.gets("Ingrese una letra") |> String.trim
    if String.contains?(selW,ing_l)do
      #actualizar la palabra
      #seguir a la siguiente ronda
      IO.puts()
      else
      #incremetar las oportunidades
      #Atualizar a la victima
      #pasar de ronda
    end

    defp update_word(word_game, ing_l, selW)do

    end
  end

 end