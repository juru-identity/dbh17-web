defmodule Juru.SessionController do
  use Juru.Web, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"name" => name}}) do
    case Juru.Auth.login_by_name(conn, name, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Hello blockchain citizen!")
        |> redirect(to: transaction_path(conn, :new))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, gettext("User unknow"))
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Juru.Auth.logout()
    |> put_flash(:info, gettext("You have been logged out"))
    |> redirect(to: transaction_path(conn, :new))
  end
end
