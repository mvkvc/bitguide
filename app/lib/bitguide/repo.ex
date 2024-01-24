defmodule Bitguide.Repo do
  use Ecto.Repo,
    otp_app: :bitguide,
    adapter: Ecto.Adapters.Postgres
end
