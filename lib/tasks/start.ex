defmodule Mix.Tasks.Start do
  use Mix.Task
  alias CheckTcpPort

  def run(_) do
    CheckTcpPort.open?()
  end
end
