package service;

import model.City;

import java.util.ArrayList;

public class CityService {
    private static final ArrayList<City> cities;
    private static final ArrayList<String> countries;

    static {
        cities = new ArrayList<>();
        countries = new ArrayList<>();
        cities.add(new City(1, "Ha Noi", 3359, 7000000, 10000000, "Viet Nam"));
        cities.add(new City(2, "New York", 784, 11000000, 25000000, "United State"));
        countries.add("Japan");
        countries.add("Viet Nam");
        countries.add("United State");
        countries.add("Korea");
        countries.add("Germany");
    }

    public ArrayList<String> getCountries() {
        return countries;
    }

    public ArrayList<City> getCities() {
        return cities;
    }

    public City getCity(int id) {
        for (City city : cities) {
            if (city.getId() == id) {
                return city;
            }
        }
        return null;
    }

    public void createCity(City city) {
        cities.add(city);
    }

    public void deleteCity(City city) {
        cities.remove(city);
    }

    public void editCity(int index, City city) {
        cities.set(index, city);
    }
}
