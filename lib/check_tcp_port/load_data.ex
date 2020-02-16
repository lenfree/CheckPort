defmodule CheckTcpPort.LoadData do
  # Public API
  def read_file(file) do
    Path.join(File.cwd!(), file)
    |> load_file_to_yaml
  end

  # Private API
  def load_file_to_yaml(path) do
    YamlElixir.read_from_file(path)
  end
end
