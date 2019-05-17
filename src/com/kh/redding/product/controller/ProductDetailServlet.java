package com.kh.redding.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.product.model.service.ProductService;
import com.kh.redding.product.model.vo.Product;
import com.kh.redding.product.model.vo.UseProduct;

@WebServlet("/proDetail.pr")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("상품 상세 서블릿~");
		//pno을 가져와야 한다.
		int pno = Integer.parseInt(request.getParameter("pno"));
		System.out.println(pno);
		
		//상품 1개의 대한 정보 들고 오기
		Product product = new ProductService().selectProductOne(pno);
		
		System.out.println(product.getcNo());
		
		//해당 상품의 제품 전체 list 들고오기
		ArrayList<UseProduct> useProList = new ProductService().selectUseProductList(product.getpNo());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
