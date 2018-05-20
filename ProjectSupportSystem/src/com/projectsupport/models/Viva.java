package com.projectsupport.models;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.xmlrpc.base.Array;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class Viva{
	private String name;
	private int id;
	private String[] time;
	
	public String getName(){
		return name;
	}
	public void setName(String name){
		this.name = name;
	}
	
	public int getId(){
		return id;
	}
	public void setId( int id){
		this.id = id;
	}
	
	public String[] getTime(){
		return time;
	}
	public void setTime(String[] time){
		this.time = time;
	}

}
