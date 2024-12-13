package com.fcbyk.javase.grammar;

// #region f
class Human {
    public String name;
    private int age;
    protected double height;

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
    public double getHeight() { return height; }
    public void setHeight(double height) { this.height = height; }
}
// #endregion f

class Teacher extends Human {
    private double salary ;
}