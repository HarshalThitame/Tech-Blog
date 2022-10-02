/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblogs.entities;

/**
 *
 * @author harshal
 */
public class Admin 
{
    private int aId;
    private String aEmail;
    private String aPassword;
    private String aName;

    public Admin() {
    }

    public Admin(int aId, String aEmail, String aPassword, String aName) {
        this.aId = aId;
        this.aEmail = aEmail;
        this.aPassword = aPassword;
        this.aName = aName;
    }

    public Admin(String aEmail, String aPassword, String aName) {
        this.aEmail = aEmail;
        this.aPassword = aPassword;
        this.aName = aName;
    }

    public int getaId() {
        return aId;
    }

    public void setaId(int aId) {
        this.aId = aId;
    }

    public String getaEmail() {
        return aEmail;
    }

    public void setaEmail(String aEmail) {
        this.aEmail = aEmail;
    }

    public String getaPassword() {
        return aPassword;
    }

    public void setaPassword(String aPassword) {
        this.aPassword = aPassword;
    }

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }
    
    
}
