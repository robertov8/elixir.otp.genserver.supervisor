defmodule Sequence.Stash do
  use GenServer
  @me __MODULE__

  def start_link(initial_number), do: GenServer.start_link(@me, initial_number, name: @me)

  def get, do: GenServer.call(@me, {:get})

  def update(new_number), do: GenServer.cast(@me, {:update, new_number})

  # Server implementation
  def init(initial_number), do: {:ok, initial_number}

  def handle_call({:get}, _from, current_number), do: {:reply, current_number, current_number}

  def handle_cast({:update, new_number}, _current_number), do: {:noreply, new_number}
end
