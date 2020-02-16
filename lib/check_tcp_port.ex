defmodule CheckTcpPort do
  alias CheckTcpPort.{Connect, Table}

  @moduledoc """
  Documentation for `CheckTcpPort`.
  """

  @doc """
  Check TCP Port Open.

  ## Examples

      iex> CheckTcpPort.open?
      +-------------------------------------------------+
      |                  TCP Check test                 |
      +------------------+------+--------+--------------+
      | Host             | Port | Status | Reason       |
      +------------------+------+--------+--------------+
      | 8.8.8.8          | 8000 | closed | timeout      |
      +------------------+------+--------+--------------+

  """
  def open? do
    {:ok, data} = get_file() |> CheckTcpPort.LoadData.read_file()

    [env] = Map.keys(data)

    Map.get(data, env)
    |> Enum.map(fn %{"hosts" => hosts, "port" => port} ->
      Connect.run(hosts, port)
    end)
    |> Enum.reduce(fn x, acc -> x ++ acc end)
    |> Table.generate_table(env)
  end

  def get_file do
    case System.get_env("FILE") do
      nil ->
        IO.puts("Error: Please specify FILE env var")
        System.halt(1)

      file ->
        file
    end
  end
end
