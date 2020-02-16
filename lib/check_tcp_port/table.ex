defmodule CheckTcpPort.Table do
  def generate_table(rows, env) do
    title = "TCP Check for #{env}"
    header = ["Host", "Port", "Status", "Reason"]

    rows
    |> print_table(header, title)
  end

  def print_table(rows, header, title) do
    TableRex.quick_render!(rows, header, title)
    |> IO.puts()
  end
end
