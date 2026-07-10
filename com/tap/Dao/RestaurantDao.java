package com.tap.Dao;

import java.util.List;
import com.tap.Model.Restaurant;

public interface RestaurantDao {

    List<Restaurant> getAllRestaurants();

    Restaurant getRestaurant(int restaurantId);

    int addRestaurant(Restaurant restaurant);

    int updateRestaurant(Restaurant restaurant);

    int deleteRestaurant(int restaurantId);

}