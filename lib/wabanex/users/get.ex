defmodule Wabanex.User.Get do
  alias Wabanex.{User, Repo}

  def get_user(id) do
    with {:ok, uuid} <- Ecto.UUID.cast(id),
         user when not is_nil(user) <- Repo.get(User, uuid) do
      {:ok, user}
    else
      nil -> {:error, "user not found"}
      :error -> {:error, "invalid id, must be and uuid"}
    end
  end
end
