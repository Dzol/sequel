defmodule Sequel.MixProject do
  use Mix.Project

  def project do
    [
      app: :sequel,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls]
    ] ++ aliases() ++ dialyzer()
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:dialyxir, "~> 0.5.1"},
      {:excoveralls, "~> 0.5.7"}
    ]
  end

  defp aliases do
    [
      aliases: [initialize: &initialize/1]
    ]
  end

  defp initialize(_) do
    unless File.exists?(".dialyzer") do
      File.mkdir!(".dialyzer")
    end
  end

  defp dialyzer do
    [dialyzer: [plt_core_path: ".dialyzer/"]]
  end
end
