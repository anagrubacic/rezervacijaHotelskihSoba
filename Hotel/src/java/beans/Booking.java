/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans;

import java.sql.Date;


public class Booking {
    private int bookingId;
    private Date dateFrom;
    private Date dateTo;
    private int room;
    private int hotel;
    private int client;
    private int points;
    private double price;

    public Booking() {
    }

    public Booking(int bookingId, Date dateFrom, Date dateTo, int room, int hotel, int client, int points, double price) {
        this.bookingId = bookingId;
        this.dateFrom = dateFrom;
        this.dateTo = dateTo;
        this.room = room;
        this.hotel = hotel;
        this.client = client;
        this.points = points;
        this.price = price;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public Date getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }

    public Date getDateTo() {
        return dateTo;
    }

    public void setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }

    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
    }

    public int getHotel() {
        return hotel;
    }

    public void setHotel(int hotel) {
        this.hotel = hotel;
    }

    public int getClient() {
        return client;
    }

    public void setClient(int client) {
        this.client = client;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    
   
}
