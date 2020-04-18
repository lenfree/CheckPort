defmodule CheckTcpPort.Connect do
  def run(hosts, port, timeout) do
    hosts
    |> Enum.map(fn host -> run_each(host, port, timeout) end)
  end

  # Private API
  def run_each(host, port, timeout \\ 500) do
    # parametise this?
    opts = [timeout: timeout]

    case Socket.TCP.connect(host, port, opts) do
      {:error, reason} ->
        [host, port, "closed", "#{reason}"]

      {:ok, pid} ->
        Socket.Stream.close!(pid)
        [host, port, "open", "N/A"]
    end
  end
end
