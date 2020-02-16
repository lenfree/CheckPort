defmodule CheckTcpPort.MixProject do
  use Mix.Project

  def project do
    [
      app: :check_tcp_port,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      applications: [:logger, :table_rex]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:socket, "~> 0.3"},
      {:table_rex, "~> 2.0.0"},
      {:yaml_elixir, "~> 2.4.0"}
    ]
  end
end
