package com.fcbyk.javase.grammar;

public class Variables {
    public void var(){
        // #region var
        int a = 16;
        double b = 10.1;
        Object c = new Object();

        int d,e,f,g;
        d = 100;
        e = 400;

        String h = "hello", i = "world";
        // #endregion var
    }

    public void constVar(){
        // #region const
        final int A = 16;
        final double B = 10.1;
        final Object C = new Object();

        final String H = "hello", I = "world";
        // #endregion const
    }
}
