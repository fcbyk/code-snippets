package com.fcbyk.springframework;

import com.fcbyk.springframework.bean.Book;
import org.junit.Test;

// #region index
public class TestDI {

    // private Book book = new Book("数据结构");

    // 使用DI，实现解耦
    private Book book;

    // 需要提供set方法
    public void setBook(Book book) { this.book = book; }

    @Test
    public void test(){
        book.test();
        System.out.print(book);
    }
}
// #endregion index