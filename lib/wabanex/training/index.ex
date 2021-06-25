defmodule Wabanex.Training.Index do
  alias Wabanex.{Repo, Training}
  import Ecto.Query

  def trainings do
    trainings =
      from(t in Training,
        preload: [:exercises, :user]
      )
      |> Repo.all()

    {:ok, trainings}
  end
end
