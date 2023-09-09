defmodule GCalc do
  use GenServer

  def init(param) do
    IO.puts("InicioGensercer GCalc")
    IO.inspect(param)
    {:ok, %{conteo: 0}}
  end
  
  #no se suele usar mucho porque no devuelve una respuesta pero podria servir para monitorear algo como por ejemplo un log
  def handle_info(:hello, %{conteo: conteo}) do
    IO.puts("numero de llamado: #{conteo}")
  {:noreply, %{conteo: conteo + 1}}
  end

  def handle_info(:world, state) do
    {:noreply, state}
  end

  #espera una llamada y ademas el tercer parametro se le puede decir cuanto puede esperar sino :inifinity en su llamado para que sea infinito
  def handle_call({:add, n, m}, _from, %{conteo: conteo}) do
    IO.puts("handle_call(:add, #{n}, #{m})")
    #Process.sleep(4000)
   result = n + m 
   {:reply, result, %{conteo: conteo + 1}}
  end

  #gestiona mensajes asincronicos donde no espera se una respuesta inmediata, genera llamados no bloqueantes del proceso
  def handle_cast(:reset, _state) do
  {:noreply, %{conteo: 0}} 
  end

  def add(pid, x, y) do
    GenServer.call(pid, {:add, x, y})
  end
end

