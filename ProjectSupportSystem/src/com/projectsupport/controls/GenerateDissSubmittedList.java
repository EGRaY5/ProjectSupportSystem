package com.projectsupport.controls;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.projectsupport.models.Dissertation;
import com.projectsupport.services.DissertationServices;
import com.projectsupport.services.MyUtils;

/**
 * Servlet implementation class GenerateDissSubmittedList
 */
@WebServlet("/GenerateDissSubmittedList")
public class GenerateDissSubmittedList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateDissSubmittedList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String fileName = "/home/lakshan/git/projectSupportSystem/ProjectSupportSystem/WebContent/interimSubmitted.pdf";
				Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
				//Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.BOLD);
				ServletOutputStream os = response.getOutputStream();
				response.setContentType("application/pdf"); 
				Document doc = new Document();
				
				String errorString = null;
				Connection conn = MyUtils.getStoredConnection(request);
				List<Dissertation> dissertationList = null;
				try {
					dissertationList = DissertationServices.getDissertationSubmittedList(conn);
					//System.out.println("inside try sql from generate SubmittedList");
				} catch (SQLException e){
					e.printStackTrace();
					errorString = e.getMessage();
				}
				try {
					PdfWriter.getInstance(doc, os);
					//adding meta data for the pdf
					doc.addAuthor("Dissertation Submitted List");
					doc.addCreationDate();
					doc.addProducer();
					doc.addCreator("bit_coordinator");
					doc.addTitle("Report with Column Headings");
					doc.setPageSize(PageSize.LETTER);
					doc.open();
					doc.newPage();
					//settting header for the pdf
					doc.add(new Paragraph("Eligible Students List For Final Evaluation 2017", catFont));
					//settings for table in pdf
					float[] columnWidths = {0.5f,2f};
					PdfPTable table = new PdfPTable(columnWidths);
					PdfPCell c1 = new PdfPCell(new Phrase("*"));
					c1.setHorizontalAlignment(Element.ALIGN_CENTER);
					table.addCell(c1);
					PdfPCell c2 = new PdfPCell(new Phrase("Index No"));
					c2.setHorizontalAlignment(Element.ALIGN_CENTER); 
					table.addCell(c2);
					int k = 1;
					for(Dissertation diss: dissertationList) {
					   
					    String stuId =Integer.toString(diss.getStudentId());
					    String s = Integer.toString(k);
					    table.addCell(s);
					    table.addCell(stuId);
					    k++;
					  /*  Anchor anchor = new Anchor(stuId.trim(),smallBold);
					    anchor.setReference("#" + s.trim());
					    doc.add(anchor);*/
					    doc.add(Chunk.NEWLINE);
					    
					    /*table.addCell(s);
				        table.addCell(stuId);*/
					}
					doc.add(table); //add that table to the database
					doc.close(); 
				} catch (DocumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
