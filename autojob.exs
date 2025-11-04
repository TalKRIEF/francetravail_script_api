Mix.install([
  {:httpoison, "~> 2.2"},
  {:jason, "~> 1.4"}
])

defmodule Offers do
  @url "https://candidat.francetravail.fr/gw-metierscope/job/M1855/offers"

  def find_offers(department) do
    response =
      HTTPoison.get!(
        @url,
        [
          {"Referer",
           "https://candidat.francetravail.fr/metierscope/fiche-metier/M1855/developpeur-developpeuse-web"}
        ],
        params: [
          {"max", "150"},
          {"departmentNumber", department}
        ]
      )

    response.body
    |> Jason.decode!()
    |> Enum.filter(fn job -> job["codeDepartment"] in [department] end)
  end
end

department_list = ["13", "83"]
keywords_to_include = ["angular", "react", "ruby", "rails", "elixir", "phoenix"]

mixed_results =
  department_list
  |> Enum.flat_map(fn dpt ->
    Offers.find_offers(dpt)
  end)
  |> Enum.filter(fn job ->
    downcased = String.downcase(job["title"])
    Enum.any?(keywords_to_include, &String.contains?(downcased, &1))
  end)
  |> Enum.sort_by(
    fn job ->
      {:ok, datetime} = NaiveDateTime.from_iso8601(job["creationDate"])
      datetime
    end,
    {:asc, NaiveDateTime}
  )

Enum.each(mixed_results, fn offer ->
  IO.puts(
    "********* #{offer["creationDate"]} #{IO.ANSI.cyan()} #{IO.ANSI.bright()}#{offer["title"]} **********#{IO.ANSI.reset()}"
  )

  IO.puts("""
  #{offer["location"]}
  #{IO.ANSI.green_background()} #{offer["company"]} #{IO.ANSI.reset()}
  _______________________________________________________________________________
  """)
end)
