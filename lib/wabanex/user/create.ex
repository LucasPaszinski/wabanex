defmodule Wabanex.User.Create do
  alias Wabanex.{User, Repo}

  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
