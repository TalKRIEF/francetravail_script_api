Mix.install([
  {:httpoison, "~> 2.2"},
  {:jason, "~> 1.4"}
])

url = "https://candidat.francetravail.fr/gw-metierscope/job/M1855/offers"

response =
  HTTPoison.get!(
    url,
    [
      {"Referer",
       "https://candidat.francetravail.fr/metierscope/fiche-metier/M1855/developpeur-developpeuse-web"}
    ],
    params: [
      {"max", "150"}
    ]
  )

_filtered_data =
  response.body
  |> Jason.decode!()
  |> Enum.filter(fn job -> job["codeDepartment"] in ["83", "13"] end)
  |> Enum.each(fn offer ->
    IO.puts("""
    #{offer["title"]}
    #{offer["location"]}
    #{offer["company"]}
    _______________________________________________________________________________
    """)
  end)

# Enum.each(filtered_data, fn promise ->
#   IO.puts("#{promise["title"]}")
#   IO.puts("#{promise["location"]}")
#   IO.puts("#{promise["company"]}")
#   IO.puts("_______________________________________________________________________________________________________")
# end)
