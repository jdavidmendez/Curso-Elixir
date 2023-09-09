defmodule MathChallenger.Processes.Game.HangmanServer do
  import MathChallenger.Processes.Game.HangmanUtils
  use GenServer

  #--------THE GAME--------------
  def init_game() do
    {selW,w_game} = word_to_play()
    {:ok, pid} = start_server()
    game(w_game, selW, 0, 0, victim(), pid)
  end

  defp game(word_game, selW, oport, ptos, drawing, pid) when word_game != selW and oport < 6 do
    IO.puts("Hangman v4.5")
    IO.puts(word_game)
    IO.puts(drawing)
    IO.puts("Puntos: #{ptos}}")

    ing_l = IO.gets("Ingrese una letra o solicita una pista ([P]): ") |> String.trim #Ingresa [P] para que el juego te dé la pista

    ptos_x_ing = case ing_l do
      "[P]" -> 0
      _ -> Map.get(abc_points(), String.downcase(ing_l))
    end

    {up_word_game, oport, ptos, drawing} = case {ing_l, String.contains?(selW, ing_l)} do
      {ing_l, true} -> {update_word(word_game, ing_l, selW), oport, ptos+ptos_x_ing, drawing}
      {"[P]", false} -> {give_clue(word_game, selW, pid), oport , ptos, drawing}
      {_, false} -> {word_game, oport + 1, ptos, update_victim(oport+1, drawing) }
    end

    game(up_word_game, selW, oport, ptos, drawing, pid)

  end

  defp game(word_game, selW, _ , ptos, _, pid) when word_game == selW do
    stop_server(pid, "Haz ganado con #{ ptos} puntos, felicidades!!")
    {:guessed, selW, ptos}
  end

  defp game(_, _, oport, ptos, _, pid) when oport == 6 do 
    stop_server(pid, "Game over con #{ptos} puntos, suerte a la proxima")
    {:gameover, ptos}
  end

  #----------------GENSERVER STUFF-------------------------

  def start_server do
    IO.puts("Por hacer: Inicializar el servidor - 1p")
    GenServer.start_link(__MODULE__, [])
  end

  def init(initial_count) do
    IO.puts("Hangman game is starting...")
    IO.puts("Por hacer: Definir el estado inicial de 3 para solicitar pistas - 1p")
    {:ok, 3}

  end

  def handle_call({word_game, selW}, _from, status) do
    word_up = case status > 0 do
      true -> update_word_clue(word_game, selW) # Aqui ya está la palabra en juego con la pista ya puesta
      _ -> IO.puts("Ya no tienes mas pistas")
        word_game
    end
    {:reply, word_up, status - 1}
  end

  defp give_clue(word_game, selW, pid) do
    IO.puts("Por hacer: Realizar el llamado correcto para llamar a handle_call - 1p")
    GenServer.call(pid,{word_game, selW})
  end

  defp stop_server(pid, result) do
    IO.puts(result <> "\n deteniendo server...")
    GenServer.stop(pid)
    result
  end

end

#2. c("lib/processes/game/hangman_server.ex")
