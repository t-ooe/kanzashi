defmodule Kanzashi.ItemsController do
  use Phoenix.Controller

  plug :action

  def list(conn, _params) do
    HTTPoison.start

    url = "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20140222?format=json&keyword=%E3%81%8B%E3%82%8F%E3%81%84%E3%81%84&applicationId=1067816662614119417"
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        js = Poison.Parser.parse!(body, keys: :atoms!)
        conn
        |> put_status(200)
        |> json  %{ok: true, result: js}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
    # conn
    # |> put_status(200)
    # |> json  %{ok: true}
  end
end
