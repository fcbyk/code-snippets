package com.fcbyk.javase.grammar;

public class Control {

    // 分支
    public void ifStatement() {
        // #region if
        int a = 10;
        if (a == 100) a = a * 100;
        else if ( a >=50) a = a + 100;
        else a--;

        switch (a){
            case 200:
            case 100: a = a * 100; break;
            case 50: a = a + 100; break;
            default: a--;
        }
        // #endregion if
    }

    // 循环
    public void whileStatement() {
        // #region while
        int i = 0;
        while (i < 5) i++;
        do i++; while (i < 100);

        for (int k = 0; k < 5; k++) System.out.println(k);
        // #endregion while
    }

    // 跳转
    // #region return
    public int processNumbers(int sum) {

        for (int i = 1; i <= 100; i++) {
            if (i == 5) continue;
            if (i == 8) break;
            if (sum > 150) return sum;
            sum += i;
        }

        return sum;
    }
    // #endregion return

    // 标签
    public void labeledStatement() {
        // #region labeled
        outerLoop:
        for (int p = 0; p < 3; p++) {
            for (int q = 0; q < 3; q++) {
                if (p == 1 && q == 1) {
                    break outerLoop; // 跳出到外层循环
                }
            }
        }
        // #endregion labeled
    }
}
