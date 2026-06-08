package pixelmart.beans;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author khateeb
 */
public class CategoryInfo {
    private int catId;
    private String catName;
    private int subcatId;
    private String subcatName;
    
//    GETTERS & SETTERS
    public int getCatId() {
        return catId;
    }
    
    public void setCatId(int catId) {
        this.catId = catId;
    }
    
    public String getCatName() {
        return catName;
    }
    
    public void setCatName(String catName) {
        this.catName = catName;
    }
    
    public int getSubcatId() {
        return subcatId;
    }
    
    public void setSubcatId(int subcatId) {
        this.subcatId = subcatId;
    }
    
    public String getSubcatName() {
        return subcatName;
    }
    
    public void setSubcatName(String subcatName) {
        this.subcatName = subcatName;
    }
}
