package model;

public class Order {
    private int idbuy;
    private String namebuy;
    private long pricebuy;
    private String descriptionbuy;
    private String imagebuy;
    private int amountbuy;

    public Order(int idbuy, String namebuy, long pricebuy, String descriptionbuy, String imagebuy, int amountbuy) {
        this.idbuy = idbuy;
        this.namebuy = namebuy;
        this.pricebuy = pricebuy;
        this.descriptionbuy = descriptionbuy;
        this.imagebuy = imagebuy;
        this.amountbuy = amountbuy;
    }
    public int getIdbuy() {
        return idbuy;
    }
    public void setIdbuy(int idbuy) {
        this.idbuy = idbuy;
    }
    public String getNamebuy() {
        return namebuy;
    }
    public void setNamebuy(String namebuy) {
        this.namebuy = namebuy;
    }
    public long getPricebuy() {
        return pricebuy;
    }
    public void setPricebuy(long pricebuy) {
        this.pricebuy = pricebuy;
    }
    public String getDescriptionbuy() {
        return descriptionbuy;
    }
    public void setDescriptionbuy(String descriptionbuy) {
        this.descriptionbuy = descriptionbuy;
    }
    public String getImagebuy() {
        return imagebuy;
    }
    public void setImagebuy(String imagebuy) {
        this.imagebuy = imagebuy;
    }
    public int getAmountbuy() {
        return amountbuy;
    }
    public void setAmountbuy(int amountbuy) {
        this.amountbuy = amountbuy;
    }
}