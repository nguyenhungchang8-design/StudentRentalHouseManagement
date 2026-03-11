/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author PC
 */
public class Invoices {


    private int invoiceId;
    private int contractId;
    private int roomId;
    private int userId;

    private int billingMonth;
    private int billingYear;

    private double rentAmount;

    private double elecMeterStart;
    private double elecMeterEnd;
    private double elecUnitPrice;
    private double electricityCost;

    private double waterMeterStart;
    private double waterMeterEnd;
    private double waterUnitPrice;
    private double waterCost;

    private double serviceFee;
    private double otherFee;
    private String otherFeeNote;

    private double totalAmount;
    private double amountPaid;
    private Date dueDate;
    private String status;
    private Date createdAt;

    public Invoices() {
    }
    
    // getter setter

    public Invoices(int invoiceId, int contractId, int roomId, int userId, int billingMonth, int billingYear, double rentAmount, double elecMeterStart, double elecMeterEnd, double elecUnitPrice, double electricityCost, double waterMeterStart, double waterMeterEnd, double waterUnitPrice, double waterCost, double serviceFee, double otherFee, String otherFeeNote, double totalAmount, double amountPaid, Date dueDate, String status, Date createdAt) {
        this.invoiceId = invoiceId;
        this.contractId = contractId;
        this.roomId = roomId;
        this.userId = userId;
        this.billingMonth = billingMonth;
        this.billingYear = billingYear;
        this.rentAmount = rentAmount;
        this.elecMeterStart = elecMeterStart;
        this.elecMeterEnd = elecMeterEnd;
        this.elecUnitPrice = elecUnitPrice;
        this.electricityCost = electricityCost;
        this.waterMeterStart = waterMeterStart;
        this.waterMeterEnd = waterMeterEnd;
        this.waterUnitPrice = waterUnitPrice;
        this.waterCost = waterCost;
        this.serviceFee = serviceFee;
        this.otherFee = otherFee;
        this.otherFeeNote = otherFeeNote;
        this.totalAmount = totalAmount;
        this.amountPaid = amountPaid;
        this.dueDate = dueDate;
        this.status = status;
        this.createdAt = createdAt;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBillingMonth() {
        return billingMonth;
    }

    public void setBillingMonth(int billingMonth) {
        this.billingMonth = billingMonth;
    }

    public int getBillingYear() {
        return billingYear;
    }

    public void setBillingYear(int billingYear) {
        this.billingYear = billingYear;
    }

    public double getRentAmount() {
        return rentAmount;
    }

    public void setRentAmount(double rentAmount) {
        this.rentAmount = rentAmount;
    }

    public double getElecMeterStart() {
        return elecMeterStart;
    }

    public void setElecMeterStart(double elecMeterStart) {
        this.elecMeterStart = elecMeterStart;
    }

    public double getElecMeterEnd() {
        return elecMeterEnd;
    }

    public void setElecMeterEnd(double elecMeterEnd) {
        this.elecMeterEnd = elecMeterEnd;
    }

    public double getElecUnitPrice() {
        return elecUnitPrice;
    }

    public void setElecUnitPrice(double elecUnitPrice) {
        this.elecUnitPrice = elecUnitPrice;
    }

    public double getElectricityCost() {
        return electricityCost;
    }

    public void setElectricityCost(double electricityCost) {
        this.electricityCost = electricityCost;
    }

    public double getWaterMeterStart() {
        return waterMeterStart;
    }

    public void setWaterMeterStart(double waterMeterStart) {
        this.waterMeterStart = waterMeterStart;
    }

    public double getWaterMeterEnd() {
        return waterMeterEnd;
    }

    public void setWaterMeterEnd(double waterMeterEnd) {
        this.waterMeterEnd = waterMeterEnd;
    }

    public double getWaterUnitPrice() {
        return waterUnitPrice;
    }

    public void setWaterUnitPrice(double waterUnitPrice) {
        this.waterUnitPrice = waterUnitPrice;
    }

    public double getWaterCost() {
        return waterCost;
    }

    public void setWaterCost(double waterCost) {
        this.waterCost = waterCost;
    }

    public double getServiceFee() {
        return serviceFee;
    }

    public void setServiceFee(double serviceFee) {
        this.serviceFee = serviceFee;
    }

    public double getOtherFee() {
        return otherFee;
    }

    public void setOtherFee(double otherFee) {
        this.otherFee = otherFee;
    }

    public String getOtherFeeNote() {
        return otherFeeNote;
    }

    public void setOtherFeeNote(String otherFeeNote) {
        this.otherFeeNote = otherFeeNote;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public double getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(double amountPaid) {
        this.amountPaid = amountPaid;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
}

