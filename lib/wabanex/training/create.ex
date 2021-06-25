defmodule Wabanex.Training.Create do
  alias Wabanex.{Repo, Training}

  def create_training(attrs) do
    training =
      %Training{}
      |> Training.changeset(attrs)
      |> Repo.insert()
      |> elem(1)
      |> Repo.preload([:exercises, :user])

    {:ok, training}
  end
end
