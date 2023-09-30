# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN

  def test_pop!
    stack = Stack.new
    stack.push!(1)
    stack.push!(2)
    stack.push!(3)
    empty_stack = Stack.new
    assert { stack.pop! == 3 }
    assert { empty_stack.pop! == nil }
  end

  def test_push!
    stack = Stack.new
    stack.push!(1)
    stack.push!(2)
    stack.push!(3)
    empty_stack = Stack.new
    assert { stack.push!(4) == [1, 2, 3, 4] }
    assert { empty_stack.push!(4) == [4] }
  end

  def test_empty?
    stack = Stack.new
    stack.push!(1)
    stack.push!(2)
    stack.push!(3)
    empty_stack = Stack.new
    assert { !stack.empty? }
    assert { empty_stack.empty? }
  end

  def test_to_a
    stack = Stack.new
    stack.push!(1)
    stack.push!(2)
    stack.push!(3)
    empty_stack = Stack.new
    assert { stack.to_a.is_a?(Array) }
    assert { empty_stack.to_a.is_a?(Array) }
  end

  def test_clear!
    stack = Stack.new
    stack.push!(1)
    stack.push!(2)
    stack.push!(3)
    empty_stack = Stack.new
    assert { stack.clear! == [] }
    assert { empty_stack.clear! == [] }
  end

  def test_size
    stack = Stack.new
    stack.push!(1)
    stack.push!(2)
    stack.push!(3)
    empty_stack = Stack.new
    assert { stack.size == 3 }
    assert { empty_stack.size == 0 }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
