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

  describe "pipeline operator" do
    specify "with 1 arg" do
      set_elixir_contents <<-EOF
        a_function(with)
      EOF

      vim.search 'with'
      split

      assert_file_contents <<-EOF
        with
        |> a_function()
      EOF

      join

      assert_file_contents <<-EOF
        a_function(with)
      EOF
    end

    specify "with 2 args" do
      set_elixir_contents <<-EOF
        a_function(with, args)
      EOF

      vim.search 'with'
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

    specify "with a nested function call" do
      set_elixir_contents <<-EOF
        a_function(with(some_other(func)), args)
      EOF

      vim.search 'with'
      split

      assert_file_contents <<-EOF
        with(some_other(func))
        |> a_function(args)
      EOF

      join

      assert_file_contents <<-EOF
        a_function(with(some_other(func)), args)
      EOF
    end
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
