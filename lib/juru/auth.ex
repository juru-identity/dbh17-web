defmodule Juru.Auth do
  import Plug.Conn
  import Ecto.Query

  alias Juru.User

  def init(opts) do
    Keyword.fetch!(opts, :repo)
  end

  def call(conn, repo) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && repo.get(User, user_id) ->
        put_current_user(conn, user)
      true ->
        assign(conn, :current_user, nil)
    end
  end

  defp put_current_user(conn, user) do
    token = Phoenix.Token.sign(conn, "user socket", user.id)

    conn
    |> assign(:current_user, user)
    |> assign(:user_token, token)
  end

  def login(conn, user) do
    conn =
      conn
      |> put_current_user(user)
      |> put_session(:user_id, user.id)
      |> configure_session(renew: true)
    conn
  end

  def logout(conn) do
    configure_session(conn, drop: true)
  end

  def login_by_name(conn, name, opts) do
    repo = Keyword.fetch!(opts, :repo)
    user = from(u in User, where: fragment("lower(name) = ?", ^String.downcase(name))) |> repo.one()

    cond do
      user ->
        {:ok, login(conn, user)}
      true ->
        {:error, :not_found, conn}
    end
  end
end
