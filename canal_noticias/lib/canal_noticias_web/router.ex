defmodule CanalNoticiasWeb.Router do
  use CanalNoticiasWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CanalNoticiasWeb do
    pipe_through :api
  end
end
