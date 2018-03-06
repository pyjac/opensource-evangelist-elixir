defmodule Mix.Tasks.opensourceevangelist do
    use Mix.Task
    def run(_) do
        IO.inspect opensourceevangelist.get_evangelist("pyjac")
    end
end