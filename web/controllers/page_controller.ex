defmodule Juru.Controller do
  use Juru.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
