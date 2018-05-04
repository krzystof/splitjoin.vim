require 'spec_helper'

describe "elixir" do
  let(:filename) { 'elixir.ex' }

  def setup_elixir_filetype
    vim.set(:filetype, 'elixir')
    vim.set(:expandtab)
    vim.set(:shiftwidth, 2)
  end

  def set_elixir_contents(content)
    set_file_contents(content)
    setup_elixir_filetype
  end

  specify "do blocks" do
    set_elixir_contents <<-EOF
      def some_function(with, args), do: some_computation
    EOF

    vim.search 'do'
    split

    assert_file_contents <<-EOF
      def some_function(with, args) do
        some_computation
      end
    EOF

    join

    assert_file_contents <<-EOF
      def some_function(with, args), do: some_computation
    EOF
  end

  specify "single pipeline operator" do
    set_elixir_contents <<-EOF
      a_function(with, args)
    EOF

    vim.search 'fun'
    split

    assert_file_contents <<-EOF
      with
      |> a_function(args)
    EOF

    join

    assert_file_contents <<-EOF
      a_function(with, args)
    EOF
  end

  describe "multiple pipeline operator" do
    pending
  end

  describe "assignement" do
    pending
  end

  specify "list" do
    set_elixir_contents <<-EOF
      foo = [bar, baz]
    EOF

    vim.search 'bar'
    split

    assert_file_contents <<-EOF
      foo = [
        bar,
        baz
      ]
    EOF

    join

    assert_file_contents <<-EOF
      foo = [bar, baz]
    EOF
  end

  describe "map" do
    pending
  end

  describe "lambda" do
    pending
  end

  describe "args" do
    pending
  end
end
