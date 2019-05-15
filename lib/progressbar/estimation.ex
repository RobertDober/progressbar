defmodule Progressbar.Estimation do
  
  defstruct expected_size: 0,
          current_size: 0,
          aging_factor: 0.8,
          velocity: 0.0,
          last_ts: nil

  @doc """
  Creates a new `Progressbar.Estimation` struct containing `expected_size` set from
  the `size` parameter.

  Other parameters can be set via the `options` parameter.


      iex(0)> new(1000)
      %Progressbar.Estimation{expected_size: 1000,
        current_size: 0,
        aging_factor: 0.8,
        velocity: 0.0,
        last_ts: nil}
  """
  def new(size, options \\ []) do
    struct(
      __MODULE__,
      options
      |> Enum.into(%{expected_size: size})
    )
  end

  @doc """
  Prepares an estimation by _starting_ the process, meaning that the
  key `last_ts` will be set to `Time.utc_now`
      
        iex(1)> est = start_calculation(%Progressbar.Estimation{})
        ...(1)> Time.diff(Time.utc_now, est.last_ts) < 2 
        true

  """
  def start_calculation(estimation) do
    %{estimation | last_ts: Time.utc_now}
  end
end
