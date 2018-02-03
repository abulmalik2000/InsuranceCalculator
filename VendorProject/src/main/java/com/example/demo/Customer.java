package com.example.demo;


public class Customer {

    private String name;

    private String gender;

    private int age;
    
    String [] currentHealth;

    String [] goodHabits;

    String [] badHabits;


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String[] getCurrentHealth() {
		return currentHealth;
	}

	public void setCurrentHealth(String[] currentHealth) {
		this.currentHealth = currentHealth;
	}

	public String[] getGoodHabits() {
		return goodHabits;
	}

	public void setGoodHabits(String[] goodHabits) {
		this.goodHabits = goodHabits;
	}

	public String[] getBadHabits() {
		return badHabits;
	}

	public void setBadHabits(String[] badHabits) {
		this.badHabits = badHabits;
	}

	
    
    

}
