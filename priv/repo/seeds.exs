# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Juru.Repo.insert!(%Juru.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Juru.Repo.insert!(%Juru.User{name: "Jo", public_key: "3zUMoAjXfHG9fyuF7ujHyanNg7pdQ35n5chhsukjm9BE", private_key: "GjFHmKBrbNPhxEiQ9b8ccnZkxXz8ZdZE4oHCmvvrFfhU"})
Juru.Repo.insert!(%Juru.User{name: "Jan", public_key: "A26t1D8JAyBVarHxNScEW69Ct3mipeHCF7Lx8oLJap4H", private_key: "75G8iMtxCbVEFvUAhhFKPZKqYiL7LVsYoXQYkheCHgLG"})
