package com.example.demo;

public class QuoteBuilder {
	
	private Customer customer;
	
	public QuoteBuilder(Customer customer) {
		this.customer = customer;
	}
	
	public float getQuote() {
		float premium = priceBasedonAge();
		premium = priceBasedonGender(premium);
		premium = priceBasedonHealthCondition(premium);
		premium = priceBasedonBadHabit(premium);
		premium = priceBasedonGoodHabit(premium);
		return premium;
	}
	
    private float priceBasedonAge() {
    		float premium =  5000f;
        if (customer.getAge() >= 18) {
        	premium *= 1.1;
        }
        if (customer.getAge() >= 25) {
        	premium *= 1.1;
        }
        if (customer.getAge() >= 30) {
        	premium *= 1.1;
        }
        if (customer.getAge() >= 35) {
        	premium *= 1.1;
        }
        if (customer.getAge() >= 40) {
            int age = customer.getAge() - 40;
            while (age >= 5) {
            	premium *= 1.2;
                age -= 5;
            }
        }
        return premium;
    }

    /**
     * 
     * @param premium
     * @return
     */
    private float priceBasedonGender(float premium) {
	    if (customer.getGender().equals("Male")) {
	    		premium *= 1.02;
	    }
	    return premium;
    }
	
    /**
     * 
     * @param premium
     * @return
     */
    private float priceBasedonHealthCondition(float premium) {
    		for(String health : customer.currentHealth) {
    			premium *= 1.01;
    		}
	    return premium;
    }
    
    /**
     * 
     * @param premium
     * @return
     */
    private float priceBasedonGoodHabit(float premium) {
    		for(String habit : customer.getGoodHabits()) {
    			premium *= 0.97;
    		}
	    return premium;
    }
    
    /**
     * 
     * @param premium
     * @return
     */
    private float priceBasedonBadHabit(float premium) {
    		for(String habit : customer.getBadHabits()) {
    			premium *= 1.03;
    		}
	    return premium;
    }
    
}
