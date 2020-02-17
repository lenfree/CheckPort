defmodule Mix.Tasks.Start do
  @shortdoc "Run tcp check on list of hosts with arg: --file <file.yml> --timeout <int_seconds>, defaults to 3 seconds"
  use Mix.Task
  alias CheckTcpPort

  def run(args) do
    args
    |> parse_args
    |> CheckTcpPort.open?()
    |> parse_result
  end

  def parse_result(:error) do
    IO.puts(
      "Error: Please try again with \n'mix start --timeout <time_seconds> --file <file.yml>'"
    )
  end

  def parse_result(_) do
  end

  def parse_args(args) do
    options = %{
      :file => nil,
      :timeout => 3
    }

    {opts, _args} =
      OptionParser.parse_head!(args,
        strict: [
          timeout: :integer,
          file: :string
        ]
      )

    Enum.into(opts, options)
  end
end
