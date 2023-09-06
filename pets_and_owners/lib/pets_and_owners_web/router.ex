defmodule PetsAndOwnersWeb.Router do
  use PetsAndOwnersWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end
  scope "/api", PetsAndOwnersWeb do
    pipe_through :api
    resources "/propietarios", PropietarioController, except: [:new, :edit]
    resources "/mascotas", MascotaController, except: [:new, :edit]
  end
end
