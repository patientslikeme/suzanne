require "test_helper"

class SuzanneTest < Minitest::Test

  def test_env_is_suzanne_env
    assert_equal Suzanne::Env, Suzanne.env
  end

  def test_configure_sets_env_if_nil
    assert_nil ENV["ROSINE"]
    load_config
    assert_equal "hello", ENV["ROSINE"]
  end

  def test_configure_does_not_overwrite_env
    ENV["ROSINE"] = "foo"
    load_config
    assert_equal "foo", ENV["ROSINE"]
  end

  def test_configure_excludes_hashes
    load_config
    assert_nil ENV["HASH_ENTRY"]
  end

end
