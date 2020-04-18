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
  def open?(%{file: file, timeout: timeout})
      when is_binary(file) and is_integer(timeout) do
    {:ok, data} = CheckTcpPort.LoadData.read_file(file)

    [env] = Map.keys(data)

    parse = fn %{"hosts" => hosts, "port" => port} ->
      Connect.run(hosts, port, timeout)
    end

    Map.get(data, env)
    |> Enum.map(&Task.async(fn -> parse.(&1) end))
    |> Enum.map(&Task.await(&1, 10_000))
    |> Enum.reduce(fn x, acc -> x ++ acc end)
    |> Table.generate_table(env)
  end

  def open?(_input) do
    :error
  end
end
