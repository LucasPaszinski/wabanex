defmodule Wabanex.User.Index do
  alias Wabanex.{User, Repo}

  def get_users do
    {:ok, Repo.all(User)}
  end
end
