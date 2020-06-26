require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'near_earth_objects'

class NearEarthObjectsTest < Minitest::Test

  def setup
    @neos = NearEarthObjects.new("1997-06-08")
  end

  def test_it_exists
    assert_instance_of NearEarthObjects, @neos
  end

  def test_it_can_return_largest_asteroid_diameter
    assert_equal 1778, @neos.largest_asteroid_diameter
  end

  def test_it_can_return_total_number_of_asteroids
    assert_equal 7, @neos.total_number_of_asteroids
  end

  def test_it_can_return_formatted_asteroid_data

    data = [{:name=>"(2017 JJ2)", :diameter=>"186 ft", :miss_distance=>"27810728 miles"},
      {:name=>"(2014 FW32)", :diameter=>"77 ft", :miss_distance=>"41477193 miles"},
      {:name=>"(2008 HS3)", :diameter=>"891 ft", :miss_distance=>"19698307 miles"},
      {:name=>"(2013 XS3)", :diameter=>"1778 ft", :miss_distance=>"26028460 miles"},
      {:name=>"(2011 BM45)", :diameter=>"933 ft", :miss_distance=>"14449683 miles"},
      {:name=>"528159 (2008 HS3)", :diameter=>"933 ft", :miss_distance=>"19698304 miles"},
      {:name=>"(2019 TK6)", :diameter=>"537 ft", :miss_distance=>"29825601 miles"}]


    assert_equal data, @neos.formatted_asteroid_data
  end

  def test_it_can_return_asteroid_details

    details = {asteroid_list: @neos.formatted_asteroid_data, biggest_asteroid: 1778, total_number_of_asteroids: 7}
    assert_equal details, @neos.asteroid_details
  end
end
