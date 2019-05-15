defmodule Progressbar.EstimationTest do
  use ExUnit.Case
  alias Progressbar.Estimation
  doctest Estimation, import: true

  describe "Estimation" do
    test "is a struct with the following fields" do
      case %Estimation{} do
        %{expected_size: 0, current_size: 0,
          aging_factor: 0.8,
          velocity: 0.0,
          last_ts: nil} ->
          assert true
        e -> assert false, "Default struct did not meet expectations:\n#{inspect e}"
      end
    end

    test "can be constructed with a given expected size" do
      est = Estimation.new(1000)
      case est do
        %{expected_size: 1000, current_size: 0,
          aging_factor: 0.8,
          velocity: 0.0,
          last_ts: nil} ->
          assert true
        e -> assert false, "Default struct did not meet expectations:\n#{inspect e}"
      end
    end

    test "is updated with first data" do
    end
  end
end
