defmodule Kanzashi.ItemsController do
  use Phoenix.Controller

  plug :action

  def list(conn, _params) do
    conn
    |> put_status(200)
    |> json  %{ok: true}
  end
end
