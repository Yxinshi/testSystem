package com.bgs.examinationbackstage.pojo;



public class User {

  private long id;
  private String name;
  private long jobNumber;
  private String identityUser;
  private long accountNumber;
  private String password;
  private String phone;
  private long roleId;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public long getJobNumber() {
    return jobNumber;
  }

  public void setJobNumber(long jobNumber) {
    this.jobNumber = jobNumber;
  }


  public String getIdentityUser() {
    return identityUser;
  }

  public void setIdentityUser(String identityUser) {
    this.identityUser = identityUser;
  }


  public long getAccountNumber() {
    return accountNumber;
  }

  public void setAccountNumber(long accountNumber) {
    this.accountNumber = accountNumber;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }


  public long getRoleId() {
    return roleId;
  }

  public void setRoleId(long roleId) {
    this.roleId = roleId;
  }

}
