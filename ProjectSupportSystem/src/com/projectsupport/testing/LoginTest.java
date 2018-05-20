/*package com.projectsupport.testing;

import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.Assert;
import org.testng.annotations.Test;


public class LoginTest {
	private WebDriver driver;
	@BeforeTest
	public void userLogin() throws InterruptedException {
		System.setProperty("webdriver.gecko.driver", "/home/lakshan/bin/geckodriver");
		driver = new FirefoxDriver();
		driver.manage().window().maximize();
		driver.get("http://localhost:8080/ProjectSupportSystem/login");
		Thread.sleep(3000);
	}
	
	@Test(dataProvider = "getData")
	public void validate(String username,String password,String url) throws InterruptedException{
		System.out.println(username+ "----"+ password );
		driver.findElement(By.id("username")).clear();
		driver.findElement(By.id("username")).sendKeys(username);
		
		driver.findElement(By.id("password")).clear();
		driver.findElement(By.id("password")).sendKeys(password);
		
		driver.findElement(By.id("submitlogin")).click();
		Thread.sleep(3000);
		Assert.assertEquals(driver.getCurrentUrl(),url);
		driver.get("http://localhost:8080/ProjectSupportSystem/login");
		
		
		
		
		//driver.quit();
		
		 
	}
	@DataProvider
	public Object[][] getData(){
		Object[][] credentials = { 
				{"15000753","test","http://localhost:8080/ProjectSupportSystem/userInfo"},
				{"15000722","password","http://localhost:8080/ProjectSupportSystem/doLogin"},
				{"pro01","test","http://localhost:8080/ProjectSupportSystem/userInfo"}
	
				
		};
		return credentials;
	}
	
	@AfterTest
	public void terminateBrowser(){
		driver.quit();
	}
	
	
}
*/