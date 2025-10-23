Mix.install([
  {:httpoison, "~> 2.2"},
  {:jason, "~> 1.4"}
])

url = "https://candidat.francetravail.fr/gw-metierscope/job/M1855/offers"

response =
  HTTPoison.get!(
    url,
    [
      {"Accept", "application/json, text/plain, */*"},
      {"Accept-Language", "fr,en-US;q=0.9,en;q=0.8"},
      {"Connection", "keep-alive"},
      {"Referer",
       "https://candidat.francetravail.fr/metierscope/fiche-metier/M1855/developpeur-developpeuse-web"},
      {"Sec-Fetch-Dest", "empty"},
      {"Sec-Fetch-Mode", "cors"},
      {"Sec-Fetch-Site", "same-origin"},
      {"User-Agent",
       "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36"},
      {"sec-ch-ua", "\"Chromium\";v=\"141\", \"Not?A_Brand\";v=\"8\""},
      {"sec-ch-ua-mobile", "?0"},
      {"sec-ch-ua-platform", "\"Linux\""},
      {"traceparent", "00-73D52AD5A02CB279672CCF6B163A6DAF-1B6BBDC9F5AAF29A-00"},
      {"x-dtpc", "8$63833798_894h10vCRPRLTOBTVOVGNBNTTLRQGQKMBRHKUTH-0e0"}
    ],
    params: [
      {"max", "5"}
    ],
    hackney: [
      cookie: [
        "pa_privacy=%22exempt%22; _pcid=%7B%22browserId%22%3A%22mfi903a8dca40rgr%22%2C%22_t%22%3A%22mv6nxks7%22%7D; _pctx=%7Bu%7DN4IgrgzgpgThIC4B2YA2qA05owMoBcBDfSREQpAeyRCwgEt8oBJAE0RXSwH18yBbAG4A2JAA8A1hAAcIAL5A; TCPID=125941322108866011540; TC_PRIVACY=1%40004%7C25%7C4340%40%40%401758194531923%2C1758194531923%2C1791890531923%40; TC_PRIVACY_CENTER=; START_UP=1%40004%7C24%7C5894%40%40%401758268346876%2C1758268346876%2C1791964346876%40; START_UP_CENTER=; BIGipServerPOOL_Z2_PROD_MOP_HTTPS=2023492362.47873.0000; userBadge=0; BIGipServerPOOL_PWNOT-00PT28_HTTPS_PN055-VIPA_3_PN055=3594324490.56131.0000; rxVisitor=1761062083714IA9IP1DTAD3SDEOAL3GSISL9PATD7T4G; TS013f7e53=01baecd2de7c1433f937513970bc2fc8c50f43ce4aacec83209afaf1cc9c488a2fc832fee4c24d75d932ff6f80727efcb2c3382a40490f96c89a8acc0ec594851b9d7e6062388ba5e600e839affd601e19185232d7; TS016fc3b0=0150c672c362b9f2cd0504f47db127bb1b2d5455245023c909efbadad9a61f9819ebf01b16a77e60718e49a5872fd3a76e7c17a82c; JSESSIONID_RECH_OFFRE=tqEHkjlRRyOz8N7xDyfsGuWemWUZ64iiIXiHQm0tKvrGJobfhGaw!798059170; dtSa=-; dtCookie=v_4_srv_8_sn_1AF1152496AEECA13D04B4E83FFD5DAF_app-3A8caeaf5c83d4045b_1_app-3A6e350f5c3735afd9_1_app-3Aea7c4b59f27d43eb_1_app-3Afbc168175d44642b_1_ol_0_perc_100000_mul_1_rcs-3Acss_0; rxvt=1761065634520|1761062083715; dtPC=8$63833798_894h10vCRPRLTOBTVOVGNBNTTLRQGQKMBRHKUTH-0e0"
      ]
    ]
  )

_data = Jason.decode!(response.body)
IO.inspect(response)

# Enum.each(data, fn promise ->
#   IO.puts("#{promise["title"]}")
#   IO.puts("#{promise["location"]}")
#   IO.puts("#{promise["company"]}")
#   IO.puts("__________________________________")
#   IO.puts("**********************************")
#   IO.puts("__________________________________")
# end)
