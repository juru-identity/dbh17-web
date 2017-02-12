defmodule Juru.AssetController do
  use Juru.Web, :controller
  import Ecto.Query

  alias Juru.Asset

  plug Juru.Auth, [repo: Juru.Repo]

  def index(conn, _) do
    assets = Repo.all(Asset)

    # res = HTTPoison.get("localhost:8080/getAssets")

    query = from a in Asset, where: a.asset_id in ^["777a6ae6c05b47ffaf409c0fdd8a54fcf826dfb86b29b6bc6a03dacd0fe2fe85"]
    assets = Repo.all(query)

    render(conn, "index.html", assets: assets)
  end

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, asset = %{"asset" => %{"name" => name, "content" => %Plug.Upload{path: path}}}) do
    user = conn.assigns[:current_user]
    IO.inspect(path)
    # payload = %{"asset" => %{"document" => asset}, "recipientPublicKey" => user.public_key, "recipientPrivateKey" => user.private_key}
    # res = HTTPoison.post("localhost:8080/createAsset", Poison.encode!(payload), [{"Content-Type", "application/json"}])

    res = {:ok, %HTTPoison.Response{status_code: 200, body: Poison.encode!(%{"id" => "123456"})}}

    case res do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        payload = Poison.decode!(body)
        chgs = Asset.changeset(%Asset{}, %{name: name, asset_id: payload["id"]})
        Repo.insert!(chgs)
      {:ok, _} ->
        nil
    end

    redirect(conn, to: asset_path(conn, :index))
  end
end
