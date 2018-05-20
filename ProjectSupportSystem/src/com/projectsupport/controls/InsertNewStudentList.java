package com.projectsupport.controls;

import java.io.File;
import java.security.*;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.projectsupport.models.Student;
import com.projectsupport.models.User;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.StudentServices;
import com.projectsupport.services.UserServices;

/**
 * Servlet implementation class InsertNewStudentList
 */
@WebServlet("/InsertNewStudentList")
@MultipartConfig(maxFileSize = 16177215)
public class InsertNewStudentList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger LOGGER = Logger.getLogger(InsertNewStudentList.class.getCanonicalName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertNewStudentList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Connection conn = MyUtils.getStoredConnection(request);
		User currentUser = MyUtils.getLoginedUser(session);
		String errorString = null;
		if (currentUser == null) {
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login");
			dispatcher.forward(request, response);
			return;
		}

		InputStream inputstream = null;
		OutputStream outputstream = null;
		PrintWriter writer = response.getWriter();
		Part filepart = request.getPart("studentlist");
		String fileName = null;
		String path = "/home/lakshan/git/projectSupportSystem/ProjectSupportSystem/WebContent/test";
		String partHeader = filepart.getHeader("content-disposition");
		LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
		for (String content : filepart.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				fileName = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}

		try {
			outputstream = new FileOutputStream(new File(path + File.separator + fileName));
			inputstream = filepart.getInputStream();
			int read = 0;
			final byte[] bytes = new byte[1024];
			while ((read = inputstream.read(bytes)) != -1) {
				outputstream.write(bytes, 0, read);
			}

			System.out.println("New file " + fileName + " created at " + path);
			LOGGER.log(Level.INFO, "File{0}being uploaded to {1}", new Object[] { fileName, path });
			File myFile = new File(
					"/home/lakshan/git/projectSupportSystem/ProjectSupportSystem/WebContent/test/studentList.xlsx");
			FileInputStream fis = new FileInputStream(myFile);
			XSSFWorkbook myWorkBook = new XSSFWorkbook(fis);
			XSSFSheet mySheet = myWorkBook.getSheetAt(0);
			Iterator<Row> rowIterator = mySheet.iterator();

			while (rowIterator.hasNext()) {
				Row row = rowIterator.next();
				Iterator<Cell> cellIterator = row.cellIterator();
				int i = 0;
				String[] oneRowData = new String[9];
				while (cellIterator.hasNext()) {
					DataFormatter formatter = new DataFormatter();
					Cell cell = cellIterator.next();
					switch (cell.getCellType()) {
					case Cell.CELL_TYPE_STRING:
						oneRowData[i] = formatter.formatCellValue(cell);
						i++;
						// System.out.print(cell.getStringCellValue() +
						// "\t");
						break;
					case Cell.CELL_TYPE_NUMERIC:
						oneRowData[i] = formatter.formatCellValue(cell);
						// System.out.print(cell.getNumericCellValue() +
						// "\t");
						i++;
						break;
					case Cell.CELL_TYPE_BOOLEAN:
						oneRowData[i] = formatter.formatCellValue(cell);
						// System.out.print(cell.getBooleanCellValue() +
						// "\t");
						i++;
						break;
					default:

					}
				}
				String stuId  = oneRowData[0];
				int studentId = Integer.parseInt(oneRowData[0]);
				String regNo = oneRowData[1];
				String nic = oneRowData[2];
				String fullName = oneRowData[3];
				String initial = oneRowData[4];
				String surName = oneRowData[5];
				String email = oneRowData[6];
				String telephoneNo = oneRowData[7];
				String password = oneRowData[2];
				Student newStudent = new Student();
				newStudent.setStudentId(studentId);
				newStudent.setRegNo(regNo);
				newStudent.setNic(nic);
				newStudent.setFullName(fullName);
				newStudent.setInitial(initial);
				newStudent.setSurName(surName);
				newStudent.setEmail(email);
				newStudent.setTelephoneNo(telephoneNo);
				newStudent.setPassword(password);

				try {
					StudentServices.insertStudent(conn, newStudent);
					UserServices.InsertUser(conn,stuId,nic, "student");
					System.out.println("Done at first row");

				} catch (Exception e) {
					RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/ShowInsertNewStudent?success=0");
					dispatcher.forward(request, response);
					errorString = e.getMessage();
					e.printStackTrace();
					return;
					
					//page =  "/ShowInsertNewStudent?success=0";
					

				}
				finally{
					if(fis != null){
						fis.close();
					}
				}
				
				
				
		} 
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/ShowInsertNewStudent?success=1");
			dispatcher.forward(request, response);
			return;
	

		} catch (Exception e) {
			errorString = e.getMessage();
			System.out.println(
					"You either did not specify a file to upload or are trying to upload a file to a protected or nonexistent location.");
			System.out.println("<br/> ERROr:" + e.getMessage());
			LOGGER.log(Level.SEVERE, "Problem during file upload. Error: {0}", new Object[] { e.getMessage() });
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/ShowInsertNewStudent?success=2");
			dispatcher.forward(request, response);
			return;
			

		} finally {
			if (outputstream != null) {
				outputstream.close();
			}
			
			if (inputstream != null) {
				inputstream.close();
			}
			if (writer != null) {
				writer.close();
			}
			
			

		}
		
		

	}
}
