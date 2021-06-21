defmodule ElixirTwitterWeb.AuthPipelinePlug do
  use Guardian.Plug.Pipeline,
      otp_app: :elixirTwitter,
      module: ElixirTwitter.Guardian,
      error_handler: ElixirTwitterWeb.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end