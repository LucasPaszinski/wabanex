defmodule Wabanex.User.Get do
  alias Wabanex.{User, Repo}
  import Wabanex.Training.Get, only: [get_active_user_training_and_exercises: 1]
  import Ecto.Query

  def get_user(id) do
    with {:ok, uuid} <- Ecto.UUID.cast(id),
         user when not is_nil(user) <- Repo.get(User, uuid) do
      {:ok, get_active_user_training_and_exercises(user)}
    else
      nil -> {:error, "user not found"}
      :error -> {:error, "invalid id, must be and uuid"}
    end
  end
end
