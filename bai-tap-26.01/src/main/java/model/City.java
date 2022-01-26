package model;

public class City {
    private int id;
    private String name;
    private double area;
    private int population;
    private int GDP;
    private String country;

    public City(int id, String name, double area, int population, int GDP, String country) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.population = population;
        this.GDP = GDP;
        this.country = country;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public int getPopulation() {
        return population;
    }

    public void setPopulation(int population) {
        this.population = population;
    }

    public int getGDP() {
        return GDP;
    }

    public void setGDP(int GDP) {
        this.GDP = GDP;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Override
    public String toString() {
        return "City{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", area=" + area +
                ", population=" + population +
                ", GDP=" + GDP +
                ", country='" + country + '\'' +
                '}';
    }
}
