Mix.install([
  {:httpoison, "~> 2.2"},
  {:jason, "~> 1.4"}
])

defmodule Offers do
  def find_offers(department) do
    url = "https://candidat.francetravail.fr/gw-metierscope/job/M1855/offers"

    response =
      HTTPoison.get!(
        url,
        [
          {"Referer",
           "https://candidat.francetravail.fr/metierscope/fiche-metier/M1855/developpeur-developpeuse-web"}
        ],
        params: [
          {"max", "150"},
          {"departmentNumber", department}
        ]
      )

    data =
      response.body
      |> Jason.decode!()
      |> Enum.filter(fn job -> job["codeDepartment"] in [department] end)
      |> Enum.sort_by(
        fn job ->
          {:ok, datetime} = NaiveDateTime.from_iso8601(job["creationDate"])
          datetime
        end,
        {:desc, NaiveDateTime}
      )

    Enum.each(data, fn offer ->
      IO.puts("""
      ********* #{offer["creationDate"]} #{offer["title"]} **********
      #{offer["location"]}
      #{offer["company"]}
      _______________________________________________________________________________
      """)
    end)

    data
  end
end

Offers.find_offers("13")
Offers.find_offers("83")
