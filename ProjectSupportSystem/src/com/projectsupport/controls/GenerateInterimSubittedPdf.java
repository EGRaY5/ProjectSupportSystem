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

import com.itextpdf.text.Anchor;
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
import com.projectsupport.models.InterimReport;
import com.projectsupport.services.InterimReportServices;
import com.projectsupport.services.MyUtils;


/**
 * Servlet implementation class GenerateInterimSubittedPdf
 */
@WebServlet("/GenerateInterimSubittedPdf")
public class GenerateInterimSubittedPdf extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateInterimSubittedPdf() {
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
		List<InterimReport> intermList = null;
		try {
			intermList = InterimReportServices.getInterimSubmittedList(conn);
			System.out.println("inside try sql from generate SubmittedList");
		} catch (SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
		}
		try {
			//adding header to the pdf
			PdfWriter.getInstance(doc, os);
			doc.addAuthor("InterimSubmittedList");
			doc.addCreationDate();
			doc.addProducer();
			doc.addCreator("MySampleCode.com");
			doc.addTitle("Report with Column Headings");
			doc.setPageSize(PageSize.LETTER);
			doc.open();
			doc.newPage();
			doc.add(new Paragraph("Eligible Students List For Dissertation Submission 2017", catFont));
			//setting table for pdf
			float[] columnWidths = {0.5f,2f};
			PdfPTable table = new PdfPTable(columnWidths);
			PdfPCell c1 = new PdfPCell(new Phrase("*"));
			c1.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(c1);
			PdfPCell c2 = new PdfPCell(new Phrase("Index No"));
			c2.setHorizontalAlignment(Element.ALIGN_CENTER); 
			table.addCell(c2);
			int k = 1;
			for(InterimReport interim: intermList) {
			   
			    String stuId =Integer.toString(interim.getStudentId());
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
			doc.add(table);
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
