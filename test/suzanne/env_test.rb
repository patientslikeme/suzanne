require 'test_helper'

class Suzanne::EnvTest < Minitest::Test

  def test_can_read_with_uppercase
    load_config
    assert_equal "hello", Suzanne.env.ROSINE
  end

  def test_can_read_with_lowercase
    load_config
    assert_equal "hello", Suzanne.env.rosine
  end

  def test_boolean_true_is_true
    load_config
    assert_equal true, Suzanne.env.truthy1?
  end

  def test_boolean_t_is_true
    load_config
    assert_equal true, Suzanne.env.truthy2?
  end

  def test_boolean_one_is_true
    load_config
    assert_equal true, Suzanne.env.truthy3?
  end

  def test_boolean_blank_is_false
    load_config
    assert_equal false, Suzanne.env.false1?
  end

  def test_boolean_other_value_is_false
    load_config
    assert_equal false, Suzanne.env.rosine?
  end

  def test_missing_key_raises_exception
    load_config
    assert_raises(NoMethodError) { Suzanne.env.not_a_key }
  end

  def test_boolean_missing_key_raises_exception
    load_config
    assert_raises(NoMethodError) { Suzanne.env.not_a_key? }
  end

end
