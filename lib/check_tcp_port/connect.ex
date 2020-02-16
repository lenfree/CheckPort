defmodule CheckTcpPort.Connect do
  def run(hosts, port) do
    hosts
    |> Enum.map(fn host -> run_each(host, port) end)
  end

  # Private API
  def run_each(host, port) do
    # parametise this?
    opts = [timeout: 10]

    case Socket.TCP.connect(host, port, opts) do
      {:error, reason} ->
        [host, port, "closed", "#{reason}"]

      {:ok, pid} ->
        Socket.Stream.close!(pid)
        [host, port, "open", "N/A"]
    end
  end
end
