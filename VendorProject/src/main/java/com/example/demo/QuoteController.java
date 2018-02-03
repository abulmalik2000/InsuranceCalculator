package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
public class QuoteController {



    @RequestMapping("/")
    public String getQuotePage(){
        return "quote";
    }
    
    @RequestMapping(value = "/getquote", method = RequestMethod.POST)
    @ResponseBody
    public String saveProduct(@RequestParam String name, @RequestParam String gender, @RequestParam int age,
    		@RequestParam(value="currentHealth[]", required=false) String[] currentHealth ,
    		@RequestParam(value="goodHabits[]", required=false) String[] goodHabits,
    		@RequestParam(value="badHabits[]", required=false) String[] badHabits) {
        Customer customer = new Customer();
        customer.setName(name);
        customer.setAge(age);
        customer.setGender(gender);
        
        customer.setCurrentHealth(currentHealth);
        customer.setBadHabits(badHabits);
        customer.setGoodHabits(goodHabits);
    		
        QuoteBuilder quoteBuilder = new QuoteBuilder(customer);
        return quoteBuilder.getQuote()+"";
    }
}
