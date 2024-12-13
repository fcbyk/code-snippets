package com.fcbyk.javase.grammar;

public class Encapsulation {
}

class Phone{

    // #region pr
    // 将类的某些信息隐藏在类内部，不允许外部程序直接访问
    // 而是通过该类提供的方法来实现对隐藏信息的操作和访问
    private String number;
    private String logo;
    private int price;
    // #endregion pr

    // #region set
    public void setNumber(String number) {
        this.number = number;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }
    // #endregion set

    // #region get
    public String getNumber() {
        return this.number;
    }

    public int getPrice() {
        return this.price;
    }

    public String getLogo() {
        return this.logo;
    }
    // #endregion get

}
