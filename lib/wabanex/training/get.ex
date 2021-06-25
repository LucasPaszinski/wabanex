defmodule Wabanex.Training.Get do
  alias Wabanex.{Training, User, Repo}
  import Ecto.Query

  def get_active_user_training_and_exercises(%User{} = user) do
    utc_today = Date.utc_today()

    query =
      from training in Training,
        where: ^utc_today >= training.start_date,
        where: ^utc_today <= training.end_date

    Repo.preload(user, trainings: {first(query, :inserted_at), :exercises})
  end
end
