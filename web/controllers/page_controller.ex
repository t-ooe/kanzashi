defmodule Kanzashi.PageController do
  use Kanzashi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
