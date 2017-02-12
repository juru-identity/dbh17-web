defmodule Juru.TransactionController do
  use Juru.Web, :controller

  alias Juru.Asset

  plug Juru.Auth, [repo: Juru.Repo]

  def new(conn, _) do
    # get all my assets
    assets =
      Repo.all(Asset)
      |> Enum.map(&{&1.name, &1.asset_id})

    render(conn, "new.html", assets: assets)
  end

  def create(conn, %{"transaction" => %{"asset_id" => asset_id, "to" => to}}) do
    user = conn.assigns[:current_user]
    # payload = %{"assetId" => , "signingPrivateKey" => user.private_key, "recipientPublicKey" => to}
    # res = HTTPoison.post("localhost:8080/createAsset", Poison.encode!(payload), [{"Content-Type", "application/json"}])

    res = {:ok, %HTTPoison.Response{status_code: 200, body: Poison.encode!(%{"id" => "123456"})}}

    case res do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        # payload = Poison.decode!(body)
        conn
        |> put_flash(:info, "Great success")
        |> redirect(to: asset_path(conn, :index))
      _ -> render(conn, "new.html")
    end

  end
end
