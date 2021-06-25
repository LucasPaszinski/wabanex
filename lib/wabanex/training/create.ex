defmodule Wabanex.Training.Create do
  alias Wabanex.{Repo, Training}

  def create_training(attrs) do
    %Training{}
    |> Training.changeset(attrs)
    |> Repo.insert()
  end
end
