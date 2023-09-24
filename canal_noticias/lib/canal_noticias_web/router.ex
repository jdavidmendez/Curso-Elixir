defmodule CanalNoticiasWeb.Router do
  use CanalNoticiasWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CanalNoticiasWeb do
    pipe_through :api
    resources "/noticieros", NoticieroController, except: [:new, :edit, :update]
    resources "/presentadores", PresentadorController, except: [:new, :edit, :update]
 
  end
end
