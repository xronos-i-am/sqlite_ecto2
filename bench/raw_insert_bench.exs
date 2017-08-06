Code.require_file "../test/support/schemas.exs", __DIR__

defmodule RawInsert do
  use Benchfella
  use Ecto.Integration.Case, async: Application.get_env(:ecto, :async_integration_tests, true)

  @list Enum.to_list(1..1000)

  # setup_all do
  #   depth = :erlang.system_flag(:backtrace_depth, 100)
  #   {:ok, depth}
  # end

  teardown_all depth do
    :erlang.system_flag(:backtrace_depth, depth)
  end

  bench "hello list" do
    Enum.reverse @list
  end
end
